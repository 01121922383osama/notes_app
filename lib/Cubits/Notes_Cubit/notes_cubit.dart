import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/Models/note_model.dart';

import '../../main.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesInitial(notes: []));

  fetchAllNotes() {
    var notesBooks = Hive.box<NoteModel>(knotes);
    List<NoteModel> notes = notesBooks.values.toList();
    emit(NotesLoaded(notes: notes));
  }
}