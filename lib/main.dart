import 'package:flutter/material.dart';
import 'package:note/note-view.dart';
import 'package:note/note_create.dart';
import 'package:note/services/NoteService.dart';
import 'package:note/services/ThemeColorService.dart';
import 'package:note/services/noteCard.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/',
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
  List notes = [];

  @override
  void initState() {
    super.initState();
    getNotes().then((result) {
      setState(() {
        notes = result.reversed.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    void rebuildHomePage() {
      getNotes().then((result) {
        setState(() {
          notes = result.reversed.toList();
        });
      });
      
      print('raned');
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: GridView.count(
                crossAxisCount: 2,
                children: notes
                    .asMap()
                    .map((key, value) =>
                        MapEntry(key, NoteCard(note: value, index: key, rebuildCallback: rebuildHomePage)))
                    .values
                    .toList(),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-note');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
