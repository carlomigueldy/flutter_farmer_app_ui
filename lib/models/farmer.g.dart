// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Farmer _$FarmerFromJson(Map<String, dynamic> json) {
  return Farmer(
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    fullName: json['full_name'] as String,
    description: json['description'] as String,
    ships: json['ships'] as String,
    rating: (json['rating'] as num).toDouble(),
    image: json['image'] as String,
    backgroundImage: json['background_image'] as String,
    isPesticideFreeFarm: json['is_pesticide_free_farm'] as bool,
  );
}

Map<String, dynamic> _$FarmerToJson(Farmer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'description': instance.description,
      'ships': instance.ships,
      'rating': instance.rating,
      'image': instance.image,
      'background_image': instance.backgroundImage,
      'is_pesticide_free_farm': instance.isPesticideFreeFarm,
    };
