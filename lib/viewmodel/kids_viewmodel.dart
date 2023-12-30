
import 'package:cool_dropdown/models/cool_dropdown_item.dart';

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

}
