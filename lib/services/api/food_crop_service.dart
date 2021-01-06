import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../../models/food_crop.dart';

@lazySingleton
class FoodCropService with ReactiveServiceMixin {
  RxValue<List<FoodCrop>> _foodCrops = RxValue<List<FoodCrop>>(initial: [
    FoodCrop(
      id: 1,
      title: 'Milk',
      farmers: '27 Farmers',
      image:
          'https://images.pexels.com/photos/248412/pexels-photo-248412.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    FoodCrop(
      id: 2,
      title: 'Cauliflower',
      farmers: '14 Farmers',
      image:
          'https://images.pexels.com/photos/6316515/pexels-photo-6316515.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    FoodCrop(
      id: 3,
      title: 'Carrot',
      farmers: '10 Farmers',
      image:
          'https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    FoodCrop(
      id: 4,
      title: 'Potato',
      farmers: '10 Farmers',
      image:
          'https://images.pexels.com/photos/2286776/pexels-photo-2286776.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    FoodCrop(
      id: 5,
      title: 'Papayas',
      farmers: '10 Farmers',
      image:
          'https://images.pexels.com/photos/286948/pexels-photo-286948.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    FoodCrop(
      id: 6,
      title: 'Banana',
      farmers: '10 Farmers',
      image:
          'https://images.pexels.com/photos/2238309/pexels-photo-2238309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
  ]);

  List<FoodCrop> get foodCrops => _foodCrops.value;

  Future<FoodCrop> findById({@required int categoryId}) async {
    return _foodCrops.value.firstWhere((element) => element.id == categoryId);
  }
}
