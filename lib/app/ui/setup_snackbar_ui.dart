import 'package:flutter/material.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackBarType {
  BASIC,
  SUCCESS,
  ERROR,
  INFO,
}

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.BASIC,
    config:SnackbarConfig(
      backgroundColor: Colors.black,
      textColor: Colors.white,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.SUCCESS,
    config:SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.INFO,
    config:SnackbarConfig(
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.ERROR,
    config:SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
    ),
  );
}
