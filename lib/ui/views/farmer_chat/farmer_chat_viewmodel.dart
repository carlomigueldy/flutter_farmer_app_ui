import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../services/api/farmer_service.dart';
import '../../../models/farmer.dart';

class FarmerChatViewModel extends FutureViewModel<Farmer> {
  final FarmerService _farmerService = locator<FarmerService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final int farmerId;

  FarmerChatViewModel({
    Key key,
    @required this.farmerId,
  });

  bool hasNewMessage = false;

  List<String> newMessages = [];

  String messageInput = "";

  @override
  Future<Farmer> futureToRun() async {
    return await _farmerService.findById(farmerId: farmerId);
  }

  navigateBack() {
    _navigationService.back();
  }

  newMessage(String value) {
    hasNewMessage = true;

    newMessages.add(value);
    messageInput = "";
    notifyListeners();
  }

  setMessageInput(String value) {
    messageInput = value;
    notifyListeners();
  }
}
