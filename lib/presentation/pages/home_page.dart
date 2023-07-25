import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:surf_practice_magic_ball/presentation/bloc/home/home_bloc.dart';
import 'package:surf_practice_magic_ball/presentation/bloc/home/home_state.dart';
import 'package:surf_practice_magic_ball/presentation/widgets/collapsed_header_body_widget.dart';
import 'package:surf_practice_magic_ball/presentation/widgets/collapsed_header_widget.dart';
import 'package:surf_practice_magic_ball/presentation/widgets/pentacle_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CollapsedHeaderWidget(
      header: (_, toggle) => CollapsedHeaderBodyWidget(toggle),
      body: (_, toggleCollapsedHeader) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return _Body(toggleCollapsedHeader, state);
          },
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(this.toggleCollapsedHeader, this.state);

  final void Function() toggleCollapsedHeader;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    late final PentacleState pentacleState;

    String? content;

    if (state is LoadedHomeState) {
      content = (state as LoadedHomeState).content;
    }

    switch (state) {
      case LoadingHomeState():
        pentacleState = const LoadingPentacleState();

      case LoadedHomeState():
        pentacleState = content == null
            ? const InitialPentacleState()
            : const LoadedPentacleState();

      case ErrorHomeState():
        pentacleState = const ErrorPentacleState('123');
    }

    final isLoading = pentacleState is LoadingPentacleState;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Pentacle'),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(MdiIcons.tuneVariant),
            onPressed: toggleCollapsedHeader,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PentacleWidget(
            pentacleState,
            child: content == null
                ? null
                : Text(
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
          ),
          const SizedBox(height: 10),
          Center(
            child: FilledButton.tonal(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(150, 60)),
              ),
              onPressed: isLoading ? null : context.read<HomeBloc>().getReading,
              child: const Text("I'm lucky!"),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'You want to know?',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
