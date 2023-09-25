import 'package:get/get.dart';

import '../modules/finish/bindings/finish_binding.dart';
import '../modules/finish/views/finish_view.dart';
import '../modules/initial/bindings/initial_binding.dart';
import '../modules/initial/views/initial_view.dart';
import '../modules/meal/bindings/meal_binding.dart';
import '../modules/meal/views/meal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.MEAL,
      page: () => const MealView(),
      binding: MealBinding(),
    ),
    GetPage(
      name: _Paths.FINISH,
      page: () => const FinishView(),
      binding: FinishBinding(),
    ),
  ];
}
