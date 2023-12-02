// ignore_for_file: depend_on_referenced_packages

import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/services/api_service.dart';
import 'package:get/get.dart';
import 'package:sdg_hackaton_app/utilities/constants/urls.dart';

class AuthService {
  final _apiService = locator<ApiService>();
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;

  String get email => _email ?? '';
  String get phoneNumber => _phoneNumber ?? '';
  String get lastName => _lastName ?? '';
  String get firstName => _firstName ?? '';

  void setEmail(String value) {
    _email = value;
  }

  void setAuthInfo(String firstName, String lastName, String phoneNumber) {
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
  }

  setToken(String token) {
    _apiService.setToken(value: token);
  }

  Future<Response> login(
      {required String email, required String password}) async {
    return await _apiService
        .postData(loginUrl, {"email": email, "password": password});
  }

  Future<Response> signup(
      {required String name,
      required String email,
      required String password}) async {
    return await _apiService.postData(
        loginUrl, {"email": email, "password": password, "name": name});
  }
}
