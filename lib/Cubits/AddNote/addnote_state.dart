part of 'addnote_cubit.dart';

@immutable
sealed class AddnoteState {}

class AddnoteInitial extends AddnoteState {}

class AddnoteLoading extends AddnoteState {}

class AddnoteSucess extends AddnoteState {}

class AddnoteFailure extends AddnoteState {
  final String errMesage;

  AddnoteFailure({required this.errMesage});
}
