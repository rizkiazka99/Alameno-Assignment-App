import 'package:alemeno_internship_assignment_app/app/modules/meal/controllers/meal_controller.dart';
import 'package:alemeno_internship_assignment_app/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

triggerModalBottomSheet(BuildContext context, MealController controller) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkResponse(
                containedInkWell: false,
                radius: 80,
                onTap: () async {
                  Get.back();
                  await controller.getImageFromCamera();
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 48,
                        color: primaryColor,
                      ),
                      Text('Camera')
                    ],
                  ),
                ),
              ),
              InkResponse(
                containedInkWell: false,
                radius: 80,
                onTap: () async {
                  Get.back();
                  await controller.getImageFromGallery();
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.image,
                        size: 48,
                        color: primaryColor,
                      ),
                      Text('Gallery')
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }