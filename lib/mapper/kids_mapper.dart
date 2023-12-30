import 'package:kids_facility_search_app/dto/kids_dto.dart';
import 'package:kids_facility_search_app/model/kids_model.dart';

extension DtoToModel on Items {
  KidsFacilityItemModel toFacilityItem() {
    return KidsFacilityItemModel(
        title: pfctNm ?? '이름없음',
        zipNum: zip ?? '',
        address: ronaAddr ?? '주소없음',
        placeCode: instlPlaceCd ?? '',
        inOutdoor: idrodrCdNm ?? '-',
        latNum: latCrtsVl ?? '',
        lngNum: lotCrtsVl ?? '');
  }
}
