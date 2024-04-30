import 'package:flutter/material.dart';

class MovingText extends StatefulWidget {
  final String text;
  const MovingText({super.key, required this.text});

  @override
  State<MovingText> createState() => _MovingTextState();
}

class _MovingTextState extends State<MovingText>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    initMovingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animatedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return SlideTransition(position: animation, child: Text(widget.text));
        });
  }

  void initMovingAnimation() {
    animatedController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animatedController);
    animatedController.forward();
  }
}
