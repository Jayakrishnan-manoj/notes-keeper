import 'package:flutter/material.dart';
import 'package:notes_keeper/features/notes/models/note_model.dart';
import 'package:notes_keeper/shared/DI/locator.dart';
import 'package:notes_keeper/shared/providers/notes_provider.dart';
import 'package:notes_keeper/shared/utils/colors.dart';

class NotesTile extends StatelessWidget {
  final NoteModel note;
  const NotesTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: kTextColor,
      textColor: kPrimaryColor,
      collapsedIconColor: kTextColor,
      iconColor: kPrimaryColor,
      title: Text(
        note.content.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
      ),
      initiallyExpanded: true,
      children: [
        Text(
          note.content.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: kTextColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                locator<NotesProvider>().removeNote(note.id.toString());
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: kPrimaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
