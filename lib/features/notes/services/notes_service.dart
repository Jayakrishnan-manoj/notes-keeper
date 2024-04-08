import 'dart:async';
import 'dart:convert';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../models/note_model.dart';

class NoteService {
  static const _notesKey = 'notes';
  final StreamingSharedPreferences _preferences;

  NoteService(this._preferences);

  // Retrieves all notes from SharedPreferences
  Stream<List<NoteModel>> getNotes() {
    try {
      final notesStream =
          _preferences.getStringList(_notesKey, defaultValue: []);
      return notesStream.map((noteStrings) => noteStrings
          .map((noteJson) => NoteModel.fromJson(json.decode(noteJson)))
          .toList());
    } catch (e) {
      throw e.toString();
    }
  }

  // Adds a new note
  Future<void> addNote(String content) async {
    try {
      final notes = await getNotes().first;
      print(notes);
      final newNote = NoteModel.generate(content);
      notes.add(newNote);
      await _saveNotes(notes);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> editNote(String noteId, String content) async {
    try {
      final notes = await getNotes().first;
      print(notes);
      final noteIndex = notes.indexWhere((note) => note.id == noteId);
      if (noteIndex != -1) {
        notes[noteIndex] = notes[noteIndex].copyWith(content: content);
      }
      await _saveNotes(notes);
    } catch (e) {
      throw e.toString();
    }
  }

  // Removes a note
  Future<void> removeNote(String noteId) async {
    try {
      final notes = await getNotes().first;
      notes.removeWhere((note) => note.id == noteId);
      await _saveNotes(notes);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> _saveNotes(List<NoteModel> notes) async {
    try {
      final noteJsonList = notes.map((note) => note.toJson()).toList();
      final noteStringList =
          noteJsonList.map((noteJson) => json.encode(noteJson)).toList();
      await _preferences.setStringList(_notesKey, noteStringList);
    } catch (e) {
      throw e.toString();
    }
  }
}
