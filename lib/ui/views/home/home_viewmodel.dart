import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/routes.gr.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/models/food_crop.dart';
import 'package:stacked_architecture_starter/services/api/food_crop_service.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/user.dart' show User;
import '../../../app/locator.dart' show locator;
import '../../../services/api/authentication_service.dart'
    show AuthenticationService;

class HomeViewModel extends ReactiveViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FoodCropService _categoryService = locator<FoodCropService>();
  final FarmerService _farmerService = locator<FarmerService>();

  User get user => _authService.user;

  List<FoodCrop> get categories => _categoryService.foodCrops;
  List<Farmer> get farmers => _farmerService.farmers;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  Future<void> logout() async {
    await _authService.logout();
  }

  navigateToCategoryDetailView({
    int categoryId,
  }) async {
    _navigationService
        .navigateTo(Routes.categoryDetailView(categoryId: categoryId));
  }

  navigateToFarmerDetailView({
    int farmerId,
  }) async {
    _navigationService.navigateTo(Routes.farmerDetailView(farmerId: farmerId));
  }
}
