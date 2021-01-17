import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';

class FarmerCustomerFeedbackViewModel extends FutureViewModel<Farmer> {
  final FarmerService _farmerService = locator<FarmerService>();

  FarmerCustomerFeedbackViewModel({
    this.farmerId,
  });

  final int farmerId;

  @override
  Future<Farmer> futureToRun() async {
    return await _farmerService.findById(farmerId: farmerId);
  }
}
