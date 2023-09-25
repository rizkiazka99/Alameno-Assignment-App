import 'package:alemeno_internship_assignment_app/app/utils/colors.dart';
import 'package:flutter/material.dart';

class DefaultRoundButton extends StatelessWidget {
  final void Function()? onTap;
  final double width;
  final double height;
  final double bottomMargin;
  final double leftMargin;
  final Color? color;
  final IconData? icon;
  final double iconSize;

  const DefaultRoundButton({
    super.key,
    required this.onTap,
    this.width = 45, 
    this.height = 45,
    this.bottomMargin = 0, 
    this.leftMargin = 0,
    this.color = primaryColor, 
    required this.icon,
    this.iconSize = 36
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(
          bottom: bottomMargin,
          left: leftMargin
        ),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4)
            )
          ]
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: iconSize
        ),
      ),
    );
  }
}