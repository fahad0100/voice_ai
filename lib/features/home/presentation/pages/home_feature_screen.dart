import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_ai/core/widgets/loading_widget.dart';
import 'package:voice_ai/features/home/presentation/cubit/home_cubit.dart';
import 'package:voice_ai/features/home/presentation/cubit/home_state.dart';
import 'package:voice_ai/features/sub/voice/presentation/pages/voice_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccessState && state.path != null) {
                return Text(state.path!);
              }
              if (state is HomeLoadingState) {
                return LoadingWidget();
              }
              return SizedBox.shrink();
            },
          ),
          Center(
            child: VoiceFeatureWidget(
              notifyStart: (value) {
                cubit.showLoading(value);
              },
              getPath: (value) {
                cubit.updatePath(path: value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
