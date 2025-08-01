import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';

class LoadingProgressWidget extends StatelessWidget {
  final controller;
  const LoadingProgressWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return (controller)
        ? Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: .5),
            ),
            child: Center(
              child: SpinKitFoldingCube(
                size: 80,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? Color(0xffffffff)
                          : const Color(0xff386641),
                    ),
                  );
                },
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
