import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class MonthlyBestSellersService with ReactiveServiceMixin {
  RxValue<List<Map<String, dynamic>>> _monthlyBestSellers =
      RxValue<List<Map<String, dynamic>>>(initial: [
    {
      'full_name': 'Elston Gullan',
      'ships': 'Ships 10 ton',
      'rating': 5.0,
      'image':
          'https://images.pexels.com/photos/2804327/pexels-photo-2804327.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    },
    {
      'full_name': 'Maria Paula',
      'ships': 'Ships 9 ton',
      'rating': 5.0,
      'image':
          'https://images.pexels.com/photos/2321837/pexels-photo-2321837.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'full_name': 'John Doe',
      'ships': 'Ships 3 ton',
      'rating': 5.0,
      'image':
          'https://images.pexels.com/photos/45852/farmer-smile-man-person-45852.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'full_name': 'Ada Lovelace',
      'ships': 'Ships 13 ton',
      'rating': 5.0,
      'image':
          'https://images.pexels.com/photos/2519332/pexels-photo-2519332.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
  ]);

  List<Map<String, dynamic>> get monthlyBestSellers =>
      _monthlyBestSellers.value;

  Future<Map<String, dynamic>> findById({
    @required String monthlyBestSellerId,
  }) async {
    return _monthlyBestSellers.value
        .firstWhere((element) => element['full_name'] == monthlyBestSellers);
  }
}
