import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:flutter/material.dart';
 

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final double? elevation;
  final String? btnText;
  final Color? btnColor;
  final Color? btnTextColor;
  // final Color? btnBorderColor;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    this.width,
    this.height = 50.0,
    this.radius,
    this.elevation = 0.0,
    this.fontSize = 16.0,
    this.btnText = 'Button Text',
    this.btnColor = AppColors.darkblueColor,
    this.btnTextColor = Colors.white,
    // this.btnBorderColor = AppColors.primaryColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? MediaQuery.of(context).size.width, height!), backgroundColor: btnColor,
        elevation: elevation,
        // shadowColor: AppColors.blackColor.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5.0),
          // side: BorderSide(
          //   color: btnBorderColor!,
          //   width: 1.0,
          // ),
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: Text(
          btnText!,
          style: urbanistSemiBold.copyWith(
            color: btnTextColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
