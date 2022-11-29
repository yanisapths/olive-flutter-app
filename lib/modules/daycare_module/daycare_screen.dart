import 'package:flutter/widgets.dart';

class DaycareListView extends StatelessWidget {
  const DaycareListView({Key? key, this.animationController, this.animation})
      : super(key: key);

  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child:
                    Stack(alignment: AlignmentDirectional.center, children: []),
              ),
            ),
          ),
        );
      },
    );
  }
}
