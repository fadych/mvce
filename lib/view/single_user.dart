import 'package:flutter/material.dart';
import 'package:mvce/controller/provider/user_details_provider.dart';
import 'package:provider/provider.dart';

class SingleUserDetailspage extends StatefulWidget {
  const SingleUserDetailspage({Key? key}) : super(key: key);

  @override
  State<SingleUserDetailspage> createState() => _SingleUserDetailspageState();
}

class _SingleUserDetailspageState extends State<SingleUserDetailspage> {
  @override
  void initState() {
    // TODO: implement initState
    getsingleuser();
    super.initState();
  }

  getsingleuser() async {
    var usersDetailsProvider =
        Provider.of<UsersDetailsProvider>(context, listen: false);
    await Future.delayed(Duration.zero, () {
      usersDetailsProvider.getListOfusersFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
