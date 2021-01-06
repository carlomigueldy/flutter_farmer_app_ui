import 'package:auto_route/auto_route.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/models/food_crop.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';
import 'package:stacked_architecture_starter/services/api/food_crop_service.dart';

class CategoryDetailViewModel extends FutureViewModel<FoodCrop> {
  final FoodCropService _foodCropService = locator<FoodCropService>();
  final FarmerService _farmerService = locator<FarmerService>();

  final int categoryId;

  CategoryDetailViewModel({
    @required this.categoryId,
  });

  String get heroTag => data != null ? 'category-' + data.title : 'hero-tag';

  List<Farmer> get farmers => _farmerService.farmers;

  @override
  Future<FoodCrop> futureToRun() async {
    return await _foodCropService.findById(categoryId: categoryId);
  }
}
