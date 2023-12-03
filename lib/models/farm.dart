import 'package:sdg_hackaton_app/models/investment.dart';

class FarmModel {
  String? uid;
  String? name;
  String? phoneNumber;
  String? logo;
  String? status;
  String? type;
  List<InvestmentModel>? investments;

  FarmModel(
      {this.uid,
      this.name,
      this.phoneNumber,
      this.investments,
      this.logo,
      this.status,
      this.type});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'logo': logo,
      'status': status,
      'type': type,
      'investments': investments == null
          ? []
          : investments?.map((v) => v.toJson()).toList()
    };
  }

  factory FarmModel.fromJson(Map<String, dynamic> map) {
    List<InvestmentModel> getInvestments() {
      List<InvestmentModel> list = [];
      if (map['investments'] != null && map['investments'].isNotEmpty) {
        map['investments'].forEach((investment) {
          list.add(InvestmentModel.fromJson(investment));
        });
      }
      return list;
    }

    return FarmModel(
        uid: map['uid'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        logo: map['logo'],
        status: map['status'],
        type: map['type'],
        investments: getInvestments());
  }
}
