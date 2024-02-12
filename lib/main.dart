import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'package:kuyu_music/app/modules/index/views/index_view.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app/component/audio_handler.dart';
import 'app/component/audio_manage.dart';
import 'app/modules/index/bindings/index_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main()  async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print("初始化服务");
  await AudioHandlerService().initAudioService();

  requestManageExternalStoragePermission();
  requestMediaLibraryPermission();
  await Get.putAsync(() async => await AudioManage.getInstance());
  print("所有服务启动");

}

void requestMediaLibraryPermission() async {
  final PermissionStatus status = await Permission.mediaLibrary.request();
  if (status.isGranted) {
    // 权限已授予
    print('媒体库权限已授予');
  } else {
    // 权限被拒绝
    print('媒体库权限被拒绝');
  }
}

// 请求管理外部存储权限
void requestManageExternalStoragePermission() async {
  final PermissionStatus status = await Permission.manageExternalStorage.request();
  if (status.isGranted) {
    // 权限已授予
    print('管理外部存储权限已授予');
  } else {
    // 权限被拒绝
    print('管理外部存储权限被拒绝');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.rightToLeftWithFade,
          title: 'KuYu music',
          home: IndexView(),
          initialBinding: IndexBinding(),
          debugShowCheckedModeBanner: false,
          enableLog: true,
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          darkTheme:ThemeData.light(useMaterial3: false),
          themeMode: ThemeMode.light,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          unknownRoute: AppPages.NOTFOUND,
          builder: EasyLoading.init(),
          // translations: TranslationService(),
          // locale: TranslationService.locale,
          // fallbackLocale: TranslationService.fallbackLocale,
          // darkTheme: dartTheme,
          // theme: lightTheme,
        );
      },
    );
  }
}
