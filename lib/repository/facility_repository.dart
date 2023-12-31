import 'package:kids_facility_search_app/mapper/facility_mapper.dart';
import 'package:kids_facility_search_app/source/facility_source.dart';

class KidsFacilityItemsRepository {
  final _api = FacilityApi();

  @override
  Future<List> getFacilityItems(int currentPage, String facilityCode) async {
    final kidsDto = await _api.getKidsFacilityResults(currentPage, facilityCode);
    if (kidsDto.response?.body?.items == null) {
      return [];
    }
    List result = [];
    result.add(
        kidsDto.response!.body!.items!.map((e) => e.toFacilityItem()).toList());
    result.add(kidsDto.response!.body!.toFacilityCount());

    return result;
  }
}
