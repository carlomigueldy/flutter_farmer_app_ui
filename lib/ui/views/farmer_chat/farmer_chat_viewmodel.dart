import 'dart:io';

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

  List<Map<String, dynamic>> messages = [];

  String messageInput = "";

  @override
  Future<Farmer> futureToRun() async {
    return await _farmerService.findById(farmerId: farmerId);
  }

  navigateBack() {
    _navigationService.back();
  }

  newMessage(String value) async {
    hasNewMessage = true;

    messages.add({
      'text': value,
      'isFarmer': false,
    });

    if (value == 'What do you have for sale?') {
      Future.delayed(const Duration(seconds: 3));
      messages.add({
        'text': 'I have potatoes available for sale',
        'isFarmer': true,
      });
    }

    if (value == 'How much for per kg of potatoes?') {
      Future.delayed(const Duration(seconds: 3));
      messages.add({
        'text': '50 per kg',
        'isFarmer': true,
      });
    }

    if (value == 'Ok I think I will order from you') {
      Future.delayed(const Duration(seconds: 3));
      messages.add({
        'text': 'Ok',
        'isFarmer': true,
      });
    }

    messageInput = "";
    notifyListeners();
  }

  setMessageInput(String value) {
    messageInput = value;
    notifyListeners();
  }
}
