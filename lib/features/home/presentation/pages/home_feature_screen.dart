import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_ai/features/home/presentation/cubit/home_cubit.dart';
import 'package:voice_ai/features/home/presentation/widgets/mic_widget.dart';
import 'package:voice_ai/features/sub/voice/presentation/pages/voice_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: Column(
        children: [
          Text("Here is Home Screen"),
          Center(child: VoiceFeatureWidget()),
        ],
      ),
    );
  }
}
