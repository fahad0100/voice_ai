import 'package:equatable/equatable.dart';

abstract class VoiceState extends Equatable {
  const VoiceState();

  @override
  List<Object?> get props => [];
}

class VoiceInitialState extends VoiceState {}

class VoiceRecordingState extends VoiceState {
  final String? text;
  final bool start;

  const VoiceRecordingState({required this.start, this.text});

  @override
  List<Object?> get props => [start, text];
}

class VoiceSuccessState extends VoiceState {}

class VoiceErrorState extends VoiceState {
  final String message;
  const VoiceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
