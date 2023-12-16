part of 'notes_cubit.dart';

@immutable
sealed class NotesState {
  final List<NoteModel> notes;

  const NotesState({required this.notes});
}

final class NotesInitial extends NotesState {
  const NotesInitial({required List<NoteModel> notes}) : super(notes: notes);
}

final class NotesLoaded extends NotesState {
  const NotesLoaded({required super.notes});
}