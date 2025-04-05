import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.enabled = true,
  });

  final Widget child;
  final Future<void> Function()? onPressed;
  final bool enabled;

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !widget.enabled || isLoading
          ? null
          : () async {
              if (widget.onPressed == null) return;
              setState(() {
                isLoading = true;
              });
              await widget.onPressed!();
              setState(() {
                isLoading = false;
              });
            },
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            )
          : widget.child,
    );
  }
}
