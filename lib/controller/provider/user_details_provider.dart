import 'package:flutter/material.dart';
import 'package:mvce/controller/device_utils/device_utils.dart';
import 'package:mvce/controller/services/user_details_services.dart';
import 'package:mvce/locator.dart';
import 'package:mvce/model/user_details_model.dart';

class UsersDetailsProvider extends ChangeNotifier {
  final UsersDetailsService _usersDetailsService =
      locator<UsersDetailsService>();

  bool _isLoading = false;
  List<UsersModel> _listOfUsers = [];
  bool get isLoading => _isLoading;
  List<UsersModel> get listOfUsers => _listOfUsers;

  getListOfusersFunction() async {
    _isLoading = true;
    _listOfUsers = [];
    notifyListeners();

    await Future.delayed(Duration(seconds: 2), () {});
    var result = await _usersDetailsService.getAllUsersService();
    if (result.length != 0) {
      _listOfUsers = result;
    }
    _isLoading = false;
    notifyListeners();
  }

  handleSubmitButton(int value) {
    if (value == 0) {
      print('no value');
    } else {
      print('the value is  $value');
    }
  }

  int _counter = 0;
  int get counter => _counter;

  increment() {
    _counter++;
    notifyListeners();
  }

  decrement() {
    _counter--;
    notifyListeners();
  }
}
