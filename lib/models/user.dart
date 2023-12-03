import 'package:sdg_hackaton_app/models/investment.dart';

class UserModel {
  String? uid;
  String? name;
  String? phoneNumber;
  String? email;
  double? walletBalance;
  List<InvestmentModel>? investments;

  UserModel(
      {this.uid,
      this.name,
      this.phoneNumber,
      this.email,
      this.investments,
      this.walletBalance});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'uid': uid,
      'walletBalance': walletBalance ?? 0.0,
      'investments': investments == null
          ? []
          : investments?.map((v) => v.toJson()).toList()
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    List<InvestmentModel> getInvestments() {
      List<InvestmentModel> list = [];
      if (map['investments'] != null && map['investments'].isNotEmpty) {
        map['investments'].forEach((investment) {
          list.add(InvestmentModel.fromJson(investment));
        });
      }
      return list;
    }

    return UserModel(
        uid: map['uid'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        walletBalance: map['walletBalance'],
        investments: getInvestments());
  }
}
