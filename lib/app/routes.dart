import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_architecture_starter/ui/views/category_detail/category_detail_view.dart';
import 'package:stacked_architecture_starter/ui/views/farmer_chat/farmer_chat_view.dart';
import 'package:stacked_architecture_starter/ui/views/farmer_customer_feedback/farmer_customer_feedback_view.dart';
import 'package:stacked_architecture_starter/ui/views/farmer_detail/farmer_detail_view.dart';
import 'package:stacked_architecture_starter/ui/views/getting_started/getting_started_view.dart';

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
      path: '/getting-started',
      page: GettingStartedView,
    ),
    MaterialRoute(
      path: '/home',
      page: HomeView,
    ),
    MaterialRoute(
      path: '/categories/:categoryId',
      page: CategoryDetailView,
    ),
    MaterialRoute(
      path: '/farmers/:farmerId',
      page: FarmerDetailView,
    ),
    MaterialRoute(
      path: '/farmers/:farmerId/chat',
      page: FarmerChatView,
    ),
    MaterialRoute(
      path: '/farmers/:farmerId/customer-feedback',
      page: FarmerCustomerFeedbackView,
    ),
  ],
)
class $Router {}
