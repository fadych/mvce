import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvce/constants/root_names.dart';
import 'package:mvce/controller/device_utils/device_utils.dart';
import 'package:mvce/controller/navigation/navigation_service.dart';
import 'package:mvce/controller/provider/error_message_provider.dart';
import 'package:mvce/locator.dart';
import 'package:provider/provider.dart';

class StartingScreen extends StatefulWidget {
  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  void initState() {
    super.initState();
    errorMessageProvider =
        Provider.of<ErrorMessageProvider>(context, listen: false);
    Timer(
      Duration(seconds: 1),
      () => _navigationService.navigateAndRemove(
        name: CRootPageRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
