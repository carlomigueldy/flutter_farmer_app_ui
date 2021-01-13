// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/alert_service.dart';
import 'utils/device.dart';
import '../services/api/authentication_service.dart';
import 'exceptions/handler.dart';
import '../services/api/farmer_service.dart';
import '../services/api/food_crop_service.dart';
import '../services/theme_service.dart';
import '../services/third_party_services_module.dart';
import '../services/api/user_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<AlertService>(() => AlertService());
  gh.lazySingleton<AppDeviceInfo>(() => AppDeviceInfo());
  gh.lazySingleton<AuthenticationService>(() => AuthenticationService());
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<ExceptionHandler>(() => ExceptionHandler());
  gh.lazySingleton<FarmerService>(() => FarmerService());
  gh.lazySingleton<FoodCropService>(() => FoodCropService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  gh.lazySingleton<ThemeService>(() => ThemeService());
  gh.lazySingleton<UserService>(() => UserService());
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
