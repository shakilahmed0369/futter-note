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
    print(args);
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
            Text(
              args['title'] ?? '',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6.0),
            Text(args['content'] ?? ''),
          ]),
        ),
      ),
    );
  }
}
