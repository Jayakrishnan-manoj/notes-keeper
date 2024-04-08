import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/models/note_model.dart';
import 'package:notes_keeper/features/notes/services/notes_service.dart';

class NotesProvider extends ChangeNotifier {
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  final NoteService _service;

  NotesProvider(this._service) {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    try {
      _notes = await _service.getNotes().first;
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error loading notes: $e');
    }
  }

  Future<void> addNote(String content) async {
    try {
      await _service.addNote(content);
      notifyListeners();
      await _loadNotes(); // Refresh the list of notes after adding
    } catch (e) {
      // Handle error
      print('Error adding note: $e');
    }
  }

  Future<void> editNote(String noteId,String content) async {
    try {
      await _service.editNote(noteId, content);
      await _loadNotes(); // Refresh the list of notes after editing
    } catch (e) {
      // Handle error
      print('Error editing note: $e');
    }
  }

  Future<void> removeNote(String noteId) async {
    try {
      await _service.removeNote(noteId);
      await _loadNotes(); // Refresh the list of notes after removing
    } catch (e) {
      // Handle error
      print('Error removing note: $e');
    }
  }
}