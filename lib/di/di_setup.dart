import 'package:get_it/get_it.dart';

import '../repository/facility_repository.dart';
import '../repository/facility_repository_impl.dart';
import '../viewmodel/kids_viewmodel.dart';

final getIt = GetIt.instance;

void diSetup(){
   getIt.registerSingleton<KidsFacilityItemsRepository>(KidsFacilityItemsRepositoryImpl());
   getIt.registerFactory(() => ViewModel(repository: getIt<KidsFacilityItemsRepository>()));
}