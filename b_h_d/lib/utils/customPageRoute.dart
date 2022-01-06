import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget? child;
  final Widget? parent;

  CustomPageRoute({this.child, this.parent})
      : super(
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return child!;
            });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // return SlideTransition(
    //   position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation),
    //   child: child,

    // );

    Animation<Offset> animationOne = Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0.0)).animate(animation);
    Animation<Offset> animationTwo = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(animation);
    return Stack(
      children: <Widget>[
        SlideTransition(position: animationOne, child: parent),
        SlideTransition(position: animationTwo, child: child),
      ],
    );
  }
}
