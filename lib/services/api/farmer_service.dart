import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../../models/farmer.dart';

@lazySingleton
class FarmerService with ReactiveServiceMixin {
  RxValue<List<Farmer>> _farmers = RxValue<List<Farmer>>(initial: [
    Farmer(
      id: 1,
      fullName: 'Elston Gullan',
      ships: 'Ships 10 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/2804327/pexels-photo-2804327.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    ),
    Farmer(
      id: 2,
      fullName: 'Maria Paula',
      ships: 'Ships 9 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/2321837/pexels-photo-2321837.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 2,
      fullName: 'Sophie Asveld',
      ships: 'Ships 4 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/4911744/pexels-photo-4911744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    Farmer(
      id: 2,
      fullName: 'Masood El Toure',
      ships: 'Ships 8 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/47862/peasant-farmer-farmer-romania-botiza-47862.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 2,
      fullName: 'Stephanie Bailey',
      ships: 'Ships 2 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/5529939/pexels-photo-5529939.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 2,
      fullName: 'John Doe',
      ships: 'Ships 3 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/45852/farmer-smile-man-person-45852.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 2,
      fullName: 'Ada Lovelace',
      ships: 'Ships 13 ton',
      rating: 5.0,
      image:
          'https://images.pexels.com/photos/2519332/pexels-photo-2519332.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
  ]);

  List<Farmer> get farmers => _farmers.value;

  Future<Farmer> findById({
    @required int farmerId,
  }) async {
    return _farmers.value.firstWhere((element) => element.id == farmerId);
  }
}
