import 'package:get/get.dart';
import 'package:member_apps/app/modules/auth/binding.dart';
import 'package:member_apps/app/modules/change_pass/binding.dart';
import 'package:member_apps/app/modules/change_pass/view.dart';
import 'package:member_apps/app/modules/change_pin/binding.dart';
import 'package:member_apps/app/modules/change_pin/view.dart';
import 'package:member_apps/app/modules/dashboard/binding.dart';
import 'package:member_apps/app/modules/dashboard/view.dart';
import 'package:member_apps/app/modules/auth/login/view.dart';
import 'package:member_apps/app/modules/dashboard/view0.dart';
import 'package:member_apps/app/modules/event/binding.dart';
import 'package:member_apps/app/modules/event/view.dart';
import 'package:member_apps/app/modules/gratis_ongkir/binding.dart';
import 'package:member_apps/app/modules/gratis_ongkir/view.dart';
import 'package:member_apps/app/modules/input_pin/binding.dart';
import 'package:member_apps/app/modules/input_pin/view.dart';
import 'package:member_apps/app/modules/onboard/view.dart';
import 'package:member_apps/app/modules/point/binding.dart';
import 'package:member_apps/app/modules/point/tarik_point/binding.dart';
import 'package:member_apps/app/modules/point/tarik_point/view.dart';
import 'package:member_apps/app/modules/point/view.dart';
import 'package:member_apps/app/modules/profile/binding.dart';
import 'package:member_apps/app/modules/profile/view.dart';
import 'package:member_apps/app/modules/auth/register/view.dart';
import 'package:member_apps/app/modules/promo/binding.dart';
import 'package:member_apps/app/modules/promo/view.dart';
import 'package:member_apps/app/modules/splash/view.dart';
import 'package:member_apps/app/modules/tracking/binding.dart';
import 'package:member_apps/app/modules/tracking/view.dart';
import 'package:member_apps/app/modules/voucher/binding.dart';
import 'package:member_apps/app/modules/voucher/view.dart';
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
      transition: Transition.rightToLeft,
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
      binding: TarikPointBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.event,
      page: () => const EventPage(),
      binding: EventBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.promo,
      page: () => const PromoPage(),
      binding: PromoBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.gratisongkir,
      page: () => const GratisOngkirPage(),
      binding: GratisOngkirBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.changepin,
      page: () => const ChangePinPage(),
      binding: ChangePinBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.changepass,
      page: () => const ChangePassPage(),
      binding: ChangePassBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.inputpin,
      page: () => const InputPinPage(),
      binding: InputPinBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.voucher,
      page: () => const VoucherPage(),
      binding: VoucherBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.tracking,
      page: () => const TrackingPage(),
      binding: TrackingBinding(),
      transition: Transition.size,
    ),
  ];
}
