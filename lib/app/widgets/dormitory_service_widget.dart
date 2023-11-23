import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/dormitory_model.dart';
import '../data/model/dormitory_rooms_model.dart';
import '../modules/home/controllers/home_controller.dart';

class DormitoryServiceWidget extends StatelessWidget {
  const DormitoryServiceWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.dormitories.isEmpty) {
          return const CircularProgressIndicator();
        } else {
          double? discountedPrice;
          final DormitoryRoomModel lowestPricedRoom = controller.dormitories
              .expand((DormitoryModel dormitory) => dormitory.rooms!)
              .reduce((DormitoryRoomModel a, DormitoryRoomModel b) {
            final double aPrice =
                controller.getLowestBedPriceAfterDiscountCalculation(a);
            final double bPrice =
                controller.getLowestBedPriceAfterDiscountCalculation(b);
            discountedPrice = aPrice < bPrice ? aPrice : bPrice;
            return aPrice < bPrice ? a : b;
          });
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(lowestPricedRoom.imageUrls![0],
                  height: 150, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 8),
              Text(
                lowestPricedRoom.name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Lowest Priced Room:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                '${lowestPricedRoom.name} - ₹$discountedPrice',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          );
        }
      },
    );
  }
}
