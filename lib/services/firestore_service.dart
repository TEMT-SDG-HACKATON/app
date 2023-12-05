// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/models/user.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

class FireStoreService {
  final _users = FirebaseFirestore.instance.collection('users');
  final _farms = FirebaseFirestore.instance.collection('farms');
  final _auth = FirebaseAuth.instance;
  final _dialogService = locator<DialogService>();

  Future<bool> addUser(UserModel userModel) async {
    bool response = false;
    await _users.doc(userModel.uid).set(userModel.toJson()).then((value) {
      response = true;
    }).catchError((error) {
      response = false;
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$error',
      );
    });
    return response;
  }

  Future<UserModel?> getUser(uid) async {
    try {
      var data = await _users.doc(uid).get();
      return UserModel.fromJson(data.data() as Map<String, dynamic>);
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$e',
      );
      return null;
    }
  }

  Future<bool> updateUserWallet(
      {required String uid, required double amount}) async {
    bool response = false;
    await _users
        .doc(uid)
        // .update({'info.address.zipcode': 90210})
        .update({'walletBalance': amount}).then((value) {
      response = true;
    }).catchError((error) {
      response = false;
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$error',
      );
    });
    return response;
  }
}
