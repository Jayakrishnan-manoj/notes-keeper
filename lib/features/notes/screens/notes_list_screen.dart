import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/models/note_model.dart';
import 'package:notes_keeper/features/notes/widgets/notes_tile.dart';
import 'package:notes_keeper/shared/DI/locator.dart';
import 'package:provider/provider.dart';

import '../../../shared/providers/notes_provider.dart';

@RoutePage()
class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = locator<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Keeper"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.expand,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.router.pushNamed('/add');
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            Text(
              "Add Note",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          child: Consumer<NotesProvider>(
            builder: (context, notesProvider, _) {
              notesProvider.getNoteList();
              final notes = notesProvider.notes;
              if (notes.isEmpty) {
                return const Center(
                  child: Text("No notes available"),
                );
              }
              return ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.transparent,
                    child: NotesTile(note: notes[index]),
                  );
                },
              );
            },
          )),
    );
  }
}
