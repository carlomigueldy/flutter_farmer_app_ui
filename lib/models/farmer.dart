import 'package:json_annotation/json_annotation.dart';

part 'farmer.g.dart';

@JsonSerializable(
  nullable: false,
  fieldRename: FieldRename.snake,
)
class Farmer {
  final int id;
  final String fullName;
  final String ships;
  final double rating;
  final String image;

  Farmer({
    this.id,
    this.fullName: "",
    this.ships: "",
    this.rating: 0,
    this.image: "",
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);
  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}
