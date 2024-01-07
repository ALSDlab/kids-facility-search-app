import 'package:flutter/material.dart';
import 'package:kids_facility_search_app/ui/page/main_page.dart';
import 'package:kids_facility_search_app/viewmodel/kids_viewmodel.dart';
import 'package:provider/provider.dart';

import 'di/di_setup.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => getIt<ViewModel>(),
        child: const MainPage(),
      ),
    );
  }
}
