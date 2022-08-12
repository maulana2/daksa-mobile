import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/views/transfer_view.dart';
import '../modules/transfer_confirm/bindings/transfer_confirm_binding.dart';
import '../modules/transfer_confirm/views/transfer_confirm_view.dart';
import '../modules/transfer_succes/bindings/transfer_succes_binding.dart';
import '../modules/transfer_succes/views/transfer_succes_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER_CONFIRM,
      page: () => TransferConfirmView(),
      binding: TransferConfirmBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER_SUCCES,
      page: () => TransferSuccesView(),
      binding: TransferSuccesBinding(),
    ),
  ];
}
