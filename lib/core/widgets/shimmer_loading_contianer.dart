import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoadingContainer extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;
  const CustomShimmerLoadingContainer(
      {super.key, required this.height, required this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withValues(alpha: .1),
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 24),
              color: Colors.white),
        ));
  }
}
