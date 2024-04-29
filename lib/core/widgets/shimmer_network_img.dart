import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ShimmerNetworkImg extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const ShimmerNetworkImg(this.imageUrl, {super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 150,
      width: width ?? 150,
      child: Card(
        color: Colors.transparent,
        child: AspectRatio(
          aspectRatio: .65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: FancyShimmerImage(
              imageUrl: imageUrl,
              errorWidget: const Icon(
                Icons.image,
                color: Colors.grey,
                size: 70,
              ),
              // color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
