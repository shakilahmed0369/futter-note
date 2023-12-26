import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveNotes(note) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> noteList = await getNotes();
  noteList.add(note);

  await prefs.setStringList('notes', noteList);
}

Future<void> updateNotes(note, index) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> noteList = await getNotes();
 
  noteList[index] = note.toString();

  await prefs.setStringList('notes', noteList);
}

Future<List<String>> getNotes() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? noteList = prefs.getStringList('notes');

  if (noteList != null) {
    return noteList.reversed.toList();
  } else {
    return [];
  }
}

Future<void> deleteNotes(index) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> noteList = await getNotes();
  noteList.removeAt(index);
  await prefs.setStringList('notes', noteList);
}
