import 'package:get/get.dart';
import 'package:kuyu_music/app/modules/player/controllers/player_controller.dart';



class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(
      () => PlayerController(),
    );
  }
}
