import 'package:flutter/material.dart';
import 'package:note/services/NoteService.dart';
import 'package:note/services/ThemeColorService.dart';

class ViewNote extends StatefulWidget {
  final VoidCallback rebuildCallback;
  final String note;
  final int index;

  const ViewNote(
      {super.key,
      required this.note,
      required this.index,
      required this.rebuildCallback});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _note = TextEditingController(text: widget.note);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: _note,
              maxLines: null,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
              decoration: const InputDecoration(
                  hintText: 'Note Contents.',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 130, 130, 130))),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          if (_note.text.isNotEmpty) {
            await updateNotes(_note.text, widget.index);
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
