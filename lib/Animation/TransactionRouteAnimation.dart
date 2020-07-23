import 'package:flutter/cupertino.dart';

class TransactionRouteAnimation extends PageRouteBuilder {
  final Widget widget;

  TransactionRouteAnimation({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation,
                  reverseCurve: Curves.easeOutCirc,
                  curve: Curves.easeInCirc);

              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.bottomCenter,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}
