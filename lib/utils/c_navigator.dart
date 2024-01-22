import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> routeStack = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    routeStack.add(route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    routeStack.remove(route);
  }

  Route<dynamic>? get previousRoute {
    int length = routeStack.length;
    return length > 1 ? routeStack[length - 2] : null;
  }
}
