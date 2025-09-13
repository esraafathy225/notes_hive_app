import 'package:flutter/material.dart';
import '../components/note_card.dart';
import '../constants/colors.dart';
import '../data/note_model.dart';
import 'add_edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> noteList =[];

  @override
  void initState() {
    super.initState();
    noteList= [
      Note(id:0,title: 'Sample Note 1', content: 'This is the content of sample note 1', date: DateTime.now().toIso8601String()),
      Note(id:1,title: 'Sample Note 2', content: 'This is the content of sample note 2', date: DateTime.now().toIso8601String()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!',style: TextStyle(color: Colors.white),),
        backgroundColor: mainColor,
      ),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          final note = noteList[index];
          return NoteCard(
            note: note,
            cardColor:  noteColors[index % noteColors.length],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddEditNoteScreen(note: note),
              ),
            ),
            onDelete: () {
              setState(() {
                noteList.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: const Icon(Icons.add,color: Colors.white,),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEditNoteScreen()),
        ),
      ),
    );
  }
}
