import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpTimer extends StatefulWidget {
  final Duration duration;
  final String? iconAssetPath;
  final ValueChanged<bool> onTimerFinished;

  const OtpTimer({
    super.key,
    required this.duration,
    this.iconAssetPath,
    required this.onTimerFinished,
  });

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late Timer _timer;
  late int _timerSecondsRemaining;
  late bool _timerFinished;

  @override
  void initState() {
    super.initState();
    _timerSecondsRemaining = widget.duration.inSeconds;
    _timerFinished = false;
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _timerSecondsRemaining--;
      if (_timerSecondsRemaining <= 0) {
        _timer.cancel();
        _timerFinished = true;
        widget.onTimerFinished(_timerFinished);
      }
    });
  }

  void restartTimer() {
    setState(() {
      _timerSecondsRemaining = widget.duration.inSeconds;
      _timerFinished = false;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    });
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
            //   color: const Color(0xff757680),
          ),
        const SizedBox(width: 8),
        Text(
          '$_timerSecondsRemaining',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 46,
            //  color: Color(0xff757680)
          ),
        ),
      ],
    );
  }
}
