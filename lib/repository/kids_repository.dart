import 'package:kids_facility_search_app/mapper/kids_mapper.dart';
import 'package:kids_facility_search_app/model/kids_model.dart';
import 'package:kids_facility_search_app/source/kidsSource.dart';

class KidsFacilityItemsRepository {
  final _api = KidsFacilityApi();

  @override
  Future<List<KidsFacilityItemModel>> getFacilityItems(int currentPage, String facilityCode) async {
    final kidsDto = await _api.getKidsFacilityResults(currentPage, facilityCode);
    if (kidsDto.response?.body?.items == null) {
      return [];
    }

    return kidsDto.response!.body!.items!.map((e) => e.toFacilityItem()).toList();
  }
}