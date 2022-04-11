import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvce/controller/services/constants_api.dart';
import 'package:mvce/model/user_details_model.dart';

class UsersDetailsService {
  Future<List<UsersModel>> getAllUsersService() async {
    try {
      var response = await http.get(Uri.parse(TusersDetailsApi));
      if (response.statusCode != 200) {
        return [];
      } else {
        var decodedResponse = jsonDecode(response.body);
        var list = decodedResponse['data'] as List;
        var returnedResult =
            list.map((map) => UsersModel.fromJson(map)).toList();
        print(decodedResponse['data']);
        return returnedResult;
      }
    } catch (e) {
      print("try catch $e");
      return [];
    }
  }
}
