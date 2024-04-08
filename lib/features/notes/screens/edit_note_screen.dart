import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/models/note_model.dart';
import 'package:notes_keeper/shared/utils/helpers.dart';

import '../../../shared/DI/locator.dart';
import '../../../shared/providers/notes_provider.dart';

@RoutePage()
class EditNoteScreen extends StatefulWidget {
  final NoteModel note;
  const EditNoteScreen({super.key, @PathParam('note') required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController _editNoteController = TextEditingController();

  @override
  void initState() {
    _editNoteController.text = widget.note.content;
    super.initState();
  }

  @override
  void dispose() {
    _editNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
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
                  controller: _editNoteController,
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
                  locator<NotesProvider>()
                      .editNote(widget.note.id!, _editNoteController.text);
                  showSnackbar(context, "Note Edited!", Colors.green);
                  Navigator.of(context).pop();
                } catch (e) {
                  showSnackbar(context, "Editing Failed", Colors.red);
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("Save Note"),
            )
          ],
        ),
      ),
    );
  }
}
