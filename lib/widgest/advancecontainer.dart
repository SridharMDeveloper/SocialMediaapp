import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class AdvanceGlassContainer extends StatefulWidget {
  double height;
  double width;
  double borderRadius;
  Widget child;
  AdvanceGlassContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  State<AdvanceGlassContainer> createState() => _AdvanceGlassContainerState();
}

class _AdvanceGlassContainerState extends State<AdvanceGlassContainer> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        // margin: const EdgeInsets.only(top: 24, bottom: 28),
        padding: const EdgeInsets.only(left: 50.0),
        width: widget.width,
        height: widget.height,
        borderRadius: widget.borderRadius,
        blur: 5,
        alignment: Alignment.center,
        border: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        child: widget.child);
  }
}
