import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/shared/providers/notes_provider.dart';
import 'package:notes_keeper/shared/utils/helpers.dart';

import '../../../shared/DI/locator.dart';

@RoutePage()
class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = locator<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: _noteController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: "Enter your note here...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                try {
                  _noteController.text.isNotEmpty
                      ? locator<NotesProvider>()
                          .addNote(_noteController.text)
                          .whenComplete(() {
                          showSnackbar(context, "Note Added!", Colors.green);
                          context.router.pop();
                        })
                      : showSnackbar(
                          context, "Note cannot be empty", Colors.red);
                } catch (e) {
                  showSnackbar(context, "Could not add Note", Colors.red);
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Note"),
            )
          ],
        ),
      ),
    );
  }
}
