import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:kids_facility_search_app/dto/kids_dto.dart';
import 'package:kids_facility_search_app/ui/widget/facility_item_card.dart';
import 'package:kids_facility_search_app/viewmodel/kids_viewmodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final facilityDropdownController = DropdownController();
  final viewModel = ViewModel();
  var selected = '';

  List<Items> _facilitiesResults = [];
  int currentPage = 1;
  int _totalCount = 0;
  int _totalPage = 0;

  Future<void> getKidsFacilityResults(
      int currentPage, String facilityCode) async {
    const serviceKey =
        '2pf%2BeRBua6cRJWoNe8YetUzxBOWoceYzC693Iy4JoYEjtXtyjv5oREtSf31IlQSsy8qo6mvUV0yuRTD7McmPKw%3D%3D';
    final response = await http.get(Uri.parse(
        'https://apis.data.go.kr/1741000/pfc2/pfc/getPfctInfo2?serviceKey=$serviceKey&pageIndex=$currentPage&recordCountPerPage=10&instlPlaceCd=$facilityCode'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      final List<dynamic> facilitiesList = data['response']['body']['items'];
      final totalCount = data['response']['body']['totalCnt'];
      final pageCount = data['response']['body']['totalPageCnt'];

      List<Items> results = [];
      for (var facility in facilitiesList) {
        results.add(Items.fromJson(facility));
      }
      setState(() {
        _facilitiesResults = results;
        _totalCount = totalCount;
        _totalPage = pageCount;
      });
    } else {
      throw Exception('Failed to load address results');
    }
  }

  @override
  void dispose() {
    facilityDropdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
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
                          dropdownList: viewModel.facilityDropdownItems,
                          defaultItem: null,
                          onChange: (value) async {
                            if (facilityDropdownController.isError) {
                              await facilityDropdownController.resetError();
                            }
                            facilityDropdownController.close();
                            setState(() {
                              selected = value;
                              getKidsFacilityResults(1, selected);
                            });
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
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              align: DropdownAlign.left,
                              animationType: DropdownAnimationType.size),
                          dropdownTriangleOptions:
                              const DropdownTriangleOptions(
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
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _facilitiesResults.length,
                  itemBuilder: (context, index) {
                    final facilityResult = _facilitiesResults[index];
                    return FacilityCard(facilityItem: facilityResult);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: _totalPage,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        String selectedValue = selected;
                        getKidsFacilityResults(index + 1, selectedValue);
                      },
                      child: Text('${index + 1}',
                          style: const TextStyle(
                              fontSize: 18, fontFamily: 'Dohyeon')),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '검색결과: $_totalCount',
                  style: const TextStyle(fontFamily: 'Dohyeon'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
