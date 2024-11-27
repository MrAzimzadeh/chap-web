import 'package:chapweb/presenter/assets.gen.dart';
import 'package:flutter/material.dart';
class PikaLoadingIndicator extends StatelessWidget {
  const PikaLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: Assets.images.image.provider(),
        fit: BoxFit.contain,
      ),
    );
  }
}
