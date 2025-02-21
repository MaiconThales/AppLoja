import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    required super.builder,
    RouteSettings? settings,
  });

  // CustomRoute({
  //   required WidgetBuilder builder,
  //   RouteSettings? settings,
  // }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if(settings.name == '/auth-or-home') {
    //   return child;
    // }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // if(route.settings.name == '/auth-or-home') {
    //   return child;
    // }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
