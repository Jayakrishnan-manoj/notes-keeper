import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/widgets/notes_tile.dart';
import 'package:notes_keeper/shared/DI/locator.dart';
import 'package:provider/provider.dart';

import '../../../shared/providers/notes_provider.dart';

@RoutePage()
class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  static const navigateToAddNoteButtonKey = Key('navigateToAddNote');

  @override
  Widget build(BuildContext context) {

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
        key: navigateToAddNoteButtonKey,
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
          builder: (context, provider, child) {
            final notes = provider.notes; // Get the list of notes
            if (notes.isEmpty) {
              return const Center(
                child: Text("No notes added"),
              );
            }
            // Use ListView.builder to display notes
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  elevation: 5,
                  shadowColor: Colors.transparent,
                  child: NotesTile(
                    note: note,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
