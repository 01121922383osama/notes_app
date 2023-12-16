import 'package:flutter/material.dart';
import 'package:note/Models/note_model.dart';
import 'package:note/Views/Widgets/edite_note_body.dart';

class EditNewView extends StatelessWidget {
  const EditNewView({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNewViewBody(noteModel: noteModel),
    );
  }
}
