import 'package:stacked/stacked.dart';

import '../../../models/user.dart' show User;
import '../../../app/locator.dart' show locator;
import '../../../services/api/authentication_service.dart'
    show AuthenticationService;

class HomeViewModel extends ReactiveViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  User get user => _authService.user;

  List<Map<String, dynamic>> categories = [
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
  ];

  List<Map<String, dynamic>> monthlyBestSellers = [
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
  ];

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  Future<void> logout() async {
    await _authService.logout();
  }
}
