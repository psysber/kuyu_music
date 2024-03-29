import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuyu_music/app/component/audio_manage.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
//数据

  final List<Widget> titleList = [];
  final List<String> contentList = ['首页','流行音乐','古典音乐','摇滚音乐'];



  @override
  onInit() {
    super.onInit();
    for (var i = 0; i < contentList.length; i++) {
      titleList.add(Text(contentList[i]));

    }
  }

  @override
  void onReady() {
    AudioManage.instance.addPlaylists([
      MediaItem(
          id: "31649312",
          title: "EGOIST",
          album: "EGOSIT",
          extras: {
            'url': "https://music.163.com/song/media/outer/url?id=31649312",
            "singer": "EGOIST",
            "image":
                'https://jrocknews.com/wp-content/uploads/2017/11/egoist-greatest-hits-2011-2017-alter-ego-artwork-regular-edition.jpg'
          },
          artUri: Uri.tryParse(
              "https://jrocknews.com/wp-content/uploads/2017/11/egoist-greatest-hits-2011-2017-alter-ego-artwork-regular-edition.jpg"))
    ]);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
