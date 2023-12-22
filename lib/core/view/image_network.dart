import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const ImageNetwork({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url.toString(),
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/not_found.png',
          height: height,
          width: width,
          fit: fit,
        );
      },
    );
  }
}
