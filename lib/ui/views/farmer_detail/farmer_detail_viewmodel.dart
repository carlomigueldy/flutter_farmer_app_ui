import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/app/routes.gr.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';
import 'package:stacked_services/stacked_services.dart';

class FarmerDetailViewModel extends FutureViewModel<Farmer> {
  final FarmerService _farmerService = locator<FarmerService>();
  final NavigationService _navigationService = locator<NavigationService>();

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

  navigateToChatViewWithFarmer({@required int farmerId}) {
    _navigationService.navigateTo(Routes.farmerChatView(farmerId: farmerId));
  }
}
