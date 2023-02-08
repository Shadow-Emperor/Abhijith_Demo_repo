import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/userModel.dart';


class ApiClient {
  Future<List<UserModel>> getDataFromApi() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/'));
    final jsonResponse = json.decode(response.body);
    Iterable list = jsonResponse['data'];
    var userData = list.map((userList) => UserModel.fromJson(userList)).toList();
    return userData;
    // return jsonResponse['data'];
    }
}