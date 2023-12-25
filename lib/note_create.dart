import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note/main.dart';
import 'package:note/services/NoteService.dart';
import 'package:note/services/ThemeColorService.dart';

class CreateNote extends StatefulWidget {
  final VoidCallback rebuildCallback;
  const CreateNote({super.key, required this.rebuildCallback});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController _noteContents = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: _noteContents,
              maxLines: null,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
              decoration: const InputDecoration(
                  hintText: 'Note Contents.',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 130, 130, 130))),
              onChanged: (data) {
                setState(() {});
              },
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          if (_noteContents.text.isNotEmpty) {
            await saveNotes(_noteContents.text);

            if (context.mounted) {
              widget.rebuildCallback();
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
