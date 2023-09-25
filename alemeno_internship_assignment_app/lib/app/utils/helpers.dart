import 'package:alemeno_internship_assignment_app/app/utils/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

customSnackbar(String title, String message) {
  Get.snackbar(
    title, 
    message,
    backgroundColor: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(20),
    borderRadius: 20,
    boxShadows: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3)
      )
    ]
  );
}

Widget uploadProgress(UploadTask? uploadTask) => StreamBuilder<TaskSnapshot>(
  stream: uploadTask!.snapshotEvents,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final data = snapshot.data!;
      double progress = data.bytesTransferred / data.totalBytes;
        
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        title: Text(
          'Uploading Image...',
          style: TextStyle(fontSize: 16.sp),
        ),
        content: SizedBox(
          height: 50.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white,
                color: primaryColor,
              ),
              Center(
                child: Text(
                  '${(100 * progress).roundToDouble()}%',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: textColor
                  ),
                ),
              )
            ],
          ),
        )
      );
    } else {
      return const SizedBox.shrink();
    }
  },
);

Widget uploadComplete() => AlertDialog(
  title: Text(
    'Uploading Image...',
    style: TextStyle(fontSize: 16.sp),
  ),
  content: Text(
    'Upload Complete!',
    style: TextStyle(
      fontSize: 14.sp,
      color: textColor
    ),
    textAlign: TextAlign.center,
  ),
);