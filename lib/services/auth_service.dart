// ignore_for_file: depend_on_referenced_packages

import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/models/user.dart';
import 'package:sdg_hackaton_app/services/api_service.dart';
import 'package:get/get.dart';
import 'package:sdg_hackaton_app/services/firestore_service.dart';
import 'package:sdg_hackaton_app/utilities/constants/urls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();
  final _fireStoreService = locator<FireStoreService>();
  final _navigationService = locator<NavigationService>();

  String? _email;
  String? _phoneNumber;
  UserModel? _user;

  String get email => _email ?? '';
  String get phoneNumber => _phoneNumber ?? '';
  UserModel get user => _user ?? UserModel();

  void setEmail(String value) {
    _email = value;
  }

  setToken(String token) {
    _apiService.setToken(value: token);
  }

  // Future<Response> login(
  //     {required String email, required String password}) async {
  //   return await _apiService
  //       .postData(loginUrl, {"email": email, "password": password});
  // }

  Future<void> login({required String email, required String password}) async {
    // return await _apiService
    //     .postData(loginUrl, {"email": email, "password": password});
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        _fireStoreService.getUser(result.user?.uid).then((value) {
          if (value != null) {
            _user = value;
            _navigationService.navigateTo(Routes.homeView);
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      print('ass ---- ${e.code}');
      if (e.code == 'invalid-credential') {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'An error occured',
          description: 'The email or password is incorrect',
        );
      } else {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'An error occured',
          description: '${e.code}.',
        );
      }
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$e',
      );
    }
  }

  Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    // return await _apiService.postData(
    //     loginUrl, {"email": email, "password": password, "name": name});
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        var userModel = UserModel(
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          uid: result.user?.uid,
          walletBalance: 0.0,
          investments: [],
        );
        _fireStoreService.addUser(userModel).then((value) {
          if (value) {
            _user = userModel;
            _navigationService.navigateTo(Routes.homeView);
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'An error occured',
          description: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'An error occured',
          description: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$e',
      );
    }
  }
}
