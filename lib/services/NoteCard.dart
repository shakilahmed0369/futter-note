import 'package:flutter/material.dart';
import 'package:note/note-view.dart';
import 'package:note/services/NoteService.dart';
import 'package:note/services/ThemeColorService.dart';

class NoteCard extends StatelessWidget {
  final String note;
  final int index;
  final VoidCallback rebuildCallback;

  const NoteCard(
      {required this.note, required this.index, required this.rebuildCallback});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFF424243),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNote(note: note, index: index, rebuildCallback: rebuildCallback)));
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 130.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'Wanna Delete?',
                        style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await deleteNotes(index);

                          if (context.mounted) {
                            Navigator.pop(context);
                            rebuildCallback();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(24),
                            backgroundColor: Colors.red[700]),
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            backgroundColor: primaryColor,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note,
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              )
            ],
          )),
        ),
      ),
    );
  }
}
