import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

class FacilityScrollWidget extends StatefulWidget {
  const FacilityScrollWidget({super.key});

  @override
  State<FacilityScrollWidget> createState() => _FacilityScrollWidgetState();
}

List<CoolDropdownItem<String>> dropdownItemList = [];

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

List<String> facilitiesName = facilities.keys.toList();

class _FacilityScrollWidgetState extends State<FacilityScrollWidget> {
  List<CoolDropdownItem<String>> facilityDropdownItems = [];

  final facilityDropdownController = DropdownController();

  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CoolDropdown<String>(
              controller: facilityDropdownController,
              dropdownList: facilityDropdownItems,
              defaultItem: null,
              onChange: (value) async {
                if (facilityDropdownController.isError) {
                  await facilityDropdownController.resetError();
                }
                facilityDropdownController.close();

                //  리스트 출력
              },
              onOpen: (value) {},
              resultOptions: const ResultOptions(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                icon: SizedBox(
                  width: 10,
                  height: 10,
                  child: CustomPaint(
                    painter: DropdownArrowPainter(),
                  ),
                ),
                render: ResultRender.all,
                placeholder: '분류를 선택하세요.',
                isMarquee: true,
              ),
              dropdownOptions: const DropdownOptions(
                  top: 20,
                  height: 400,
                  gap: DropdownGap.all(5),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  align: DropdownAlign.left,
                  animationType: DropdownAnimationType.size),
              dropdownTriangleOptions: const DropdownTriangleOptions(
                width: 20,
                height: 30,
                align: DropdownTriangleAlign.left,
                borderRadius: 3,
                left: 20,
              ),
              dropdownItemOptions: const DropdownItemOptions(
                isMarquee: true,
                mainAxisAlignment: MainAxisAlignment.start,
                render: DropdownItemRender.all,
                height: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
