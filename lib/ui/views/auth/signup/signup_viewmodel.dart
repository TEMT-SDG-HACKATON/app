import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final emailFormKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();


  String get email => _authService.email;
  String get phoneNumber => _authService.phoneNumber;
  String get firstName => _authService.firstName;


  // void nameContinueFunction(BuildContext context) {
  //   if (emailFormKey.currentState!.validate()) {
  //     _authService.setAuthInfo(firstNameController.text.trim(),
  //         lastNameController.text.trim(), phoneNumberController.text.trim());
  //     rebuildUi();
  //     _navigationService.navigateTo(Routes.otpVerificationView,
  //         arguments: OTPVerificationArguments(type: 'phone'));
  //   }
  // }

  setupFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithHomeView();
  }
}
