import 'package:get/get.dart';

import '../controllers/transfer_succes_controller.dart';

class TransferSuccesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferSuccesController>(
      () => TransferSuccesController(),
    );
  }
}
