import 'package:get/get.dart';
import '../../../data/model/dormitory_bed_model.dart';
import '../../../data/model/dormitory_model.dart';
import '../../../data/model/dormitory_rooms_model.dart';
import '../../../data/model/tax_model.dart';
import '../../../data/repository/dormitories_repository.dart';

class HomeController extends GetxController {
  final DormitoriesRepository repository = DormitoriesRepository();
  final RxList<DormitoryModel> dormitories = <DormitoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDormitories();
  }

  void fetchDormitories() {
    dormitories.assignAll(repository.getDormitories());
  }

  double getRoomPrice(DormitoryRoomModel room) {
    return room.beds!.isEmpty ? 0 : room.beds!.first.price!.toDouble();
  }

  int calculateTax(DormitoryRoomModel room, double discountedPrice) {
    double taxAmount = 0.0;

    if (room.taxPercent != null) {
      final TaxModel tax = room.taxPercent!;

      if (tax.taxOnValue != null && tax.percent != null) {
        if (tax.taxOnValue!) {
          taxAmount += discountedPrice * (tax.percent! / 100);
        } else {
          if (tax.inclusiveTax != null && tax.inclusiveTax!) {
            final double originalPrice =
                discountedPrice / (1 + tax.percent! / 100);
            taxAmount += discountedPrice - originalPrice;
          } else {
            taxAmount += discountedPrice * (tax.percent! / 100);
          }
        }
      }
    }

    return taxAmount.round();
  }

  double getLowestBedPriceAfterDiscountCalculation(DormitoryRoomModel room) {
    double lowestPriceAfterCalculation = double.infinity;

    for (final DormitoryBedModel bed in room.beds!) {
      final double discountedPrice = getDiscountedPrice(
        originalPrice: bed.price!.toDouble(),
        flatDiscount: room.offers?.flatDiscount,
        offPercent: room.offers?.offPercent,
      );

      if (discountedPrice < lowestPriceAfterCalculation) {
        lowestPriceAfterCalculation = discountedPrice;
      }
    }

    return lowestPriceAfterCalculation;
  }

  double getLowestBedPrice(DormitoryRoomModel room) {
    double lowestPrice = double.infinity;

    for (final DormitoryBedModel bed in room.beds!) {
      if (bed.price! < lowestPrice) {
        lowestPrice = bed.price!.toDouble();
      }
    }

    return lowestPrice;
  }

  double getDiscountedPrice(
      {required double originalPrice,
      required double? flatDiscount,
      required double? offPercent}) {
    if (flatDiscount != null && flatDiscount > 0) {
      return originalPrice - flatDiscount;
    } else if (offPercent != null && offPercent > 0) {
      return originalPrice - (originalPrice * offPercent / 100);
    } else {
      return originalPrice;
    }
  }

  double calculateDiscountedPrice(DormitoryRoomModel room) {
    final double lowestBedPrice = getLowestBedPrice(room);
    final double discountedPrice = getDiscountedPrice(
      originalPrice: lowestBedPrice,
      flatDiscount: room.offers?.flatDiscount,
      offPercent: room.offers?.offPercent,
    );
    return discountedPrice;
  }
}
