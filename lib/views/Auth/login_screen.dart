// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:driverapp/Services/sharedprefrence.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:driverapp/custom_widget.dart/custom_text_form_filed.dart';
import 'package:driverapp/custom_widget.dart/custom_toastmessage.dart';
import 'package:driverapp/views/Auth/otp_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    AuthController _controller =
        Provider.of<AuthController>(context, listen: false);
    _controller.reset();
    var userNumber = SharedPrefService().getUserNumber();
    var userPassword = SharedPrefService().getUserPassword();

    if (userNumber != null && userPassword != null) {
      _controller.numberController.text = userNumber;
      _controller.passwordVerifyController.text = userPassword;
    } else {
      _controller.numberController.clear();
      _controller.passwordVerifyController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AuthController _controller =
        Provider.of<AuthController>(context, listen: true);

    return Scaffold(
      backgroundColor: AppColors.darkblueColor,
      body: Column(children: [
        Container(
            margin: EdgeInsets.only(top: width * .15),
            child: Center(
                child: Image.asset(AppImages.yaaFoodsLogo,
                    height: height * .12, width: width * .5))),
        Container(
          margin: EdgeInsets.only(top: width * .04),
          height: height * .34,
          width: width * .9,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(width * .04)),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(
                    left: width * .04, top: width * .025, right: width * .04),
                child: Text("Login with your phone number",
                    textAlign: TextAlign.left,
                    style: urbanistSemiBold.copyWith(fontSize: width * .08))),
            Container(
                margin: EdgeInsets.only(
                    left: width * .04,
                    right: width * .04,
                    top: width * .04,
                    bottom: width * .04),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * .02),
                    border: Border.all(
                        color: AppColors.lightGreyColor, width: width * .004)),
                child: CustomTextField1(
                    // focusNode: _focusNode,
                    prefixIcon: Container(
                        alignment: Alignment.center,
                        width: width * .32,
                        height: height * .02,
                        margin: EdgeInsets.only(left: width * .01),
                        child: Row(children: [
                          Image.asset(AppImages.flagImgLogo,
                              width: width * .15),
                          const VerticalDivider(
                              color: AppColors.lightGreyColor, thickness: 1),
                          Text("\t+966",
                              style: urbanistSemiBold.copyWith(
                                  fontSize: width * .04,
                                  color: AppColors.blackColor))
                        ])),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    onChange: (p0) {
                      setState(() {});
                      return null;
                    },
                    controller: _controller.numberController,
                    hintText: "5862585258",
                    maxLines: 1,
                    keyboardType: TextInputType.number)),
            // Container(
            //   margin: EdgeInsets.only(
            //       left: width * .04, right: width * .04, top: width * .04),
            //   child: CustomButton(
            // onTap: (_controller.numberController.text.isNotEmpty &&
            //         _controller.numberController.text.length == 9)
            //         ? () {
            //             _controller.checkDriverMobileNo().then((value) {
            //               if (value != null) {
            //                 _controller.driverLogin().then((value) {
            //                   if (value != null) {
            //                     Navigator.push(
            //                       context,
            //                       PageTransition(
            //                         duration:
            //                             const Duration(milliseconds: 300),
            //                         reverseDuration:
            //                             const Duration(milliseconds: 300),
            //                         type: PageTransitionType.rightToLeft,
            //                         child: const OtpVerifyScreen(),
            //                       ),
            //                     );
            //                   }
            //                 });
            //               }
            //             });
            //           }
            //         : () {},
            //     btnText: "Next",
            //     btnColor: (_controller.numberController.text.isNotEmpty &&
            //             _controller.numberController.text.length == 9)
            //         ? AppColors.darkblueColor
            //         : AppColors.darkblueColor.withOpacity(.2),
            //   ),
            // )
            GestureDetector(
              onTap: (_controller.numberController.text.isNotEmpty &&
                      _controller.numberController.text.length == 10)
                  ? () {
                      setState(() {
                        isLoading = true;
                      });
                      _controller.checkDriverMobileNo().then((value) {
                        if (value != null) {
                          setState(() {
                            isLoading = false;
                          });
                          int? isRegistered = SharedPrefService().getLogin();

                          isRegistered == 0
                              ? CommonToastWidget.toastMsg(
                                  "Your Number is not Registered contact to admin")
                              : Navigator.push(
                                  context,
                                  PageTransition(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      reverseDuration:
                                          const Duration(milliseconds: 300),
                                      type: PageTransitionType.rightToLeft,
                                      child: const OtpVerifyScreen()));
                          setState(() {
                            isLoading = false;
                          });
                        }
                      });
                    }
                  : () {},
              child: Container(
                  height: 50.0,
                  width: width * .8,
                  margin: EdgeInsets.only(
                      left: width * .04, right: width * .04, top: width * .04),
                  decoration: BoxDecoration(
                      color: AppColors.darkblueColor,
                      borderRadius: BorderRadius.circular(width * .04)),
                  child: Center(
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.whiteColor))
                        : Text("Next",
                            textAlign: TextAlign.center,
                            style: urbanistSemiBold.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: width * .045)),
                  )),
            )
          ]),
        ),
      ]),
    );
  }
}
