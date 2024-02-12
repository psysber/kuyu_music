import 'package:get/get.dart';
import 'package:kuyu_music/app/modules/player/bindings/player_binding.dart';

import '../modules/error_sereen/bindings/error_sereen_binding.dart';
import '../modules/error_sereen/views/error_sereen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/index/bindings/index_binding.dart';
import '../modules/index/views/index_view.dart';
import '../modules/notfound/bindings/notfound_binding.dart';
import '../modules/notfound/views/notfound_view.dart';
import '../modules/play_list/bindings/play_list_binding.dart';
import '../modules/play_list/views/play_list_view.dart';
import '../modules/player/views/player_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final NOTFOUND = GetPage(
    name: Routes.NOTFOUND,
    page: () => NotfoundView(),
  );
  static final routes = [
    GetPage(
      name: _Paths.NOTFOUND,
      page: () => const NotfoundView(),
      binding: NotfoundBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INDEX,
      page: () => IndexView(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      children: [
        GetPage(
          name: _Paths.SPLASH,
          page: () => const SplashView(),
          binding: SplashBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PLAYER,
      page: () => const PlayerView(),
      binding: PlayerBinding(),
    ),
    GetPage(
      name: _Paths.PLAY_LIST,
      page: () => const PlayListView(),
      binding: PlayListBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.ERROR_SEREEN,
      page: () => const ErrorSereenView(),
      binding: ErrorSereenBinding(),
    ),
  ];
}
