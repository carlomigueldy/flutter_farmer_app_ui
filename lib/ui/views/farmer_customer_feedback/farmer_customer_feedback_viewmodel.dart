import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/app/ui/setup_dialog_ui.dart';
import 'package:stacked_architecture_starter/models/farmer.dart';
import 'package:stacked_architecture_starter/services/api/farmer_service.dart';
import 'package:stacked_services/stacked_services.dart';

class FarmerCustomerFeedbackViewModel extends FutureViewModel<Farmer> {
  final FarmerService _farmerService = locator<FarmerService>();
  final DialogService _dialogService = locator<DialogService>();

  FarmerCustomerFeedbackViewModel({
    this.farmerId,
  });

  final int farmerId;

  bool productQualityRated = false;
  bool shippingAndHandlingRated = false;
  bool farmerOverallFeedbackRated = false;

  @override
  Future<Farmer> futureToRun() async {
    return await _farmerService.findById(farmerId: farmerId);
  }

  onSubmitFeedback() async {
    _dialogService.showDialog(
      title: 'Feedback Received',
      description: 'Thank you for submitting your feedback!',
      buttonTitle: 'OK',
      // cancelTitle: 'Close',
    );
  }

  setFarmerOverallFeedbackRated() {
    farmerOverallFeedbackRated = true;
    notifyListeners();
  }

  setShippingAndHandlingRated() {
    shippingAndHandlingRated = true;
    notifyListeners();
  }

  setProductQualityRated() {
    productQualityRated = true;
    notifyListeners();
  }
}
