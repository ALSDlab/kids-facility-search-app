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

  Map<String, dynamic> toMap() {
    return {
      'totalCount': totalCount,
      'pageCount': pageCount,
    };
  }

  factory CountModel.fromMap(Map<String, dynamic> map) {
    return CountModel(
      totalCount: map['totalCount'] as int,
      pageCount: map['pageCount'] as int,
    );
  }

//</editor-fold>
}