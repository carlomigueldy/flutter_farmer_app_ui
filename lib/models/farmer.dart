import 'package:json_annotation/json_annotation.dart';

part 'farmer.g.dart';

@JsonSerializable(
  nullable: false,
  fieldRename: FieldRename.snake,
)
class Farmer {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String description;
  final String ships;
  final double rating;
  final String image;
  final String backgroundImage;

  Farmer({
    this.id,
    this.firstName: "",
    this.lastName: "",
    this.fullName: "",
    this.description: "",
    this.ships: "",
    this.rating: 0,
    this.image: "",
    this.backgroundImage: "",
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);
  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}
