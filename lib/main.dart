import 'package:flutter/material.dart';
import 'package:mvce/constants/root_names.dart';
import 'package:mvce/controller/navigation/navigation_service.dart';
import 'package:mvce/controller/navigation/router.dart';
import 'package:mvce/controller/provider/error_message_provider.dart';
import 'package:mvce/locator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ErrorMessageProvider()),
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

class UsersDetailsProvider {}
