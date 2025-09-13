import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled28/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/note_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Add const constructor and super.key for null safety

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}