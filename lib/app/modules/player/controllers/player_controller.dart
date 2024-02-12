import 'package:audio_service/audio_service.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:kuyu_music/app/component/audio_manage.dart';

class PlayerController extends GetxController with GetTickerProviderStateMixin{


  late AnimationController recordController;
  late AnimationController pointController;
  final audioManage = AudioManage.instance;

  @override
  onInit() {
    recordController =
        AnimationController(duration: Duration(seconds: 20), vsync: this);
    pointController = AnimationController(
      duration: Duration(milliseconds: 500),
      lowerBound: -.02,
      upperBound: .03,
      vsync: this,
    );

  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
