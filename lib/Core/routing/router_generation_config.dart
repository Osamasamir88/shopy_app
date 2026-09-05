import 'package:go_router/go_router.dart';
import 'package:shopy_app/Core/routing/app_routes.dart';
import 'package:shopy_app/features/auth/presentation/views/login_view.dart';
import 'package:shopy_app/features/auth/presentation/views/register_view.dart';
import 'package:shopy_app/features/home/presentation/views/home_view.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.loginView,
    routes: [
      GoRoute(
        path: AppRoutes.loginView,
        name: AppRoutes.loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: AppRoutes.registerView,
        name: AppRoutes.registerView,
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.homeView,
        name: AppRoutes.homeView,
        builder: (context, state) => HomeView(),
      ),
      // GoRoute(
      //   path: AppRoutes.splashView,
      //   name: AppRoutes.splashView,
      //   builder: (context, state) => Scaffold(),
      // ),
    //   GoRoute(
    //     path: AppRoutes.bookDetailsView,
    //     name: AppRoutes.bookDetailsView,
    //     builder: (context, state) {
    //       BookModel book = state.extra as BookModel;
    //       return BookDetailsView(book: book);
    //     },
    //   ),
    //   GoRoute(
    //     path: AppRoutes.searchView,
    //     name: AppRoutes.searchView,
    //     builder: (context, state) => SearchView(),
    //   ),
    ],
  );
}
