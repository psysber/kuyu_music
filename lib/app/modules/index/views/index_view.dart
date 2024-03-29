import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kuyu_music/app/global.dart';
import 'package:kuyu_music/app/modules/home/views/home_view.dart';
import 'package:kuyu_music/app/modules/login/login_view.dart';
import 'package:kuyu_music/app/modules/splash/views/splash_view.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => IndexController());
    return Obx(() => Scaffold(
      body: controller.isloadWelcomePage.isTrue
          ? SplashView()
          : Global.isOfflineLogin
          ? HomeView()
          : LoginPage(),
    ));
  }
}