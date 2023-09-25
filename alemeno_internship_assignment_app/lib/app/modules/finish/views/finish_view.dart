import 'package:alemeno_internship_assignment_app/app/routes/app_pages.dart';
import 'package:alemeno_internship_assignment_app/app/utils/colors.dart';
import 'package:alemeno_internship_assignment_app/app/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/finish_controller.dart';

class FinishView extends GetView<FinishController> {
  const FinishView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'GOOD JOB',
                style: TextStyle(
                  fontFamily: 'Lilita One',
                  fontSize: 48.sp,
                  color: primaryColor
                ),
              ),
              DefaultButton(
                onTap: () {
                  Get.offAllNamed(Routes.INITIAL);
                }, 
                buttonText: 'Start over'
              )
            ],
          ),
        ),
      ),
    );
  }
}
