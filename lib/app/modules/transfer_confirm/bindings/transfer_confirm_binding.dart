import 'package:get/get.dart';

import '../controllers/transfer_confirm_controller.dart';

class TransferConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferConfirmController>(
      () => TransferConfirmController(),
    );
  }
}
