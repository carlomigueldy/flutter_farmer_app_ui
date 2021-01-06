import 'package:json_annotation/json_annotation.dart';

part 'food_crop.g.dart';

@JsonSerializable(
  nullable: false,
  fieldRename: FieldRename.snake,
)
class FoodCrop {
  final int id;
  final String title;
  final String farmers;
  final String image;

  FoodCrop({
    this.id,
    this.title: "",
    this.farmers: "",
    this.image: "",
  });

  factory FoodCrop.fromJson(Map<String, dynamic> json) =>
      _$FoodCropFromJson(json);
  Map<String, dynamic> toJson() => _$FoodCropToJson(this);
}
