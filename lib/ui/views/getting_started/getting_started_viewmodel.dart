import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/locator.dart';
import 'package:stacked_architecture_starter/app/routes.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class GettingStartedViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToHomeView() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
