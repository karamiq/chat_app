import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpTimerController {
  // Declare the callbacks as Function types
  void Function()? _startCallback;
  void Function()? _stopCallback;
  void Function()? _resetCallback;

  // Bind methods to the controller
  void _bind({
    required void Function() start,
    required void Function() stop,
    required void Function() reset,
  }) {
    _startCallback = start;
    _stopCallback = stop;
    _resetCallback = reset;
  }

  // Expose methods to trigger the callbacks
  void start() => _startCallback?.call();
  void stop() => _stopCallback?.call();
  void reset() => _resetCallback?.call();
}

class OtpTimer extends StatefulWidget {
  final Duration duration;
  final String? iconAssetPath;
  final ValueChanged<bool> onTimerFinished;
  final OtpTimerController? controller;

  const OtpTimer({
    super.key,
    required this.duration,
    this.iconAssetPath,
    required this.onTimerFinished,
    this.controller,
  });

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  Timer? _timer;
  late int _timerSecondsRemaining;
  bool _timerFinished = false;

  @override
  void initState() {
    super.initState();
    _timerSecondsRemaining = widget.duration.inSeconds;
    _startTimer();

    // Bind controller methods if the controller is passed
    widget.controller?._bind(
      start: _startTimer,
      stop: _stopTimer,
      reset: _resetTimer,
    );
  }

  void _startTimer() {
    _stopTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    setState(() {
      _timerSecondsRemaining = widget.duration.inSeconds;
      _timerFinished = false;
    });
    _startTimer();
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _timerSecondsRemaining--;
      if (_timerSecondsRemaining <= 0) {
        _stopTimer();
        _timerFinished = true;
        widget.onTimerFinished(true);
      }
    });
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.iconAssetPath != null)
          SvgPicture.asset(
            widget.iconAssetPath!,
            height: 100,
            width: 100,
          ),
        const SizedBox(width: 8),
        Text(
          '$_timerSecondsRemaining',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 46,
          ),
        ),
      ],
    );
  }
}
