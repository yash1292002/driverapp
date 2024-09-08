// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:driverapp/controller/order_controller.dart';
import 'package:driverapp/custom_widget.dart/custom_button.dart';
import 'package:driverapp/views/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import "dart:io" as io;
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:driverapp/custom_widget.dart/custom_toastmessage.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class InvoiceScreen extends StatefulWidget {
  String? selectedId;
  InvoiceScreen({super.key, required this.selectedId});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  int groupValue = 0;
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  bool _isSigned = false;
  bool _handleOnDrawStart() {
    setState(() {
      _isSigned = true;
    });
    return false;
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  // void _handleSaveButtonPressed() async {
  //   final data =
  //       await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
  //   final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  //   if (_isSigned) {
  //     ui.Image image = await signatureGlobalKey.currentState!.toImage();

  //     var pngByte = await image.toByteData(format: ui.ImageByteFormat.png);
  //     final tempDir = await getTemporaryDirectory();
  //     io.File file =
  //         await io.File('${tempDir.path}/${DateTime.now()}.png').create();
  //     file.writeAsBytesSync(pngByte!.buffer.asInt8List());
  //   }
  //   // await Navigator.of(context).push(
  //   //   MaterialPageRoute(
  //   //     builder: (BuildContext context) {
  //   //       return Scaffold(
  //   //         appBar: AppBar(),
  //   //         body: Center(
  //   //           child: Container(
  //   //             color: Colors.grey[300],
  //   //             child: Image.memory(bytes!.buffer.asUint8List()),
  //   //           ),
  //   //         ),
  //   //       );
  //   //     },
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    AuthController controller =
        Provider.of<AuthController>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    OrderController _controller =
        Provider.of<OrderController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.darkblueColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.darkblueColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * .04, right: width * .04),
              padding: EdgeInsets.only(
                  left: width * .04,
                  right: width * .04,
                  top: width * .06,
                  bottom: width * .06),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * .04),
                  color: AppColors.lightGreyColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No. 8900001",
                          style: urbanistSemiBold.copyWith(
                              color: AppColors.blackColor,
                              fontSize: width * .045),
                        ),
                        Text("2023-01-09, 12:13:08",
                            style: urbanistSemiBold.copyWith(
                                color: AppColors.darkblueColor,
                                fontSize: width * .045)),
                      ],
                    ),
                    const Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("CUSTOMER",
                    //         style: urbanistBold.copyWith(
                    //             color: AppColors.greyColor,
                    //             fontSize: width * .035)),
                    //     Text("Amount Due",
                    //         style: urbanistBold.copyWith(
                    //             color: AppColors.greyColor,
                    //             fontSize: width * .035)),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Farhal",
                    //         style: urbanistMedium.copyWith(
                    //             color: AppColors.blackColor,
                    //             fontSize: width * .04)),
                    //     Text("0.00 SR",
                    //         style: urbanistMedium.copyWith(
                    //             color: AppColors.blackColor,
                    //             fontSize: width * .04)),
                    //   ],
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(top: width * .04),
                    //   height: height * .1,
                    //   width: width,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(width * .03),
                    //       color: AppColors.whiteColor),
                    //   child: ListView.separated(
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return Row(
                    //           children: [
                    //             Radio(
                    //                 fillColor: MaterialStateColor.resolveWith(
                    //                     (states) => AppColors.darkblueColor),
                    //                 focusColor: MaterialStateColor.resolveWith(
                    //                     (states) => AppColors.darkblueColor),
                    //                 value: index,
                    //                 groupValue: groupValue,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     groupValue = index;
                    //                   });
                    //                 }),
                    //             Container(
                    //               margin: EdgeInsets.only(
                    //                   left: width * .02,
                    //                   top: width * .02,
                    //                   right: width * .02),
                    //               decoration: BoxDecoration(
                    //                   color: AppColors.whiteColor,
                    //                   borderRadius:
                    //                       BorderRadius.circular(width * .04)),
                    //               child: Image.asset(
                    //                 cashData[index]['img'],
                    //               ),
                    //             ),
                    //             Text(
                    //               cashData[index]['title'],
                    //               style: urbanistSemiBold.copyWith(
                    //                   color: AppColors.blackColor,
                    //                   fontSize: width * .045),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //       separatorBuilder: (context, index) {
                    //         return Container(
                    //           height: height * .005,
                    //         );
                    //       },
                    //       itemCount: cashData.length),
                    // ),
                   
                   
                    Container(
                        margin: EdgeInsets.only(
                            top: width * .04, bottom: width * .04),
                        height: height * .2,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * .04),
                        ),
                        child: SfSignaturePad(
                          key: signatureGlobalKey,
                          backgroundColor:
                              AppColors.darkblueColor.withOpacity(.09),
                          strokeColor: AppColors.blackColor,
                          onDrawStart: _handleOnDrawStart,
                          minimumStrokeWidth: 1.0,
                          maximumStrokeWidth: 4.0,
                        )),
                    CustomButton(
                      onTap: () async {},
                      btnText: "E-SIGNATURE",
                      btnColor: AppColors.darkblueColor,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(
                    //       top: width * .04, bottom: width * .04),
                    //   child: Center(
                    //     child: Text(
                    //       "Amount Received ",
                    //       style: urbanistMedium.copyWith(
                    //           color: AppColors.blackColor,
                    //           fontSize: width * .045),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(left: width * .04),
                    //   decoration: BoxDecoration(
                    //       color: AppColors.whiteColor,
                    //       borderRadius: BorderRadius.circular(width * .02),
                    //       border: Border.all(
                    //           color: AppColors.greyColor2,
                    //           width: width * .004)),
                    //   child: CustomTextField(
                    //     autoFocus: false,
                    //     onChange: (p0) {
                    //       setState(() {});
                    //     },
                    //     controller: controller.amountController,
                    //     maxLines: 1,
                    //     keyboardType: TextInputType.number,
                    //     hintText: "Amount Paid",
                    //   ),
                    // ),
                   
                   
                    Container(
                      margin:
                          EdgeInsets.only(top: width * .04, bottom: width * .1),
                      child: CustomButton(
                        onTap: _isSigned == true
                            ? () async {
                                final data = await signatureGlobalKey
                                    .currentState!
                                    .toImage(pixelRatio: 3.0);
                                final bytes = await data.toByteData(
                                    format: ui.ImageByteFormat.png);
                                if (_isSigned) {
                                  ui.Image image = await signatureGlobalKey
                                      .currentState!
                                      .toImage();

                                  var pngByte = await image.toByteData(
                                      format: ui.ImageByteFormat.png);
                                  final tempDir = await getTemporaryDirectory();
                                  // io.File file = await io.File(
                                  //         '${tempDir.path}/${DateTime.now()}.png')
                                  //     .create();
                                  _controller.setFile(await io.File(
                                          '${tempDir.path}/${DateTime.now()}.png')
                                      .create());
                                  _controller.file!.writeAsBytesSync(
                                      pngByte!.buffer.asInt8List());
                                  _controller
                                      .orderStatusChange(
                                    widget.selectedId,
                                    5,
                                  )
                                      .then((value) {
                                    if (value != null) {
                                      showDialog<bool>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        width * .1))),
                                            content: StatefulBuilder(
                                                builder: ((context, setState) {
                                              return SizedBox(
                                                height: height * .3,
                                                width: width * .6,
                                                child: Center(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: width * 0.04,
                                                          right: width * .04),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        .01),
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: width *
                                                                        .08),
                                                            child: Text(
                                                              "Your Order Delivered Successfully",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style:
                                                                  urbanistSemiBold
                                                                      .copyWith(
                                                                fontSize:
                                                                    width *
                                                                        .065,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .darkblueColor,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets.only(
                                                                  left: width *
                                                                      .02,
                                                                  right: width *
                                                                      .02,
                                                                  top: width *
                                                                      .05),
                                                              width: width,
                                                              child:
                                                                  CustomButton(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pushAndRemoveUntil(
                                                                            context,
                                                                            PageTransition(
                                                                              duration: const Duration(milliseconds: 300),
                                                                              reverseDuration: const Duration(milliseconds: 300),
                                                                              type: PageTransitionType.rightToLeft,
                                                                              child: const OrderScreen(),
                                                                            ),
                                                                            (route) => false);
                                                                      },
                                                                      btnColor:
                                                                          AppColors
                                                                              .darkblueColor,
                                                                      btnText:
                                                                          "Ok"))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })),
                                          );
                                        },
                                      );
                                    }
                                  });
                                  log(_controller.file!.path.toString());
                                }
                              }
                            : () {
                                CommonToastWidget.toastMsg(
                                    "Please Sign here...");
                              },
                        btnText: "DELIVERED",
                        btnColor: _isSigned == true
                            ? AppColors.greenColor
                            : AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
