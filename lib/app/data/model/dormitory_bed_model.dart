class DormitoryBedModel {
  DormitoryBedModel({
    this.column,
    this.row,
    this.level,
    this.bedNo,
    this.isOccuppied,
    this.isUpperDeck,
    this.price,
  });
  int? column;
  int? row;
  int? level;
  String? bedNo;
  bool? isOccuppied;
  bool? isUpperDeck;
  num? price;
}
