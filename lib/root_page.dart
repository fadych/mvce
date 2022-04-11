import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvce/view/first_page.dart';

enum AuthStatus {
  unknown,
  loggedIn,
  notLoggedIn,
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  checkUserStatus() async {
    await Future.delayed(Duration.zero, () {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget returnedScreen = Container();
    switch (_authStatus) {
      case AuthStatus.unknown:
        returnedScreen = Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: CupertinoActivityIndicator(
              radius: 15,
            ),
          ),
        );

        break;
      case AuthStatus.loggedIn:
        returnedScreen = FirstPage();
        break;
      case AuthStatus.notLoggedIn:
        returnedScreen = FirstPage();
        break;

      default:
    }
    return returnedScreen;
  }
}
