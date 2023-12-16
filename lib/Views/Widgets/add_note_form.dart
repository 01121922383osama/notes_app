import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/Models/note_model.dart';
import 'package:note/Views/Widgets/colors_list_vire.dart';

import '../../Cubits/AddNote/addnote_cubit.dart';
import 'custom_buttom.dart';
import 'custom_text_field.dart';

class AddnoteForm extends StatefulWidget {
  const AddnoteForm({
    super.key,
  });

  @override
  State<AddnoteForm> createState() => _AddnoteFormState();
}

class _AddnoteFormState extends State<AddnoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            onSaved: (value) {
              titel = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: 'content',
            macLines: 5,
          ),
          const SizedBox(height: 16),
          const ColorsListView(),
          const SizedBox(height: 16),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddnoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var format = DateFormat('dd-MM-yyyy').format(currentDate);
                    NoteModel note = NoteModel(
                      titel: titel!,
                      subtitel: subtitle!,
                      date: format,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddnoteCubit>(context).addNote(note);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
