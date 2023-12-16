import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/note_model.dart';

class IsSelectedCubit extends Cubit<bool> {
  IsSelectedCubit() : super(false);
  void isSelected({bool? isslected}) {
    emit(!state);
  }
}

class CheckedCubit extends Cubit<bool> {
  CheckedCubit() : super(false);
  void isChecked({bool? isSelected}) {
    emit(isSelected ?? !state);
  }
}

final List<NoteModel> selectedNotes = [];
