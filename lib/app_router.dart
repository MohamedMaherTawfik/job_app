import 'package:flutter/material.dart';
import 'package:jobs_app/constants/strings.dart';
import 'package:jobs_app/presentation/components/bottom_navigator.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case bottomNavigatorScreen:
        return MaterialPageRoute(builder: (_) => BottomNavigator());
    }
  }
}
