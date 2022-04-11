import 'package:flutter/material.dart';
import 'package:mvce/constants/root_names.dart';
import 'package:mvce/controller/navigation/navigation_service.dart';
import 'package:mvce/locator.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Get list of users'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Check users'),
              onPressed: () {
                _navigationService.navigateTo(name: CUserDetailsPageRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
