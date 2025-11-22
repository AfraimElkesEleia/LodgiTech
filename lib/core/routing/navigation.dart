import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String route, {Object? arguments}) {
    return Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  Future<dynamic> pushAndReplacement(String route, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(route, arguments: arguments);
  }
}
