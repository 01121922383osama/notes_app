import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Models/note_model.dart';
import 'package:note/Views/Widgets/colors_list_vire.dart';
import 'package:note/Views/Widgets/custom_app_bar_widget.dart';
import 'package:note/Views/Widgets/custom_buttom.dart';
import 'package:note/Views/Widgets/custom_text_field.dart';

import '../../Cubits/Notes_Cubit/notes_cubit.dart';

class EditNewViewBody extends StatefulWidget {
  final NoteModel noteModel;
  const EditNewViewBody({super.key, required this.noteModel});

  @override
  State<EditNewViewBody> createState() => _EditNewViewBodyState();
}

class _EditNewViewBodyState extends State<EditNewViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBarWidget(
              onPressed: () {
                widget.noteModel.titel = title ?? widget.noteModel.titel;
                widget.noteModel.subtitel =
                    content ?? widget.noteModel.subtitel;
                widget.noteModel.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              titel: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: widget.noteModel.titel,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hintText: widget.noteModel.subtitel,
              macLines: 5,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            EditNoteColorList(noteModel: widget.noteModel),
            const SizedBox(height: 32),
            CustomButton(
              onTap: () {
                widget.noteModel.titel = title ?? widget.noteModel.titel;
                widget.noteModel.subtitel =
                    content ?? widget.noteModel.subtitel;
                widget.noteModel.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditNoteColorList extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteColorList({super.key, required this.noteModel});

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.noteModel.color = colors[index].value;
                });
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: colors[index].withOpacity(0.8),
              ),
            ),
          );
        },
      ),
    );
  }
}
