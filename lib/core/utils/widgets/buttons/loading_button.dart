import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoading = ValueNotifier(false);

    return ElevatedButton(
      onPressed: !enabled
          ? null
          : () async {
              if (onPressed == null) return;

              isLoading.value = true;
              await onPressed!(); // Wait for the function to complete
              isLoading.value = false;
            },
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoading,
        builder: (_, value, __) {
          return value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : child;
        },
      ),
    );
  }
}
