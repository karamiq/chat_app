import 'package:app/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key, required this.width, this.height});
  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Insets.smallAll,
      child: Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(50, 96, 125, 139),
            borderRadius: BorderSize.smallRadius,
          ),
          child: const Text(''),
        ),
      ),
    );
  }
}
