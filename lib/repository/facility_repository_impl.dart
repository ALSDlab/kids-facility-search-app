import 'package:kids_facility_search_app/mapper/facility_mapper.dart';
import 'package:kids_facility_search_app/repository/facility_repository.dart';
import 'package:kids_facility_search_app/source/facility_source.dart';
import 'package:latlong2/latlong.dart';

import 'location_repository.dart';

class KidsFacilityItemsRepositoryImpl implements KidsFacilityItemsRepository {
  final _api = FacilityApi();
  final _locationRepository = LocationRepository();
  final distance = Distance();

  @override
  Future<List> getFacilityItems(int currentPage, String facilityCode) async {
    final kidsDto =
        await _api.getKidsFacilityResults(currentPage, facilityCode);
    final position = await _locationRepository.getCurrentLocation();
    if (kidsDto.response?.body?.items == null) {
      return [];
    }
    List result = [];
    final facilityItems =
        kidsDto.response!.body!.items!.map((e) => e.toFacilityItem()).toList();
    for (var facility in facilityItems) {
      if (facility.latNum == '' || facility.lngNum == '') {
        facility.distance = 10000;
      } else {
        final km = distance.as(
            LengthUnit.Kilometer,
            LatLng(
                double.parse(facility.latNum), double.parse(facility.lngNum)),
            LatLng(position.latitude, position.longitude));
        facility.distance = km;
      }
    }
    facilityItems.sort((a,b) => a.distance.compareTo(b.distance));

    result.add(facilityItems);
    result.add(kidsDto.response!.body!.toFacilityCount());

    return result;
  }
}
