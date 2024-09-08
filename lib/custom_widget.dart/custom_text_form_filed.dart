import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final String? Function(String?)? onChange;
  final String? Function(String?)? onComplete;
  final Widget? suffixIcon;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final Color hintColor;
  final FocusNode? focusNode;
  final bool autoFocus;

  const CustomTextField(
      {Key? key,
      this.obscureText = false,
      required this.controller,
      this.labelText,
      this.keyboardType,
      this.prefixIcon,
      this.validator,
      this.onChange,
      this.onComplete,
      this.suffixIcon,
      this.hintText = '',
      this.inputFormatters,
      this.maxLines,
      this.hintColor = AppColors.darkgreyColor,
      this.focusNode,
      required this.autoFocus,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      autofocus: autoFocus,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChange,
      onSaved: onComplete,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.left,
      onFieldSubmitted: onFieldSubmitted,
      style: urbanistSemiBold.copyWith(
        fontSize: width * .045,
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: width * .00),
        // filled: true,
        // fillColor: AppColors.lightGreyColor,
        labelText: labelText,
        labelStyle: urbanistregular.copyWith(
          fontSize: width * .035,
          color: AppColors.darkgreyColor,
        ),

        hintText: hintText,

        hintStyle: urbanistLight.copyWith(
          fontSize: width * .038,
          color: hintColor,
        ),
        helperStyle: urbanistregular.copyWith(
          fontSize: width * .035,
          color: AppColors.darkgreyColor,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

//====================================================== custommTextFiled   2 ==================================
class CustomTextField1 extends StatelessWidget {
  final bool? obscureText;
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final String? Function(String?)? onChange;
  final String? Function(String?)? onComplete;
  final Widget? suffixIcon;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final Color hintColor;
  final FocusNode? focusNode;

  const CustomTextField1(
      {Key? key,
      this.obscureText = false,
      required this.controller,
      this.labelText,
      this.keyboardType,
      this.prefixIcon,
      this.validator,
      this.onChange,
      this.onComplete,
      this.suffixIcon,
      this.hintText = '',
      this.inputFormatters,
      this.maxLines,
      this.hintColor = AppColors.darkgreyColor,
      this.focusNode,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      autofocus: true,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChange,
      onSaved: onComplete,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.left,
      onFieldSubmitted: onFieldSubmitted,
      style: urbanistSemiBold.copyWith(
        fontSize: width * .045,
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: width * .028),
        // filled: true,
        // fillColor: AppColors.lightGreyColor,
        labelText: labelText,
        labelStyle: urbanistregular.copyWith(
          fontSize: width * .035,
          color: AppColors.darkgreyColor,
        ),

        hintText: hintText,

        hintStyle: urbanistLight.copyWith(
          fontSize: width * .038,
          color: hintColor,
        ),
        helperStyle: urbanistregular.copyWith(
          fontSize: width * .035,
          color: AppColors.darkgreyColor,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
