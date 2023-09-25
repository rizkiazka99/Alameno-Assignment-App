import 'package:alemeno_internship_assignment_app/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  

  const DefaultButton({
    super.key,
    required this.onTap,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 229.w,
        padding: EdgeInsets.symmetric(
          vertical: 8.h, 
          horizontal: 8.w
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4)
            )
          ]
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.sp, 
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}