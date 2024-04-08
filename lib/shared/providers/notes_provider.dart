import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/models/note_model.dart';
import 'package:notes_keeper/features/notes/services/notes_service.dart';

class NotesProvider extends ChangeNotifier{
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  final NotesService _service;
  NotesProvider(this._service);

  Future<void> addNote(String content) async{
    final newNote = NoteModel.generate(content);
    _notes.add(newNote);
    await _service.saveNote(newNote);
    notifyListeners();
  }

  Future<void> saveNotes(List<NoteModel> notes) async {
    await _service.saveNoteList(notes);
  }

  Future<void> getNoteList() async {
    _notes = await _service.getNoteList();
    notifyListeners();
  }

  Future<void> deleteNotes(String id) async {
    await _service.deleteNotes(id, _notes);
    notifyListeners();
  }

  Future<void> getNotes() async {
    _notes = await _service.getNotes(_notes);
    notifyListeners();
  }



}