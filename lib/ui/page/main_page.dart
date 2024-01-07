import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:kids_facility_search_app/ui/widget/facility_item_card.dart';
import 'package:kids_facility_search_app/viewmodel/kids_viewmodel.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final facilityDropdownController = DropdownController();
  var selected = '';

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<ViewModel>();
    mainViewModel.selectList();
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
                          dropdownList: mainViewModel.facilityDropdownItems,
                          defaultItem: null,
                          onChange: (value) async {
                            await mainViewModel.searchFacilities(1, value);
                            selected = value;
                            facilityDropdownController.close();
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
              Container(
                height: 20,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: mainViewModel.facilitiesResults.length,
                        itemBuilder: (context, index) {
                          final facilityResult =
                          mainViewModel.facilitiesResults[index];
                          return FacilityCard(facilityItem: facilityResult);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: mainViewModel.totalPage,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () async {
                              await mainViewModel.searchFacilities(
                                  index + 1, selected);
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
                        '검색결과: ${mainViewModel.totalCount}',
                        style: const TextStyle(fontFamily: 'Dohyeon'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
