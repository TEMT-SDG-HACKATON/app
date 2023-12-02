import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get/get.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _rememberEnabled = false;

  bool get rememberEnabled => _rememberEnabled;

  void setRemeber(bool? value) {
    if (value != null) {
      _rememberEnabled = value;
    }
    rebuildUi();
  }

  Future<void> loginFunction() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(Duration(milliseconds: delayTime));
      Response response = await _authService.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (response.statusCode == 200) {
        String? token = response.body['token'];
        _authService.setToken(token ?? '');
        _navigationService.navigateTo(Routes.homeView);
      } else {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'An error occured',
          description: 'Email or password is incorrect',
        );
      }
      setBusy(false);
    }
  }

  goToHome() async {
    _navigationService.replaceWithHomeView();
  }

  void goToSignup() {
    _navigationService.navigateTo(Routes.signupView);
  }
}
