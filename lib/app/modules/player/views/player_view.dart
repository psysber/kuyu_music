import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  const PlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlayerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
