import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kuyu_music/app/modules/error_sereen/views/error_sereen_view.dart';

class IndexController extends GetxController {
  var isloadWelcomePage = true.obs;

  @override
  void onInit() {
    super.onInit();
    ErrorPageInit();
  }

  void ErrorPageInit() {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      print(flutterErrorDetails.toString());
      return ErrorSereenView();
    };
  }

  @override
  void onReady() {
    startCountdownTimer();
  }

  @override
  void onClose() {}

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      isloadWelcomePage.value = false;
    });
  }
}
