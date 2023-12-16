import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Cubits/Sellected/is_selected_cubit.dart';

import '../Cubits/Notes_Cubit/notes_cubit.dart';
import '../Models/note_model.dart';
import 'Widgets/add_note_buttom_sheet.dart';
import 'Widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        actions: [
          BlocBuilder<CheckedCubit, bool>(
            builder: (context, state) {
              return selectedNotes.isNotEmpty
                  ? IconButton(
                      onPressed: selectedNotes.isEmpty
                          ? null
                          : () {
                              for (NoteModel note in selectedNotes) {
                                note.delete();
                              }
                              selectedNotes.clear();
                              BlocProvider.of<NotesCubit>(context)
                                  .fetchAllNotes();
                            },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: const NotesViewBody(),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
