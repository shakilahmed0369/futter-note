import 'package:flutter/material.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({super.key});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    TextEditingController _NoteTitle =
        TextEditingController(text: args['title']);
    TextEditingController _NoteContent =
        TextEditingController(text: args['content']);

    return Scaffold(
      backgroundColor: args['color'],
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: _NoteTitle,
              decoration: const InputDecoration(
                  hintText: 'Note Title.', border: InputBorder.none),
            ),
            TextField(
              controller: _NoteContent,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: 'Note Title.', border: InputBorder.none),
            ),
          ]),
        ),
      ),
    );
  }
}
