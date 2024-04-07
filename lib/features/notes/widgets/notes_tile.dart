import 'package:flutter/material.dart';
import 'package:notes_keeper/shared/utils/colors.dart';

class NotesTile extends StatelessWidget {
  const NotesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: kTextColor,
      textColor: kPrimaryColor,
      collapsedIconColor: kTextColor,
      iconColor: kPrimaryColor,
      title: Text(
        "Notes Tile",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      initiallyExpanded: true,
      children: [
        Text(
          "This is a random note. This note is used to demonstrate the use of expansion tile",
          textAlign: TextAlign.center,
          style: TextStyle(color: kTextColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
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
