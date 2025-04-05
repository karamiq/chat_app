import 'package:app/core/constants/assets.dart';
import 'package:app/core/constants/sizes.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageHead extends StatelessWidget {
  const PageHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(BorderSize.small),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Lottie.asset(
                      Assets.assetsLottieLoginLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Chit Chat',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
            const Positioned(
                right: -130, height: 200, child: CirculerContainer()),
            const Positioned(
                right: -80, bottom: -100, child: CirculerContainer()),
            const Positioned(
                left: -130, height: 200, child: CirculerContainer()),
            const Positioned(
                left: -80, bottom: -100, child: CirculerContainer()),
          ],
        ),
      ],
    );
  }
}

class CirculerContainer extends StatelessWidget {
  const CirculerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: context.colorScheme.surfaceContainerLow, width: 2)),
    );
  }
}
