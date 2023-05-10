import 'package:get/get.dart';
import 'package:member_apps/app/modules/auth/binding.dart';
import 'package:member_apps/app/modules/dashboard/binding.dart';
import 'package:member_apps/app/modules/dashboard/view.dart';
import 'package:member_apps/app/modules/auth/login/view.dart';
import 'package:member_apps/app/modules/dashboard/view0.dart';
import 'package:member_apps/app/modules/onboard/view.dart';
import 'package:member_apps/app/modules/point/binding.dart';
import 'package:member_apps/app/modules/point/tarik_point/view.dart';
import 'package:member_apps/app/modules/point/view.dart';
import 'package:member_apps/app/modules/profile/binding.dart';
import 'package:member_apps/app/modules/profile/view.dart';
import 'package:member_apps/app/modules/auth/register/view.dart';
import 'package:member_apps/app/modules/splash/view.dart';
import 'package:member_apps/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplasScreen(),
      transition: Transition.size
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoardPage(),
      transition: Transition.zoom
    ),
    GetPage(
      name: Routes.dashboard0,
      page: () => const DashboardPage0(),
      binding: DashboardBinding(),
      transition: Transition.rightToLeftWithFade
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.rightToLeftWithFade
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: Routes.point,
      page: () => const PointPage(),
      binding: PointBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.tarikpoint,
      page: () => const TarikPointPage(),
      transition: Transition.size,
    ),
  ];
}
