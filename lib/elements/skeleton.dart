import 'package:baseleal/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;

  const Skelton({
    this.borderRadius = 10,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Provider.of<ThemeProvider>(context, listen: false).isLightmode
          ? const Color.fromARGB(112, 0, 0, 0)
          : const Color.fromRGBO(255, 255, 255, 0.239),
      highlightColor:
          Provider.of<ThemeProvider>(context, listen: false).isLightmode
              ? Colors.black12
              : Colors.white30,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          backgroundBlendMode: BlendMode.luminosity,
        ),
      ),
    );
  }
}
