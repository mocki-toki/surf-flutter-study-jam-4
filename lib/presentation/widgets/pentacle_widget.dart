// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class PentacleWidget extends StatefulWidget {
  const PentacleWidget(this.state, {super.key, this.child});

  final PentacleState state;
  final Widget? child;

  @override
  State<PentacleWidget> createState() => _PentacleWidgetState();
}

const _defaultDuration = Duration(milliseconds: 1000);
const _defaultCurve = Curves.elasticOut;

class _PentacleWidgetState extends State<PentacleWidget>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  late AnimationController _shapeController;
  late Animation<double> _shapeAnimation;

  MorphableShapeBorderTween? _shapeTween;

  @override
  void didUpdateWidget(covariant PentacleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state) {
      _shapeTween = MorphableShapeBorderTween(
        begin: getShapeDecoration(oldWidget.state),
        end: getShapeDecoration(widget.state),
      );

      _shapeController.reset();
      _shapeController.forward();

      switch (widget.state) {
        case LoadingPentacleState():
          _rotationController.duration = const Duration(seconds: 2);
          _rotationController.repeat();
        case InitialPentacleState():
        case LoadedPentacleState():
          _rotationController.duration = const Duration(seconds: 15);
          _rotationController.repeat();
        case ErrorPentacleState():
          _rotationController.duration = const Duration(seconds: 20);
          _rotationController.repeat();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_rotationController);

    _rotationController.repeat();

    _shapeController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _shapeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _shapeController,
        curve: _defaultCurve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (widget.state is ErrorPentacleState) {
      color = Colors.red;
    } else if (widget.state is LoadedPentacleState) {
      color = Theme.of(context).colorScheme.primary;
    } else if (widget.state is LoadingPentacleState) {
      color = Theme.of(context).colorScheme.secondary;
    } else {
      color = Theme.of(context).colorScheme.inversePrimary;
    }

    final scale = widget.state is LoadingPentacleState
        ? 0.5
        : widget.state is InitialPentacleState
            ? 0.7
            : 1.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: AnimatedScale(
            duration: _defaultDuration,
            curve: _defaultCurve,
            scale: scale,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: AnimatedBuilder(
                animation: _shapeAnimation,
                builder: (BuildContext context, Widget? child) {
                  final shape = _shapeTween?.lerp(_shapeController.value) ??
                      getShapeDecoration(widget.state);
                  return DecoratedShadowedShape(
                    decoration: BoxDecoration(color: color),
                    shape: shape,
                  );
                },
              ),
            ),
          ),
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }

  StarShapeBorder getShapeDecoration(PentacleState state) {
    switch (state) {
      case InitialPentacleState():
        return StarShapeBorder(
          corners: 12,
          inset: 15.toPercentLength,
          cornerRadius: 10.toPXLength,
          insetRadius: 10.toPXLength,
        );
      case LoadingPentacleState():
        return StarShapeBorder(
          corners: 8,
          inset: 20.toPercentLength,
          cornerRadius: 20.toPXLength,
          insetRadius: 20.toPXLength,
        );
      case LoadedPentacleState():
        return StarShapeBorder(
          corners: 12,
          inset: 15.toPercentLength,
          cornerRadius: 10.toPXLength,
          insetRadius: 10.toPXLength,
        );

      case ErrorPentacleState():
        return StarShapeBorder(
          inset: 50.toPercentLength,
          cornerRadius: 30.toPXLength,
          insetRadius: 40.toPXLength,
        );
    }
  }
}

sealed class PentacleState {
  const PentacleState();
}

final class InitialPentacleState extends PentacleState {
  const InitialPentacleState();
}

final class LoadingPentacleState extends PentacleState {
  const LoadingPentacleState();
}

final class LoadedPentacleState extends PentacleState {
  final String? content;

  const LoadedPentacleState([this.content]);
}

final class ErrorPentacleState extends PentacleState {
  final String message;

  const ErrorPentacleState(this.message);
}
