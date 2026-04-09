import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:voice_ai/core/network/dio_client.dart';
import 'package:voice_ai/core/network/gladia_method.dart';
import 'package:voice_ai/core/services/voice_service.dart';
import 'package:voice_ai/features/sub/voice/data/models/voice_model.dart';
import 'package:voice_ai/core/errors/network_exceptions.dart';

abstract class BaseVoiceRemoteDataSource {
  Future<bool> startVoice();
  Future<VoiceModel> stopVoice();
}

@LazySingleton(as: BaseVoiceRemoteDataSource)
class VoiceRemoteDataSource implements BaseVoiceRemoteDataSource {
  final VoiceService _voiceService;
  final DioClient _dio;
  // final SupabaseClient _supabase;
  // final LocalKeysService _localKeysService;

  VoiceRemoteDataSource(this._voiceService, this._dio);

  @override
  Future<bool> startVoice() async {
    try {
      await _voiceService.startRecord();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<VoiceModel> stopVoice() async {
    try {
      final voice = await _voiceService.stopRecord();

      final response = await _dio.uploadVoiceMethod(file: File(voice!));

      final response2 = await _dio.transcriptionMethod(url: response);
      final response3 = await _dio.getResult(id: response2);
      print(response3);
      return VoiceModel(text: response3['transcription']['full_transcript']);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
