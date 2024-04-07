import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String? id,
    required String content,
  }) = _NoteModel;

  factory NoteModel.generate(String content) {
    return NoteModel(
      id: const Uuid().v4(),
      content: content,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  static NoteModel empty() {
    return const NoteModel(
      id: null, // Assuming null represents an unloaded state for id
      content:
          '', // Assuming an empty string represents an unloaded state for content
    );
  }
}
