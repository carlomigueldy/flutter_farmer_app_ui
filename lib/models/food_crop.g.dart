// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_crop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCrop _$FoodCropFromJson(Map<String, dynamic> json) {
  return FoodCrop(
    id: json['id'] as int,
    title: json['title'] as String,
    farmers: json['farmers'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$FoodCropToJson(FoodCrop instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'farmers': instance.farmers,
      'image': instance.image,
    };
