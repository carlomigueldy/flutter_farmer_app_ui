import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../../models/farmer.dart';

String description =
    "When it's time to finally get your children that very first telescope, you want to make sure it's just the right thing. \n \n"
    "There are a number of reasons you should put some serious thought into just what this beginner telescope should look like.";

@lazySingleton
class FarmerService with ReactiveServiceMixin {
  RxValue<List<Farmer>> _farmers = RxValue<List<Farmer>>(initial: [
    Farmer(
      id: 1,
      firstName: 'Elston',
      lastName: 'Gullan',
      fullName: 'Elston Gullan',
      description: description,
      ships: 'Ships 10 ton',
      rating: 5.0,
      isPesticideFreeFarm: true,
      image:
          'https://images.pexels.com/photos/2804327/pexels-photo-2804327.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      backgroundImage:
          'https://images.pexels.com/photos/5980/food-sunset-love-field.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 2,
      firstName: 'Maria',
      lastName: 'Paula',
      fullName: 'Maria Paula',
      description: description,
      ships: 'Ships 9 ton',
      rating: 5.0,
      isPesticideFreeFarm: false,
      image:
          'https://images.pexels.com/photos/2321837/pexels-photo-2321837.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      backgroundImage:
          'https://images.pexels.com/photos/533982/pexels-photo-533982.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 3,
      firstName: 'Sophie',
      lastName: 'Asveld',
      fullName: 'Sophie Asveld',
      description: description,
      ships: 'Ships 4 ton',
      rating: 5.0,
      isPesticideFreeFarm: false,
      image:
          'https://images.pexels.com/photos/4911744/pexels-photo-4911744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      backgroundImage:
          'https://images.pexels.com/photos/265216/pexels-photo-265216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 4,
      firstName: 'Masood',
      lastName: 'El Toure',
      fullName: 'Masood El Toure',
      description: description,
      ships: 'Ships 8 ton',
      rating: 5.0,
      isPesticideFreeFarm: false,
      image:
          'https://images.pexels.com/photos/47862/peasant-farmer-farmer-romania-botiza-47862.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      backgroundImage:
          'https://images.pexels.com/photos/175389/pexels-photo-175389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 5,
      firstName: 'Stephanie',
      lastName: 'Bailey',
      fullName: 'Stephanie Bailey',
      description: description,
      ships: 'Ships 2 ton',
      rating: 5.0,
      isPesticideFreeFarm: false,
      image:
          'https://images.pexels.com/photos/5529939/pexels-photo-5529939.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      backgroundImage:
          'https://images.pexels.com/photos/5945670/pexels-photo-5945670.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 6,
      firstName: 'John',
      lastName: 'Doe',
      fullName: 'John Doe',
      description: description,
      ships: 'Ships 3 ton',
      rating: 5.0,
      isPesticideFreeFarm: false,
      image:
          'https://images.pexels.com/photos/45852/farmer-smile-man-person-45852.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      backgroundImage:
          'https://images.pexels.com/photos/5945655/pexels-photo-5945655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Farmer(
      id: 7,
      firstName: 'Ada',
      lastName: 'Lovelace',
      fullName: 'Ada Lovelace',
      description: description,
      ships: 'Ships 13 ton',
      rating: 5.0,
      isPesticideFreeFarm: false,
      image:
          'https://images.pexels.com/photos/2519332/pexels-photo-2519332.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      backgroundImage:
          'https://images.pexels.com/photos/3094074/pexels-photo-3094074.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
  ]);

  List<Farmer> get farmers => _farmers.value;

  Future<Farmer> findById({
    @required int farmerId,
  }) async {
    return _farmers.value.firstWhere((element) => element.id == farmerId);
  }
}
