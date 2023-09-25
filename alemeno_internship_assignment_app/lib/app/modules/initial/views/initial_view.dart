import 'package:alemeno_internship_assignment_app/app/routes/app_pages.dart';
import 'package:alemeno_internship_assignment_app/app/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 100.h),
            child: DefaultButton(
              onTap: () {
                Get.toNamed(Routes.MEAL);
              }, 
              buttonText: 'Share your meal'
            )
          ),
        ),
      ),
    );
  }
}
