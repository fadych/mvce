import 'package:flutter/material.dart';
import 'package:mvce/constants/root_names.dart';
import 'package:mvce/controller/navigation/navigation_service.dart';
import 'package:mvce/controller/navigation/router.dart';
import 'package:mvce/controller/provider/error_message_provider.dart';
import 'package:mvce/controller/provider/user_details_provider.dart';
import 'package:mvce/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ErrorMessageProvider()),
        ChangeNotifierProvider(create: (context) => UsersDetailsProvider()),
      ],
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: CStartingScreenRoute,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
