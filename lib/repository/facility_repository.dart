

abstract interface class KidsFacilityItemsRepository {
    Future<List> getFacilityItems(int currentPage, String facilityCode);
}
