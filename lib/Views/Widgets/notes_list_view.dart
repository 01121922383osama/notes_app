import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Cubits/Notes_Cubit/notes_cubit.dart';

import '../../Models/note_model.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        log(state.notes.length.toString());
        return Scrollbar(
          thickness: 2,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.notes.length,
            itemBuilder: (BuildContext context, int index) {
              final NoteModel note = state.notes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: NoteItem(note: note),
              );
            },
          ),
        );
      },
    );
  }
}
