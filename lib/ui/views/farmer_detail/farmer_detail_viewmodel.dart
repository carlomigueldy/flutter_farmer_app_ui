import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';

class FarmerDetailViewModel extends FutureViewModel<Farmer> {
  final FarmerService _farmerService = locator<FarmerService>();

  final int farmerId;

  FarmerDetailViewModel({
    Key key,
    @required this.farmerId,
  });

  String get heroTag =>
      data != null ? 'farmer-' + data.id.toString() : 'farmer-hero-tag';

  @override
  Future<Farmer> futureToRun() async {
    return await _farmerService.findById(farmerId: farmerId);
  }
}
