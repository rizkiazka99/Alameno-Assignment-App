import 'package:alemeno_internship_assignment_app/app/utils/colors.dart';
import 'package:alemeno_internship_assignment_app/app/utils/constants.dart';
import 'package:alemeno_internship_assignment_app/app/widgets/bottom_sheets.dart';
import 'package:alemeno_internship_assignment_app/app/widgets/default_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/meal_controller.dart';

class MealView extends GetView<MealController> {
  const MealView({Key? key}) : super(key: key);

  PreferredSizeWidget appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      leading: DefaultRoundButton(
        onTap: () {
          Get.back();
        },
        leftMargin: 6.w,
        bottomMargin: 8.h,
        icon: Icons.arrow_back_rounded,
      )
    );
  }

  Widget smilodonImage() {
    return Container(
      margin: EdgeInsets.only(left: 70.w),
      child: Image.asset(smilodon)
    );
  }

  Widget cutlery() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(spoon),
        Stack(
          children: [
            Obx(() => controller.selectedImage == null
                ? Image.asset(corners)
                : const SizedBox.shrink()),
            SizedBox(
              width: 221,
              height: 208,
              child: Center(
                child: Obx(() => Container(
                  width: 170.w,
                  height: 170.h,
                  decoration: const BoxDecoration(
                    color: plateColor, 
                    shape: BoxShape.circle
                  ),
                  child: controller.selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            controller.selectedImage!,
                            fit: BoxFit.fill,
                          )
                        ) : const SizedBox.shrink(),
                      )
                ),
              ),
            )
          ],
        ),
        Image.asset(fork)
      ]
    );
  }

  Widget questions() {
    return Obx(() => Text(
      controller.selectedImage == null
          ? 'Click your meal'
          : 'Will you eat this?',
      style: TextStyle(fontSize: 24.sp, color: textColor),
    ));
  }

  Widget actions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => DefaultRoundButton(
          onTap: () {
            if (controller.selectedImage == null) {
              triggerModalBottomSheet(context, controller);
            } else {
              controller.uploadImage();
            }
          },
          height: 64.h,
          width: 82.w,
          icon: controller.selectedImage == null
              ? Icons.camera_alt_sharp
              : Icons.check_rounded,
          iconSize: 50.sp,
        )),
        Obx(() => controller.selectedImage != null
            ? DefaultRoundButton(
                onTap: () {
                  triggerModalBottomSheet(context, controller);
                },
                height: 64.h,
                width: 82.w,
                color: Colors.red,
                icon: Icons.clear,
                iconSize: 50.sp,
              ) : const SizedBox.shrink()
        )
      ],
    );
  }

  Widget feedSmilodon(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cutlery(),
            SizedBox(height: 16.h),
            questions(),
            SizedBox(height: 16.h),
            actions(context),
            SizedBox(height: 40.h)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                smilodonImage(),
                Expanded(
                  child: feedSmilodon(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
