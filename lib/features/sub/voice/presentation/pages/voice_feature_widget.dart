import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:voice_ai/core/constants/app_colors.dart';
import 'package:voice_ai/core/extensions/font_extensions.dart';
import 'package:voice_ai/features/sub/voice/presentation/cubit/voice_cubit.dart';
import 'package:voice_ai/features/sub/voice/presentation/cubit/voice_state.dart';

class VoiceFeatureWidget extends StatelessWidget {
  const VoiceFeatureWidget({super.key, required this.getPath});
  final Function(String) getPath;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VoiceCubit>();
          return GestureDetector(
            onLongPress: () async {
              await cubit.startVoiceMethod();
            },
            onLongPressUp: () async {
              await cubit.stopVoiceMethod();
            },

            child: BlocBuilder<VoiceCubit, VoiceState>(
              builder: (context, state) {
                if (state is VoiceRecordingState && state.path != null) {
                  getPath(state.path!);
                }
                return Container(
                  height: 10.sizeSW(min: 100, max: 200),
                  width: 10.sizeSW(min: 100, max: 200),
                  decoration: BoxDecoration(
                    color: state is VoiceRecordingState
                        ? state.start
                              ? AppColors.success
                              : AppColors.textSecondary
                        : AppColors.textSecondary,
                    shape: .circle,
                  ),
                  child: Icon(Icons.mic, color: Colors.white),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
