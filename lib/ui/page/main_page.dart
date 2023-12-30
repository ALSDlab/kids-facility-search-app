import 'package:flutter/material.dart';
import 'package:kids_facility_search_app/ui/widget/facility_scroll_widget.dart';
import 'package:cool_dropdown/cool_dropdown.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FacilityScrollWidget(),
      ),
    );
  }


}
