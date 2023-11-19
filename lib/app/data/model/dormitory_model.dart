import 'dormitory_rooms_model.dart';

class DormitoryModel {
  DormitoryModel({
    this.name,
    this.imageUrls,
    this.badgeText,
    this.userRating,
    this.activities,
    this.fecilities,
    this.rooms,
  });
  String? name;
  List<String>? imageUrls;
  String? badgeText;
  int? userRating;
  List<String>? activities;
  List<String>? fecilities;
  List<DormitoryRoomModel>? rooms;
}
