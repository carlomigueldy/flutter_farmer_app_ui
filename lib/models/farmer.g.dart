// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Farmer _$FarmerFromJson(Map<String, dynamic> json) {
  return Farmer(
    id: json['id'] as int,
    fullName: json['full_name'] as String,
    ships: json['ships'] as String,
    rating: (json['rating'] as num).toDouble(),
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$FarmerToJson(Farmer instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'ships': instance.ships,
      'rating': instance.rating,
      'image': instance.image,
    };
