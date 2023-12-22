import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: const Text("Note"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Note Title.', border: InputBorder.none),
            ),
            TextField(
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: 'Note Contents.', border: InputBorder.none),
            ),
          ]),
        ),
      ),
    );
  }
}
