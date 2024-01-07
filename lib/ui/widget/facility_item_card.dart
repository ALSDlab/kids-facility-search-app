import 'package:flutter/material.dart';
import 'package:kids_facility_search_app/model/facility_model.dart';

class FacilityCard extends StatelessWidget {
  const FacilityCard({super.key, required this.facilityItem});

  final KidsFacilityItemModel facilityItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
      padding: const EdgeInsets.all(17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${facilityItem.title} (${facilityItem.inOutdoor})',
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
                Text(
                  '[${facilityItem.zipNum}] ${facilityItem.address}',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  (facilityItem.distance == -1)
                      ? '위치정보 없음'
                      : '${facilityItem.distance} km',
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
