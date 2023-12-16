import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Cubits/Notes_Cubit/notes_cubit.dart';
import 'package:note/Models/note_model.dart';
import 'package:note/Views/edit_note_view.dart';

import '../../Cubits/Sellected/is_selected_cubit.dart';
import 'custom_elv_button.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsSelectedCubit, bool>(
      builder: (context, isSelected) {
        return BlocBuilder<CheckedCubit, bool>(
          builder: (context, stateCheked) {
            return InkWell(
              onLongPress: () {
                BlocProvider.of<IsSelectedCubit>(context).isSelected();
              },
              onTap: () {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                if (isSelected) {
                  selectedNotes.add(note);
                  BlocProvider.of<CheckedCubit>(context).isChecked();
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditNewView(noteModel: note),
                  ));
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(note.color),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(note.titel),
                      textColor: Colors.black,
                      subtitle: Text(note.subtitel),
                      trailing: isSelected
                          ? Checkbox(
                              activeColor: Colors.red,
                              checkColor: Colors.black,
                              value: selectedNotes.contains(note),
                              onChanged: (value) {
                                BlocProvider.of<CheckedCubit>(context)
                                    .isChecked(isSelected: value);
                              },
                            )
                          : IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Are you sure...?'),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CustomELveButtons(
                                              text: 'Yes',
                                              onPressed: () {
                                                note.delete();
                                                BlocProvider.of<NotesCubit>(
                                                        context)
                                                    .fetchAllNotes();
                                                Navigator.pop(context);
                                              },
                                            ),
                                            CustomELveButtons(
                                              text: 'No',
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                    ),
                    Text(
                      note.date,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
