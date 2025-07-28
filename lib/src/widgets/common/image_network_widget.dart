import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'full_screen_image_page.dart';

class RMImageNetworkWidget extends StatelessWidget {
  final String? imageUrl;
  final String? imageFullScreenUrl;
  final BoxFit boxFit;
  final double height, width;
  final bool allowFullscreen;

  const RMImageNetworkWidget({
    super.key,
    required this.imageUrl,
    this.imageFullScreenUrl,
    this.boxFit = BoxFit.cover,
    this.height = 300,
    this.width = 300,
    this.allowFullscreen = false,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Image.asset(
        'assets/images/empty_profile.png',
        height: height,
        width: width,
      );
    }

    if (imageUrl!.isEmpty || imageUrl!.contains('http') == false) {
      return Image.asset(
        'assets/images/empty_profile.png',
        height: height,
        width: width,
      );
    }
    if (imageUrl!.split('.').last.substring(0, 3) == 'svg') {
      return SvgPicture.network(
        imageUrl!,
        fit: boxFit,
        height: height,
        width: width,
      );
    }

    final widget = Image.network(
      imageUrl!,
      fit: boxFit,
      height: height,
      width: width,
      errorBuilder: (context, value, e) => SizedBox(
        width: width,
        height: height,
        child: const Center(child: Icon(Icons.broken_image)),
      ),
    );

    if (!allowFullscreen) {
      return widget;
    }

    return GestureDetector(
      onTap: () {
        if (allowFullscreen && imageFullScreenUrl != null) {
          Navigator.push(
            context,
            PageRouteBuilder<void>(
              pageBuilder: (context, animation1, animation2) {
                return ScaleTransition(
                  scale: animation1,
                  child: FullscreenImagePage(imageUrl: imageFullScreenUrl!),
                );
              },
            ),
          );
        }
      },
      child: widget,
    );
  }
}
