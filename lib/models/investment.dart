class InvestmentModel {
  String? uid;
  String? title;
  double? roi;
  int? farmId;
  String? farmName;
  bool? isActive;
  int? availableUnits;
  int? purchasedUnits;
  double? perUnitValue;
  String? description;
  String? dateJoined;

  InvestmentModel({
    this.title,
    this.uid,
    this.availableUnits,
    this.description,
    this.perUnitValue,
    this.farmId,
    this.farmName,
    this.isActive,
    this.purchasedUnits,
    this.roi,
    this.dateJoined,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'roi': roi,
      'farmId': farmId,
      'farmName': farmName,
      'isActive': isActive,
      'availableUnits': availableUnits,
      'purchasedUnits': purchasedUnits,
      'perUnitValue': perUnitValue,
      'description': description,
      'dateJoined': dateJoined,
    };
  }

  factory InvestmentModel.fromJson(Map<String, dynamic> map) {
    return InvestmentModel(
      uid: map['uid'],
      title: map['title'],
      roi: map['roi'],
      farmId: map['farmId'],
      farmName: map['farmName'],
      isActive: map['isActive'],
      availableUnits: map['availableUnits'],
      purchasedUnits: map['purchasedUnits'],
      perUnitValue: map['perUnitValue'],
      description: map['description'],
      dateJoined: map['dateJoined']
    );
  }
}
