import 'package:flutter/material.dart';
import 'package:mvce/constants/root_names.dart';
import 'package:mvce/root_page.dart';
import 'package:mvce/starting_screen.dart';
import 'package:mvce/view/user_details_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case CStartingScreenRoute:
    //   return _fadeRoute(settings.name, StartingScreen());
    // case CRootPageRoute:
    //   return _fadeRoute(settings.name, RootPage());
    // case CUserDetailsPageRoute:
    //   return _fadeRoute(settings.name, UsersDetailsPage());
    case CStartingScreenRoute:
      return _fadeRoute(
        settings.name,
        StartingScreen(),
      );
    case CRootPageRoute:
      return _fadeRoute(
        settings.name,
        RootPage(),
      );
    case CUserDetailsPageRoute:
      return _fadeRoute(
        settings.name,
        UsersDetailsPage(),
      );
    default:
      return _errorRoute();
  }
}

Route<dynamic> _fadeRoute(var name, Widget widget) {
  return PageRouteBuilder(
    opaque: true,
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
    settings: RouteSettings(
      name: name,
    ),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Error',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error check navigation option',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  });
}
