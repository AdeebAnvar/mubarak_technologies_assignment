import 'package:mubarak_technologies_assignent/app/data/model/cess_model.dart';
import 'package:mubarak_technologies_assignent/app/data/model/dormitory_bed_model.dart';
import 'package:mubarak_technologies_assignent/app/data/model/food_model.dart';
import 'package:mubarak_technologies_assignent/app/data/model/offers_model.dart';
import 'package:mubarak_technologies_assignent/app/data/model/tax_model.dart';

class DormitoryRoomModel {
  int? rows;
  int? columns;
  List<DormitoryBedModel>? bed;
  String? no;
  String? roomType;
  List<FoodModel>? foods;
  String? name;
  int? maxOccupents;
  OffersModel? offers;
  CessModel? cess;
  TaxModel? taxPercent;
  List<String>? imageUrls;

  DormitoryRoomModel(
      {this.rows,
      this.columns,
      this.bed,
      this.no,
      this.roomType,
      this.foods,
      this.name,
      this.maxOccupents,
      this.offers,
      this.cess,
      this.taxPercent,
      this.imageUrls});
}
