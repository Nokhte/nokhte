// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class NokhteCustomAnimationBuilder<T> extends StatefulWidget {
  const NokhteCustomAnimationBuilder({
    required this.builder,
    required this.tween,
    required this.duration,
    this.control = Control.play,
    this.curve = Curves.linear,
    this.delay = Duration.zero,
    this.startPosition = 0.0,
    this.child,
    this.animationStatusListener,
    this.fps,
    // test commit
    this.developerMode = false,
    this.onStarted,
    this.onCompleted,
    super.key,
  }) : assert(startPosition >= 0 && startPosition <= 1,
            'The property startPosition must have a value between 0.0 and 1.0.');

  final Animatable<T> tween;

  final Duration duration;

  final ValueWidgetBuilder<T> builder;

  final Duration delay;

  final Widget? child;

  final Curve curve;

  final int? fps;

  final bool developerMode;

  final VoidCallback? onStarted;

  final VoidCallback? onCompleted;

  final Control control;

  final double startPosition;

  final AnimationStatusListener? animationStatusListener;

  @override
  _NokhteCustomAnimationBuilderState<T> createState() =>
      _NokhteCustomAnimationBuilderState<T>();
}

class _NokhteCustomAnimationBuilderState<T>
    extends State<NokhteCustomAnimationBuilder<T>> with AnimationMixin {
  late AnimationController _controller;

  late Animation<T> _animation;

  Timer? _delayTimer;

  var _isControlSetToMirror = false;

  var _isPlaying = false;

  @override
  void initState() {
    _controller = createController(fps: widget.fps);
    _controller.value = widget.startPosition;
    _controller.duration = widget.duration;

    _buildAnimation();

    _controller.addStatusListener(_onAnimationStatus);

    var hasDelayDefined =
        widget.delay != Duration.zero && !widget.developerMode;
    if (hasDelayDefined) {
      _delayTimer = Timer(widget.delay, _applyControlInstruction);
    } else {
      _applyControlInstruction();
    }

    super.initState();
  }

  @override
  void dispose() {
    _delayTimer?.cancel();

    super.dispose();
  }

  void _buildAnimation() {
    _animation = widget.tween
        .chain(CurveTween(curve: widget.curve))
        .animate(_controller);

    if (widget.developerMode) {
      var transfer =
          context.findAncestorWidgetOfExactType<AnimationControllerTransfer>();
      assert(transfer != null,
          'Please place an AnimationDeveloperTools widget inside the widget tree');
      transfer?.controllerProvider(_controller);
    }
  }

  @override
  void didUpdateWidget(NokhteCustomAnimationBuilder<T> oldWidget) {
    _controller.duration = widget.duration;

    _buildAnimation();

    _applyControlInstruction();

    super.didUpdateWidget(oldWidget);
  }

  void _applyControlInstruction() async {
    if (widget.developerMode) {
      return;
    }

    if (widget.control == Control.stop) {
      _controller.stop();
    }

    if (widget.control == Control.play) {
      unawaited(_controller.play());
    }

    if (widget.control == Control.playReverse) {
      unawaited(_controller.playReverse());
    }

    if (widget.control == Control.playFromStart) {
      unawaited(_controller.forward(from: 0.0));
    }

    if (widget.control == Control.playReverseFromEnd) {
      unawaited(_controller.reverse(from: 1.0));
    }

    if (widget.control == Control.loop) {
      unawaited(_controller.loop());
    }

    if ((widget.control == Control.mirror) && !_isControlSetToMirror) {
      _isControlSetToMirror = true;
      unawaited(_controller.mirror());
    }

    if (widget.control != Control.mirror) {
      _isControlSetToMirror = false;
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    widget.animationStatusListener?.call(status);

    if (status == AnimationStatus.forward ||
        status == AnimationStatus.reverse) {
      _trackPlaybackStart();
    } else if (status == AnimationStatus.dismissed ||
        status == AnimationStatus.completed) {
      _trackPlaybackComplete();
    }
  }

  void _trackPlaybackStart() {
    if (!_isPlaying) {
      _isPlaying = true;
      widget.onStarted?.call();
    }
  }

  void _trackPlaybackComplete() {
    if (_isPlaying) {
      _isPlaying = false;
      widget.onCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, _animation.value, widget.child);
}
