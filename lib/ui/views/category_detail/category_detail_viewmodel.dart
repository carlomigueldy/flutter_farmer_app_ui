import 'package:auto_route/auto_route.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/app/routes.gr.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/models/food_crop.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';
import 'package:stacked_architecture_starter/services/api/food_crop_service.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryDetailViewModel extends FutureViewModel<FoodCrop> {
  final FoodCropService _foodCropService = locator<FoodCropService>();
  final FarmerService _farmerService = locator<FarmerService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final int categoryId;

  CategoryDetailViewModel({
    @required this.categoryId,
  });

  String get heroTag =>
      data != null ? 'category-' + data.id.toString() : 'category-hero-tag';

  List<Farmer> get farmers => _farmerService.farmers;

  @override
  Future<FoodCrop> futureToRun() async {
    return await _foodCropService.findById(categoryId: categoryId);
  }

  navigateToFarmerDetailView({@required int farmerId}) {
    _navigationService.navigateTo(Routes.farmerDetailView(farmerId: farmerId));
  }
}
