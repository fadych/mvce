import 'package:flutter/widgets.dart';
import 'package:mvce/controller/device_utils/device_utils.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo({required String name, dynamic arguments}) {
    if (errorMessageProvider.errorMessage.message != "") {
      errorMessageProvider.clearErrorMessage();
    }
    return navigatorKey.currentState!.pushNamed(
      name,
      arguments: arguments,
    );
  }

  pop() {
    if (navigatorKey.currentState!.canPop()) {
      if (errorMessageProvider.errorMessage.message != "") {
        errorMessageProvider.clearErrorMessage();
      }
      return navigatorKey.currentState!.pop();
    }
  }

  popUntil(String name) {
    if (errorMessageProvider.errorMessage.message != "") {
      errorMessageProvider.clearErrorMessage();
    }
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(name));
  }

  Future<dynamic> navigateAndRemove({required String name, dynamic arguments}) {
    if (errorMessageProvider.errorMessage.message != "") {
      errorMessageProvider.clearErrorMessage();
    }
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      name,
      (route) => false,
      arguments: arguments,
    );
  }
}
