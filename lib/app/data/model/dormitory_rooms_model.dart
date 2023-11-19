import 'cess_model.dart';
import 'dormitory_bed_model.dart';
import 'food_model.dart';
import 'offers_model.dart';
import 'tax_model.dart';

class DormitoryRoomModel {
  DormitoryRoomModel({
    this.rows,
    this.columns,
    this.beds,
    this.no,
    this.roomType,
    this.foods,
    this.name,
    this.maxOccupents,
    this.offers,
    this.cess,
    this.taxPercent,
    this.imageUrls,
    this.amenities,
  });
  int? rows;
  int? columns;
  List<DormitoryBedModel>? beds;
  String? no;
  String? roomType;
  List<FoodModel>? foods;
  String? name;
  int? maxOccupents;
  OffersModel? offers;
  CessModel? cess;
  TaxModel? taxPercent;
  List<String>? imageUrls;
  List<String>? amenities;
}
