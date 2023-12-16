import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/Cubits/AddNote/addnote_cubit.dart';
import 'package:note/Cubits/Sellected/is_selected_cubit.dart';
import 'package:note/Models/note_model.dart';
import 'package:note/Views/notes_view.dart';
import 'package:note/simple_obsever.dart';

import 'Cubits/Notes_Cubit/notes_cubit.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knotes);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => AddnoteCubit(),
        ),
        BlocProvider(
          create: (context) => IsSelectedCubit(),
        ),
        BlocProvider(
          create: (context) => CheckedCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const NotesView(),
      ),
    );
  }
}

const knotes = 'notes';
