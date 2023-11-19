import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dormitory_room_widget.dart';
import '../../../widgets/dormitory_service_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Dormitory Service',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          DormitoryServiceWidget(controller: controller),
          DormitoryRoomsWidget(controller: controller),
        ],
      ),
    );
  }
}
