import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/widgets/notes_tile.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Keeper"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.expand,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shadowColor: Colors.transparent,
              child: NotesTile(),
            );
          },
        ),
      ),
    );
  }
}
