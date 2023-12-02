import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get/get.dart';

class SignupViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signupFunction() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await Future.delayed(Duration(milliseconds: 1500));
      Response response = await _authService.signup(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          name: nameController.text.trim());

      if (response.statusCode == 200) {
        String? token = response.body['token'];
        _authService.setToken(token ?? '');
        _navigationService.navigateTo(Routes.homeView);
      } else {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'An error occured',
          description: 'Something went wrong',
        );
      }
      setBusy(false);
    }
  }

  void goToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithHomeView();
  }
}
