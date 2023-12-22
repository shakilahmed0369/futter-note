import 'package:flutter/material.dart';
import 'package:note/note-view.dart';
import 'package:note/note_create.dart';
import 'package:note/note_data.dart';
import 'package:note/services/noteCard.dart';

void main() {
  runApp(MaterialApp(
    // home: Note(),
    routes: {
      '/': (context) => Note(),
      '/view-note': (context) => ViewNote(),
      '/create-note': (context) => CreateNote()
    },
  ));
}

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Container(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                Notes.length,
                (index) => NoteCard(note: Notes[index], index: index),
              )),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-note');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
