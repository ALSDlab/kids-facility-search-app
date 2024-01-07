class KidsFacilityItemModel {
  String title;
  String zipNum;
  String address;
  String placeCode;
  String inOutdoor;
  String latNum;
  String lngNum;
  late String distance;

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

  Map<String, dynamic> toJson() {
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

  factory KidsFacilityItemModel.fromJson(Map<String, dynamic> map) {
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

class CountModel {
  int totalCount;
  int pageCount;

//<editor-fold desc="Data Methods">
  CountModel({
    required this.totalCount,
    required this.pageCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountModel &&
          runtimeType == other.runtimeType &&
          totalCount == other.totalCount &&
          pageCount == other.pageCount);

  @override
  int get hashCode => totalCount.hashCode ^ pageCount.hashCode;

  @override
  String toString() {
    return 'CountModel{ totalCount: $totalCount, pageCount: $pageCount,}';
  }

  CountModel copyWith({
    int? totalCount,
    int? pageCount,
  }) {
    return CountModel(
      totalCount: totalCount ?? this.totalCount,
      pageCount: pageCount ?? this.pageCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalCount': totalCount,
      'pageCount': pageCount,
    };
  }

  factory CountModel.fromJson(Map<String, dynamic> map) {
    return CountModel(
      totalCount: map['totalCount'] as int,
      pageCount: map['pageCount'] as int,
    );
  }

//</editor-fold>
}
