import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Get.offAllNamed(Routes.LOGIN);
        },
        child: Icon(Icons.logout_rounded),
      ),
      appBar: AppBar(
        title: Text('Presence'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.ADD_EMPLOYEE),
            icon: Icon(Icons.person_add),
          ),
        ],
      ),
      body: Center(
        child: Text('HomeView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
