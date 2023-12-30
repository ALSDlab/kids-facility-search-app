import 'dart:convert';

import 'package:kids_facility_search_app/dto/kids_dto.dart';
import 'package:http/http.dart' as http;

class KidsFacilityApi {
  Future<KidsFacilityDto> getKidsFacilityResults(
      int currentPage, String facilityCode) async {
    const serviceKey =
        '2pf%2BeRBua6cRJWoNe8YetUzxBOWoceYzC693Iy4JoYEjtXtyjv5oREtSf31IlQSsy8qo6mvUV0yuRTD7McmPKw%3D%3D';
    final response = await http.get(Uri.parse(
        'https://apis.data.go.kr/1741000/pfc2/pfc/getPfctInfo2?serviceKey=$serviceKey&pageIndex=$currentPage&recordCountPerPage=10&instlPlaceCd=$facilityCode'));
    return KidsFacilityDto.fromJson(jsonDecode(response.body));
  }
}
