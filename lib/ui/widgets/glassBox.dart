import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  const GlassBox(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.sigma,
      this.color = Colors.white});

  final dynamic width;
  final dynamic height;
  final dynamic borderRadius;
  final dynamic sigma;
  //final child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            //blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
              child: Container(),
            ),
            //gradient effect
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: color.withOpacity(0.13),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.20), color.withOpacity(0.10)],
                ),
              ),
              //child: child,
            ),
          ],
        ),
      ),
    );
  }
}
