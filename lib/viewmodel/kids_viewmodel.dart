import 'dart:async';

import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:kids_facility_search_app/model/facility_model.dart';
import 'package:kids_facility_search_app/repository/facility_repository.dart';

final class ViewModel {
  List<CoolDropdownItem<String>> facilityDropdownItems = [];
  Map<String, String> facilities = {
    '목욕장업소': 'A001',
    '도로휴게시설': 'A002',
    '도시공원': 'A003',
    '식품접객업소': 'A004',
    '아동복지시설': 'A005',
    '어린이집': 'A006',
    '유치원': 'A007',
    '대규모점포': 'A008',
    '의료기관': 'A009',
    '주택단지': 'A010',
    '학교': 'A011',
    '학원': 'A012',
    '놀이제공영업소': 'A013',
    '주상복합': 'A020',
    '도서관': 'A021',
    '박물관': 'A022',
    '종교시설': 'A023',
    '자연마을': 'A024',
    '영화관': 'A025',
  };
  List<String> facilitiesName = [];
  List _searchResults = [];

  List<KidsFacilityItemModel> _facilitiesResults = [];
  int _totalCount = 0;
  int _totalPage = 0;
  final _loadingController = StreamController<bool>();

  List get searchResults => _searchResults;

  List<KidsFacilityItemModel> get facilitiesResults => _facilitiesResults;

  int get totalCount => _totalCount;

  int get totalPage => _totalPage;

  Stream<bool> get loadingController => _loadingController.stream;

  ViewModel() {
    facilitiesName = facilities.keys.toList();
    for (var i = 0; i < facilitiesName.length; i++) {
      facilityDropdownItems.add(CoolDropdownItem<String>(
          label: facilitiesName[i],
          // icon: Container(
          //   margin: const EdgeInsets.only(left: 10),
          //   height: 25,
          //   width: 25,
          //   child: SvgPicture.asset(
          //     'assets/${facilitiesName[i]}.svg',
          //   ),
          // ),
          // selectedIcon: Container(
          //   margin: const EdgeInsets.only(left: 10),
          //   height: 25,
          //   width: 25,
          //   child: SvgPicture.asset(
          //     'assets/${facilitiesName[i]}.svg',
          //     color: const Color(0xFF6FCC76),
          //   ),
          // ),
          value: '${facilities[facilitiesName[i]]}'));
    }
  }

  final _repository = KidsFacilityItemsRepository();

  Future<void> searchFacilities(int currentPage, String facilityCode) async {
    //화면갱신
    _loadingController.add(true);
    _searchResults =
        await _repository.getFacilityItems(currentPage, facilityCode);
    _facilitiesResults = _searchResults[0];
    _totalPage = _searchResults[1].pageCount;
    _totalCount = _searchResults[1].totalCount;

    //다시 화면갱신
    _loadingController.add(false);
  }
}
