import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../data/model/dormitory_model.dart';
import '../data/model/dormitory_rooms_model.dart';
import '../data/model/offers_model.dart';
import '../modules/home/controllers/home_controller.dart';

class DormitoryRoomsWidget extends StatelessWidget {
  const DormitoryRoomsWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.dormitories.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: controller.dormitories.length,
              itemBuilder: (BuildContext context, int index) {
                final DormitoryModel dormitory = controller.dormitories[index];
                return Container(
                  margin: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: dormitory.rooms!.map((DormitoryRoomModel room) {
                      final double lowestBedPrice =
                          controller.getLowestBedPrice(room);
                      final double discountedPrice =
                          room.offers!.getDiscountedPrice(lowestBedPrice);
                      final int taxAmount =
                          controller.calculateTax(room, discountedPrice);

                      return Card(
                        elevation: 4,
                        child: ListTile(
                          leading: Image.network(room.imageUrls![0]),
                          title: Text(room.name.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    ' ₹ $discountedPrice ',
                                  ),
                                  Text(
                                    ' ₹ $lowestBedPrice ',
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              _buildDiscountInfo(room.offers!),
                              const SizedBox(height: 5),
                              Text('Tax: ₹$taxAmount'),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildDiscountInfo(OffersModel offers) {
    if (offers.flatDiscount != null) {
      return Text('Flat Discount: ₹${offers.flatDiscount}');
    } else if (offers.offPercent != null) {
      return Text('${offers.name} offer: ${offers.offPercent!.round()}% off');
    } else {
      return Container();
    }
  }
}
