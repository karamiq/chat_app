import 'package:app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/sizes.dart';

class LottieWithText extends StatelessWidget {
  const LottieWithText({
    super.key,
    required this.lottiePath,
    required this.text,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
  });

  final String lottiePath, text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottiePath, fit: BoxFit.contain),
          const Gap(Insets.medium),
          Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: textColor ?? context.colorScheme.onSurface,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
