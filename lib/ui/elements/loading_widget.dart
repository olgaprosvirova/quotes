import 'package:flutter/material.dart';

class LoadingWidget extends ProgressIndicator {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  late Animation<LinearGradient?> animation;
  late AnimationController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = LinearGradientTween(
      begin: const LinearGradient(
        colors: [Colors.white, Colors.grey],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      end: const LinearGradient(
        colors: [Colors.black12, Colors.white],
      ),
    ).animate(controller);
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var height =
          !constraints.hasBoundedHeight ? 100.0 : constraints.maxHeight;
      var width = !constraints.hasBoundedWidth ? 100.0 : constraints.maxWidth;
      return AnimatedBuilder(
        animation: animation,
        builder: (_, __) => Center(
          child: Container(
            decoration:BoxDecoration(gradient: animation.value),
            height: height,
            width: width,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class LinearGradientTween extends Tween<LinearGradient> {
  /// Provide a begin and end Gradient. To fade between.
  LinearGradientTween({
    required LinearGradient begin,
    required LinearGradient end,
  }) : super(begin: begin, end: end);

  @override
  LinearGradient lerp(double t) => LinearGradient.lerp(begin, end, t)!;
}