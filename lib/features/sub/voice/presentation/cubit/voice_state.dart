import 'package:equatable/equatable.dart';

abstract class VoiceState extends Equatable {
  const VoiceState();

  @override
  List<Object?> get props => [];
}

class VoiceInitialState extends VoiceState {}

class VoiceRecordingState extends VoiceState {
  final bool start;

  const VoiceRecordingState({required this.start});

  @override
  List<Object?> get props => [start];
}

class VoiceSuccessState extends VoiceState {}

class VoiceErrorState extends VoiceState {
  final String message;
  const VoiceErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
