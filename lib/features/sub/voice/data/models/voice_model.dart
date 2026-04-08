import 'package:voice_ai/features/sub/voice/domain/entities/voice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'voice_model.freezed.dart';
part 'voice_model.g.dart';

@freezed
abstract class VoiceModel with _$VoiceModel {
  const factory VoiceModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _VoiceModel;

  factory VoiceModel.fromJson(Map<String, Object?> json) => _$VoiceModelFromJson(json);
}



extension VoiceModelMapper on VoiceModel {
  VoiceEntity toEntity() {
    return VoiceEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
