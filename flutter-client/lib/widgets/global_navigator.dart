import 'package:battle_men_and_women/main.dart';

class GlobalNavigator {
  static pop() {
    navigatorKey.currentState?.pop();
  }

  static popUntil(String routeName) {
    navigatorKey.currentState?.popUntil((route) {
      return route.settings.name == routeName;
    });
  }
}
