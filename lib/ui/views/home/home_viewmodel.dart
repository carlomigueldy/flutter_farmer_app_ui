import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/app/routes.gr.dart';
import 'package:stacked_architecture_starter/services/api/category_service.dart';
import 'package:stacked_architecture_starter/services/api/monthly_best_sellers_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/user.dart' show User;
import '../../../app/locator.dart' show locator;
import '../../../services/api/authentication_service.dart'
    show AuthenticationService;

class HomeViewModel extends ReactiveViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CategoryService _categoryService = locator<CategoryService>();
  final MonthlyBestSellersService _monthlyBestSellersService =
      locator<MonthlyBestSellersService>();

  User get user => _authService.user;

  List<Map<String, dynamic>> get categories => _categoryService.categories;
  List<Map<String, dynamic>> get monthlyBestSellers =>
      _monthlyBestSellersService.monthlyBestSellers;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  Future<void> logout() async {
    await _authService.logout();
  }

  navigateToCategoryDetailView({
    String categoryId,
    Map<String, dynamic> category,
  }) async {
    _navigationService.navigateTo(
      Routes.categoryDetailView(categoryId: categoryId),
    );
  }
}
