import 'package:equatable/equatable.dart';

class VoiceEntity extends Equatable {
  final String text;

  const VoiceEntity({required this.text});

  @override
  List<Object?> get props => [text];
}
