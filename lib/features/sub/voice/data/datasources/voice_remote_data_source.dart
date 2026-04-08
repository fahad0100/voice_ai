import 'package:injectable/injectable.dart';
import 'package:voice_ai/core/services/voice_service.dart';
import 'package:voice_ai/features/sub/voice/data/models/voice_model.dart';
import 'package:voice_ai/core/errors/network_exceptions.dart';

abstract class BaseVoiceRemoteDataSource {
  Future<VoiceModel> startVoice();
  Future<VoiceModel> stopVoice();
}

@LazySingleton(as: BaseVoiceRemoteDataSource)
class VoiceRemoteDataSource implements BaseVoiceRemoteDataSource {
  final VoiceService _voiceService;
  // final SupabaseClient _supabase;
  // final LocalKeysService _localKeysService;

  VoiceRemoteDataSource(this._voiceService);

  @override
  Future<VoiceModel> startVoice() async {
    try {
      await _voiceService.startRecord();
      return VoiceModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<VoiceModel> stopVoice() async {
    try {
      final voice = await _voiceService.stopRecord();
      print(voice);

      return VoiceModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
