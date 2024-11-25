import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/book_details_view.dart';
import 'package:booklyapp/features/home/presentation/views/home_view.dart';
import 'package:booklyapp/features/search/views/search_view.dart';
import 'package:booklyapp/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String initialPath = "/";
  static const String homeViewPath = "/homeView";
  static String bookDetailsViewPath = "/bookDetailsView";

  static String searchViewPath = "/searchView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialPath,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewPath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsViewPath,
        builder: (context, state) {
          
          return  BookDetailsView(bookModel: state.extra as BookModel,);
        },
      ),
      GoRoute(
        path: searchViewPath,
        builder: (context, state) =>  SearchView(),
      ),
    ],
  );
}
