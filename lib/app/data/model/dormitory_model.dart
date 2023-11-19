import 'package:mubarak_technologies_assignent/app/data/model/dormitory_rooms_model.dart';

class DormitoryModel {
  String? name;
  List<String>? imageUrls;
  String? badgeText;
  int? userRating;
  List<String>? activities;
  List<String>? fecilities;
  List<DormitoryRoomModel>? rooms;

  DormitoryModel(
      {this.name,
      this.imageUrls,
      this.badgeText,
      this.userRating,
      this.activities,
      this.fecilities,
      this.rooms});
}
