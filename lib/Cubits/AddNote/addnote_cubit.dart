import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/Models/note_model.dart';
import 'package:note/main.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  Color color = const Color(0xffFFBE86);

  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddnoteLoading());
    try {
      var notesBooks = Hive.box<NoteModel>(knotes);
      await notesBooks.add(noteModel);
      log("Number of notes in Hive: ${notesBooks.length}");
      emit(AddnoteSucess());
    } catch (e) {
      AddnoteFailure(errMesage: e.toString());
      emit(AddnoteFailure(errMesage: e.toString()));
    }
  }
}
