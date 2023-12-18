import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Note(),
  ));
}

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<Map<String, dynamic>> Notes = [
    {
      "title": "Meeting Notes",
      "content": "Discuss quarterly goals and progress with team members.",
      "color": Colors.yellow[200],
    },
    {
      "title": "To-Do List",
      "content":
          "Complete tasks: finalize presentation, send reports, and follow up on emails.",
      "color": Colors.green[200],
    },
    {
      "title": "Project Updates",
      "content":
          "Review project timeline, address any issues, and plan for the next sprint.",
      "color": Colors.blue[200],
    },
    {
      "title": "Ideas",
      "content":
          "Brainstorm innovative solutions for upcoming challenges and improvements.",
      "color": Colors.purple[200],
    },
    {
      "title": "Research Notes",
      "content":
          "Summarize findings from recent market research and competitor analysis.",
      "color": Colors.orange[200],
    },
    {
      "title": "Personal Goals",
      "content": "Set personal goals for self-improvement and track progress.",
      "color": Colors.teal[200],
    },
    {
      "title": "Book Recommendations",
      "content":
          "List of recommended books for professional and personal development.",
      "color": Colors.indigo[200],
    },
    // Add more dummy notes as needed
  ];

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
                  children: Notes.map(
                    (note) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: note['color'],
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
                  ).toList(),
                )),
          ),
        ));
  }
}
