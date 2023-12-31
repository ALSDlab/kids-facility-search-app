class KidsFacilityItemModel {
  String title;
  String zipNum;
  String address;
  String placeCode;
  String inOutdoor;
  String latNum;
  String lngNum;

//<editor-fold desc="Data Methods">
  KidsFacilityItemModel({
    required this.title,
    required this.zipNum,
    required this.address,
    required this.placeCode,
    required this.inOutdoor,
    required this.latNum,
    required this.lngNum,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KidsFacilityItemModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          zipNum == other.zipNum &&
          address == other.address &&
          placeCode == other.placeCode &&
          inOutdoor == other.inOutdoor &&
          latNum == other.latNum &&
          lngNum == other.lngNum);

  @override
  int get hashCode =>
      title.hashCode ^
      zipNum.hashCode ^
      address.hashCode ^
      placeCode.hashCode ^
      inOutdoor.hashCode ^
      latNum.hashCode ^
      lngNum.hashCode;

  @override
  String toString() {
    return 'KidsFacilityItemModel{ title: $title, zipNum: $zipNum, address: $address, placeCode: $placeCode, inOutdoor: $inOutdoor, latNum: $latNum, lngNum: $lngNum,}';
  }

  KidsFacilityItemModel copyWith({
    String? title,
    String? zipNum,
    String? address,
    String? placeCode,
    String? inOutdoor,
    String? latNum,
    String? lngNum,
  }) {
    return KidsFacilityItemModel(
      title: title ?? this.title,
      zipNum: zipNum ?? this.zipNum,
      address: address ?? this.address,
      placeCode: placeCode ?? this.placeCode,
      inOutdoor: inOutdoor ?? this.inOutdoor,
      latNum: latNum ?? this.latNum,
      lngNum: lngNum ?? this.lngNum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'zipNum': zipNum,
      'address': address,
      'placeCode': placeCode,
      'inOutdoor': inOutdoor,
      'latNum': latNum,
      'lngNum': lngNum,
    };
  }

  factory KidsFacilityItemModel.fromMap(Map<String, dynamic> map) {
    return KidsFacilityItemModel(
      title: map['title'] as String,
      zipNum: map['zipNum'] as String,
      address: map['address'] as String,
      placeCode: map['placeCode'] as String,
      inOutdoor: map['inOutdoor'] as String,
      latNum: map['latNum'] as String,
      lngNum: map['lngNum'] as String,
    );
  }

//</editor-fold>
}
