import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool _rememberEnabled = false;

  bool get rememberEnabled => _rememberEnabled;

  void setRemeber(bool? value){
    if(value != null){
      _rememberEnabled = value;
    }
    rebuildUi();
  }

  void loginFunction() {
    debugPrint('login function!!!');
    _navigationService.navigateTo(Routes.homeView);
  }

  goToHome() async {
    _navigationService.replaceWithHomeView();
  }

  void goToSignup() {
    _navigationService.navigateTo(Routes.signupView);
  }
}
