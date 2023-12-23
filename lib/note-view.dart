import 'package:flutter/material.dart';
import 'package:note/services/NoteService.dart';
import 'package:note/services/ThemeColorService.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({super.key});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args);
    TextEditingController _note =
        TextEditingController(text: args['note'].toString());

    return Scaffold(
      backgroundColor: secondaryColor,
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
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: _note,
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
            await updateNotes(_note.text, args['index']);
            if (context.mounted) {
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          }

          print('save');
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
