// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:driverapp/views/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:driverapp/custom_widget.dart/custom_text_form_filed.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthController _controller =
        Provider.of<AuthController>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.darkblueColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: width * .15),
            child: Center(
              child: Image.asset(
                AppImages.yaaFoodsLogo,
                height: height * .12,
                width: width * .5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: width * .04),
            height: height * .34,
            width: width * .9,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(width * .04)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * .04, top: width * .025, right: width * .04),
                  child: Text(
                    "Enter your Password to continue",
                    textAlign: TextAlign.left,
                    style: urbanistSemiBold.copyWith(fontSize: width * .08),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: width * .04),
                  margin: EdgeInsets.only(
                      left: width * .04,
                      right: width * .04,
                      top: width * .04,
                      bottom: width * .04),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * .02),
                      border: Border.all(
                          color: AppColors.lightGreyColor,
                          width: width * .004)),
                  child: CustomTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    obscureText: true,
                    autoFocus: true,
                    onChange: (p0) {
                      setState(() {});
                      return null;
                    },
                    controller: _controller.passwordVerifyController,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(
                //       left: width * .04, right: width * .04, top: width * .04),
                //   child: CustomButton(
                //     onTap: (controller.passwordVerifyController.text.isNotEmpty)
                //         ? () {
                //             Navigator.pushAndRemoveUntil(
                //                 context,
                //                 PageTransition(
                //                   duration: const Duration(milliseconds: 300),
                //                   reverseDuration:
                //                       const Duration(milliseconds: 300),
                //                   type: PageTransitionType.rightToLeft,
                //                   child: const HomeScreen(),
                //                 ),
                //                 (route) => false);
                //           }
                //         : () {},
                //     btnText: "VERIFY NOW",
                //     btnColor:
                //         (controller.passwordVerifyController.text.isNotEmpty)
                //             ? AppColors.darkblueColor
                //             : AppColors.darkblueColor.withOpacity(.2),
                //   ),
                // )
                GestureDetector(
                  onTap: (_controller.passwordVerifyController.text.isNotEmpty)
                      ? () {
                          setState(() {
                            isLoading = true;
                          });
                          _controller.driverLogin().then((value) {
                            if (value != null) {
                              setState(() {
                                isLoading = false;
                              });
                              _controller.setConsent1(true);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      reverseDuration:
                                          const Duration(milliseconds: 300),
                                      type: PageTransitionType.rightToLeft,
                                      child: const OrderScreen()),
                                  (route) => false);
                            } else {
                              log("value " + value.toString());
                              if (value == null) {
                                setState(() {
                                  isLoading = false;
                                });
                                log("jdfshgfdf");
                                FocusManager.instance.primaryFocus?.unfocus();
                                Fluttertoast.showToast(
                                    msg: "Please Enter Correct password");
                              }
                            }
                          });
                        }
                      : () {},
                  child: Container(
                    height: 50.0,
                    width: width * .8,
                    margin: EdgeInsets.only(
                        left: width * .04,
                        right: width * .04,
                        top: width * .04),
                    decoration: BoxDecoration(
                        color: AppColors.darkblueColor,
                        borderRadius: BorderRadius.circular(width * .04)),
                    child: Center(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            ))
                          : Text(
                              "Next",
                              textAlign: TextAlign.center,
                              style: urbanistSemiBold.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: width * .045,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
