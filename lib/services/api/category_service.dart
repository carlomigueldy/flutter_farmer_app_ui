import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class CategoryService with ReactiveServiceMixin {
  RxValue<List<Map<String, dynamic>>> _categories =
      RxValue<List<Map<String, dynamic>>>(initial: [
    {
      'title': 'Milk',
      'farmers': '27 Farmers',
      'image':
          'https://images.pexels.com/photos/248412/pexels-photo-248412.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    },
    {
      'title': 'Cauliflower',
      'farmers': '14 Farmers',
      'image':
          'https://images.pexels.com/photos/6316515/pexels-photo-6316515.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    },
    {
      'title': 'Carrot',
      'farmers': '10 Farmers',
      'image':
          'https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    },
    {
      'title': 'Potato',
      'farmers': '10 Farmers',
      'image':
          'https://images.pexels.com/photos/2286776/pexels-photo-2286776.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    },
    {
      'title': 'Papayas',
      'farmers': '10 Farmers',
      'image':
          'https://images.pexels.com/photos/286948/pexels-photo-286948.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    },
    {
      'title': 'Banana',
      'farmers': '10 Farmers',
      'image':
          'https://images.pexels.com/photos/2238309/pexels-photo-2238309.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    },
  ]);

  List<Map<String, dynamic>> get categories => _categories.value;

  Future<Map<String, dynamic>> findById({@required String categoryId}) async {
    var data = _categories.value
        .firstWhere((element) => element['title'] == categoryId);

    return data;
  }
}
