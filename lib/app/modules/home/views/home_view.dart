import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kuyu_music/app/component/Img.dart';
import 'package:kuyu_music/app/component/audio_manage.dart';
import 'package:kuyu_music/app/component/notifiers/play_button_notifier.dart';
import 'package:kuyu_music/app/component/notifiers/progress_notifier.dart';
import 'package:kuyu_music/app/component/notifiers/repeat_button_notifier.dart';
import 'package:kuyu_music/app/component/scroll_text.dart';

import '../controllers/home_controller.dart';
import 'local_music.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    NavigationDestinationLabelBehavior labelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow;
    var itemWidth = (MediaQuery.of(context).size.width - 30) / 2;
    var itemHeight = 60.w;
    var childAspectRatio = itemWidth / itemHeight;
    return DefaultTabController(
        length: controller.titleList.length ,
      child:   Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).cardColor,
            leading: Icon(Icons.home,color: Theme.of(context).iconTheme.color,),
            title: TabBar(
                isScrollable: true, //是否可滚动
                indicatorColor: Colors.transparent, //指示器颜色
                automaticIndicatorColorAdjustment: true, //是否自动调整indicatorColor
                indicatorPadding: const EdgeInsets.all(0), //底部指示器的Padding
                indicatorSize: TabBarIndicatorSize.label, //指示器大小
                labelColor: Theme.of(context).primaryColor, //选中label颜色
                labelStyle: const TextStyle(
                  //选中label的Style
                  fontSize: 15,
                ),
                unselectedLabelColor: Colors.grey, //未选中label颜色
                unselectedLabelStyle: const TextStyle(
                  //未选中label的Style
                    fontSize: 12),
                tabs: controller.titleList),
            actions: [
              Icon(Icons.more_vert,color: Theme.of(context).iconTheme.color,)
            ],
          ),
          body:TabBarView(children:List.generate(controller.titleList.length, (index) =>  Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Container(
              child: ElevatedButton(
                onPressed: (){
                  Local_music().load_music();
                }, child: Text("load"),
              ),
            )
          )))
          ,
          bottomNavigationBar: Container(
              color: Theme.of(context).cardColor,
              height: 90.h,
              child: Container(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AudioProcessBar(),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50.w,
                          height: 50.w,
                          child: ClipOval(
                            child: Img(
                                'https://jrocknews.com/wp-content/uploads/2017/11/egoist-greatest-hits-2011-2017-alter-ego-artwork-regular-edition.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: ScrollText(
                              child: "AAAAAAAAAAAAAAAAA",
                            )),
                        PreviousSongButton(),
                        PlayButton(),
                        NextSongButton()
                      ],
                    ),
                  ],
                ),
              ))),
    );

  }

  Widget songListWidget(context, itemHeight, text) {
    return Container(
        width: 90.w,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            ClipOval(
              child: Img(
                'https://jrocknews.com/wp-content/uploads/2017/11/egoist-greatest-hits-2011-2017-alter-ego-artwork-regular-edition.jpg',
                height: 60.w,
              ),
            ),
            Text(
              "ssssssssssssssssssssss",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ));
  }
}

class AudioProcessBar extends StatelessWidget {
  const AudioProcessBar({super.key});

  @override
  Widget build(BuildContext context) {
    final audioManage = AudioManage.instance;
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: AudioManage.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          barHeight: 3.0,
          thumbRadius: 5,
          thumbGlowRadius: 20,
          timeLabelTextStyle: TextStyle(
              fontSize: 10.sp,color: Theme.of(context).iconTheme.color),
          baseBarColor: Color(0xFF120338),
          bufferedBarColor: Color(0xFFD3ADF7),
          thumbColor: Color(0xFF722ED1),
          progressBarColor: Color(0xFFB37FEB),
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: audioManage.seek,
          timeLabelLocation: TimeLabelLocation.sides,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  final audioManage = AudioManage.getInstance();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder<bool>(
      valueListenable: AudioManage.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          onPressed: (isFirst) ? null : () => audioManage?.previous(),
          icon: Icon(Icons.skip_previous_outlined),
        );
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  final audioManage = AudioManage.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder<bool>(
      valueListenable: AudioManage.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          onPressed: (isLast) ? null : audioManage.next,
          icon: Icon(Icons.skip_next_outlined),
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  final audioManage = AudioManage.instance;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: AudioManage.playButtonNotifier,
      builder: (BuildContext context, value, Widget? child) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 32.0.sp,
              height: 32.0.sp,
              child: const CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: AudioManage.instance.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: const Icon(Icons.pause),
              onPressed: AudioManage.instance.pause,
            );
          default:
            return IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: AudioManage.instance.play,
            );
        }
      },
    );
  }
}

class RepeatButton extends StatelessWidget {
  RepeatButton({Key? key}) : super(key: key);
  final audioManage = AudioManage.instance;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RepeatState>(
      valueListenable: AudioManage.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.repeatPlaylist:
            icon = Icon(Icons.repeat);
            break;
          case RepeatState.off:
            icon = Icon(Icons.shuffle);
            break;
          case RepeatState.repeatSong:
            icon = Icon(Icons.repeat_one);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: audioManage.repeat,
        );
      },
    );
  }
}


