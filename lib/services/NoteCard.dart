import 'package:flutter/material.dart';
import 'package:note/note_data.dart';

class NoteCard extends StatelessWidget {
  final Map note;
  int index;

  NoteCard({required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: note['color'],
      child: InkWell(
        onTap: () {
          print('clicked');
          Navigator.pushNamed(context, '/view-note', arguments: Notes[index]);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note['title'] ?? '',
                style: TextStyle(fontSize: 16),
              ),
              Text(note['content'] ?? '')
            ],
          )),
        ),
      ),
    );
  }
}
