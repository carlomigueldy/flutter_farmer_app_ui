import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_architecture_starter/ui/views/category_detail/category_detail_view.dart';

// Views
import '../ui/views/home/home_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/splash/splash_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      path: '/',
      page: SplashView,
      initial: true,
    ),
    MaterialRoute(
      path: '/main',
      page: MainView,
    ),
    MaterialRoute(
      path: '/home',
      page: HomeView,
    ),
    MaterialRoute(
      path: '/categories/:categoryId',
      page: CategoryDetailView,
    ),
  ],
)
class $Router {}
