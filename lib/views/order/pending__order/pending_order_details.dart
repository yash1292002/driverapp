// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:driverapp/constant/app_const.dart';
import 'package:driverapp/custom_widget.dart/custom_button.dart';
import 'package:driverapp/views/order/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_img.dart';
import 'package:driverapp/constant/app_textStyle.dart';

import '../../../controller/order_controller.dart';

class PendingOrderDetailsScreen extends StatefulWidget {
  const PendingOrderDetailsScreen({super.key});

  @override
  State<PendingOrderDetailsScreen> createState() =>
      _PendingOrderDetailsScreenState();
}

class _PendingOrderDetailsScreenState extends State<PendingOrderDetailsScreen> {
  String? btnText = "STARTING MY TRIP";
  Color? selectedColor = AppColors.blackColor;
  @override
  void initState() {
    super.initState();
    OrderController _controller =
        Provider.of<OrderController>(context, listen: false);

    if (_controller.orderDataInfo != null) {
      if (_controller.orderDataInfo!.driverStatus == "0") {
        btnText = "Trip Requested";
        selectedColor = AppColors.blueColor;
      } else if (_controller.orderDataInfo!.driverStatus == "1") {
        btnText = "Trip Accepted";
        selectedColor = AppColors.blackColor;
      } else if (_controller.orderDataInfo!.driverStatus == "2") {
        btnText = "Trip Start";
        selectedColor = AppColors.orangeColor;
      } else if (_controller.orderDataInfo!.driverStatus == "3") {
        btnText = "I am at customer location";
        selectedColor = AppColors.lightPinkColor;
      } else if (_controller.orderDataInfo!.driverStatus == "4") {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return InvoiceScreen(selectedId: _controller.orderDataInfo!.id);
          }));
        });
      } else {
        btnText = "Deleverd";
        selectedColor = AppColors.greenColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    OrderController _controller =
        Provider.of<OrderController>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.darkblueColor,
          elevation: 0),
      backgroundColor: AppColors.darkblueColor,
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.only(left: width * .04, right: width * .04),
            padding: EdgeInsets.only(
                left: width * .04,
                right: width * .04,
                top: width * .06,
                bottom: width * .06),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * .04),
                color: AppColors.whiteColor),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "No. ${_controller.orderDataInfo!.orderNumber.toString()}",
                              style: urbanistSemiBold.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: width * .04)),
                          Text(_controller.orderDataInfo!.createdAt!.toString(),
                              style: urbanistSemiBold.copyWith(
                                  color: AppColors.darkblueColor,
                                  fontSize: width * .04)),
                        ]),
                    const Divider(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CUSTOMER",
                              style: urbanistBold.copyWith(
                                  color: AppColors.greyColor,
                                  fontSize: width * .035)),
                          Text(
                              _controller.orderDataInfo!.customerId!.name
                                  .toString(),
                              style: urbanistMedium.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: width * .04)),
                        ]),
                    const SizedBox(height: 14),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address Notes",
                              style: urbanistBold.copyWith(
                                  color: AppColors.greyColor,
                                  fontSize: width * .035)),
                          Text(
                              _controller.orderDataInfo!.orderAddressId!.notes
                                  .toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: urbanistMedium.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: width * .04)),
                        ]),
                    SizedBox(height: height * 0.03),
                    Container(
                        height: height * .25,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * .04),
                            color: AppColors.darkblueColor.withOpacity(.06)),
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: width * .04,
                                        top: width * .04,
                                        right: width * .04),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(width * .04)),
                                    height: height * .09,
                                    width: width * .2,
                                    child: _controller
                                                .orderDataInfo!
                                                .items![index]
                                                .productVariantImage !=
                                            null
                                        ? Image.network(_controller
                                            .orderDataInfo!
                                            .items![index]
                                            .productVariantImage
                                            .toString())
                                        : Image.asset(AppImages.yaaFoodsLogo)),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            _controller
                                                .orderDataInfo!
                                                .items![index]
                                                .productVariantName
                                                .toString(),
                                            style: urbanistregular.copyWith(
                                                color: AppColors.blackColor,
                                                fontSize: width * .04)),
                                        Text(
                                            _controller.orderDataInfo!
                                                .items![index].price
                                                .toString(),
                                            style: urbanistregular.copyWith(
                                                color: AppColors.greyColor,
                                                fontSize: width * .038)),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: width * .02),
                                          height: height * .03,
                                          width: width * .3,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * .02),
                                              color: AppColors.darkblueColor),
                                          child: Center(
                                              child: Text(
                                                  "Variant : ${_controller.orderDataInfo!.items![index].qty.toString()}",
                                                  style:
                                                      urbanistMedium.copyWith(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize:
                                                              width * .035))),
                                        )
                                      ]),
                                ),
                              ]);
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height * .02);
                            },
                            itemCount:
                                _controller.orderDataInfo!.items!.length)),
                    // SizedBox(height: height * .01),
                    // Text("CUSTOMER NO",
                    //     style: urbanistBold.copyWith(
                    //         color: AppColors.greyColor,
                    //         fontSize: width * .035)),
                    Container(
                        margin: EdgeInsets.only(
                            top: width * .04, bottom: width * .04),
                        height: height * .1,
                        width: width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  OrderController.openMap(
                                      _controller.orderDataInfo!.orderAddressId!
                                          .latitude,
                                      _controller.orderDataInfo!.orderAddressId!
                                          .longitude);
                                },
                                child: Container(
                                  height: height * .2,
                                  width: width * .24,
                                  decoration: BoxDecoration(
                                      color: AppColors.blueColor,
                                      borderRadius:
                                          BorderRadius.circular(width * .04)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(contactData[0]['img'],
                                            width: width * .06),
                                        Text(contactData[0]['title'],
                                            textAlign: TextAlign.center,
                                            style: urbanistregular.copyWith(
                                                fontSize: width * .04,
                                                color: AppColors.whiteColor))
                                      ]),
                                ),
                              ),
                              SizedBox(width: width * .04),
                            _controller.orderDataInfo!.receivableMobileNo!.isEmpty?  Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      FlutterPhoneDirectCaller.callNumber(
                                          "+966${_controller.data!.data!.customerId!.mobileNo}");
                                    },
                                    child: Container(
                                      height: height * .2,
                                      width: width * .24,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightperrotColor,
                                          borderRadius: BorderRadius.circular(
                                              width * .04)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(contactData[1]['img'],
                                                width: width * .06),
                                            Text(contactData[1]['title'],
                                                textAlign: TextAlign.center,
                                                style: urbanistregular.copyWith(
                                                    fontSize: width * .04,
                                                    color:
                                                        AppColors.whiteColor))
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: width * .04),
                                  GestureDetector(
                                    onTap: () {
                                      _controller.launchUserWhatsAppUri(
                                          "+966${_controller.data!.data!.customerId!.mobileNo}");
                                    },
                                    child: Container(
                                      height: height * .2,
                                      width: width * .24,
                                      decoration: BoxDecoration(
                                          color: AppColors.greenColor,
                                          borderRadius: BorderRadius.circular(
                                              width * .04)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(contactData[2]['img'],
                                                width: width * .06),
                                            Text(contactData[2]['title'],
                                                textAlign: TextAlign.center,
                                                style: urbanistregular.copyWith(
                                                    fontSize: width * .04,
                                                    color:
                                                        AppColors.whiteColor))
                                          ]),
                                    ),
                                  ),
                                ],
                              )
                             
                              :Row(
                                children: [
                                  // SizedBox(width: width * .04),
                                  GestureDetector(
                                    onTap: () {
                                      FlutterPhoneDirectCaller.callNumber(
                                          "+966${_controller.orderDataInfo!.receivableMobileNo}");
                                    },
                                    child: Container(
                                      height: height * .2,
                                      width: width * .24,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightperrotColor,
                                          borderRadius: BorderRadius.circular(
                                              width * .04)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(contactData[3]['img'],
                                                width: width * .06),
                                            Text(contactData[3]['title'],
                                                textAlign: TextAlign.center,
                                                style: urbanistregular.copyWith(
                                                    fontSize: width * .04,
                                                    color:
                                                        AppColors.whiteColor))
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: width * .04),
                                  GestureDetector(
                                    onTap: () {
                                      _controller.launchReceivableWhatsAppUri(
                                          "+966${_controller.orderDataInfo!.receivableMobileNo}");
                                    },
                                    child: Container(
                                      height: height * .2,
                                      width: width * .24,
                                      decoration: BoxDecoration(
                                          color: AppColors.greenColor,
                                          borderRadius: BorderRadius.circular(
                                              width * .04)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(contactData[4]['img'],
                                                width: width * .06),
                                            Text(contactData[4]['title'],
                                                textAlign: TextAlign.center,
                                                style: urbanistregular.copyWith(
                                                    fontSize: width * .04,
                                                    color:
                                                        AppColors.whiteColor))
                                          ]),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                        // InkWell(
                        //     onTap: () {
                        //       index == 1
                        //           ? FlutterPhoneDirectCaller.callNumber(
                        //               "+966${_controller.data!.data!.customerId!.mobileNo}")
                        //           : index == 2
                        //               ? _controller.launchUserWhatsAppUri(
                        //                   "+966${_controller.data!.data!.customerId!.mobileNo}")
                        //               : index == 0
                        //                   ? OrderController.openMap(
                        //                       _controller
                        //                           .orderDataInfo!
                        //                           .orderAddressId!
                        //                           .latitude,
                        //                       _controller
                        //                           .orderDataInfo!
                        //                           .orderAddressId!
                        //                           .longitude)
                        //                   : index == 3
                        //                       ? FlutterPhoneDirectCaller
                        //                           .callNumber(
                        //                               "+966${_controller.orderDataInfo!.receivableMobileNo}")
                        //                       : _controller
                        //                           .launchReceivableWhatsAppUri(
                        //                               "+966${_controller.orderDataInfo!.receivableMobileNo}");
                        //     },
                        //     child: Container(
                        //       height: height * .02,
                        //       width: width * .24,
                        //       decoration: BoxDecoration(
                        //           color: index == 0
                        //               ? AppColors.blueColor
                        //               : index == 1
                        //                   ? AppColors.lightperrotColor
                        //                   : index == 2
                        //                       ? AppColors.greenColor
                        //                       : index == 3
                        //                           ? AppColors
                        //                               .lightperrotColor
                        //                           : AppColors.greenColor,
                        //           borderRadius:
                        //               BorderRadius.circular(width * .04)),
                        //       child: Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.center,
                        //           children: [
                        //             Image.asset(contactData[index]['img'],
                        //                 width: width * .06),
                        //             Text(contactData[index]['title'],
                        //                 textAlign: TextAlign.center,
                        //                 style: urbanistregular.copyWith(
                        //                     fontSize: width * .04,
                        //                     color: AppColors.whiteColor))
                        //           ]),
                        //     ));

                        // },
                        // separatorBuilder: (context, index) {
                        //   return Container(width: width * .04);
                        // },
                        // itemCount: contactData.length),
                        ),
                    // Text("RECEIVABLE NO",
                    //     style: urbanistBold.copyWith(
                    //         color: AppColors.greyColor,
                    //         fontSize: width * .035)),
                    // Container(
                    //     margin: EdgeInsets.only(
                    //         top: width * .04, bottom: width * .04),
                    //     height: height * .08,
                    //     width: width,
                    //     child: ListView.separated(
                    //         scrollDirection: Axis.horizontal,
                    //         shrinkWrap: true,
                    //         itemBuilder: (context, index) {
                    //           return InkWell(
                    //             onTap: () {
                    //               index == 0
                    //                   ? FlutterPhoneDirectCaller.callNumber(
                    //                       _controller
                    //                           .orderDataInfo!.receivableNo
                    //                           .toString())
                    //                   : index == 2
                    //                       ? _controller
                    //                           .launchReceivableWhatsAppUri()
                    //                       : Navigator.push(
                    //                           context,
                    //                           PageTransition(
                    //                               duration: const Duration(
                    //                                   milliseconds: 300),
                    //                               reverseDuration:
                    //                                   const Duration(
                    //                                       milliseconds: 300),
                    //                               type: PageTransitionType
                    //                                   .rightToLeft,
                    //                               child: PendingOrderLocation(
                    //                                   location: _controller
                    //                                       .orderDataInfo!
                    //                                       .orderAddressId!
                    //                                       .location,
                    //                                   latitude: _controller
                    //                                       .orderDataInfo!
                    //                                       .orderAddressId!
                    //                                       .latitude,
                    //                                   longitude: _controller
                    //                                       .orderDataInfo!
                    //                                       .orderAddressId!
                    //                                       .longitude)));
                    //               ;
                    //             },
                    //             child: Container(
                    //               height: height * .02,
                    //               width: width * .24,
                    //               decoration: BoxDecoration(
                    //                   color: index == 0
                    //                       ? AppColors.lightperrotColor
                    //                       : index == 1
                    //                           ? AppColors.blueColor
                    //                           : AppColors.greenColor,
                    //                   borderRadius:
                    //                       BorderRadius.circular(width * .04)),
                    //               child: Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     Image.asset(contactData[index]['img'],
                    //                         width: width * .06),
                    //                     Text(contactData[index]['title'],
                    //                         style: urbanistregular.copyWith(
                    //                             fontSize: width * .04,
                    //                             color: AppColors.whiteColor))
                    //                   ]),
                    //             ),
                    //           );
                    //         },
                    //         separatorBuilder: (context, index) {
                    //           return Container(width: width * .04);
                    //         },
                    //         itemCount: contactData.length)),
                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("AMOUNT:",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  "SR ${_controller.orderDataInfo!.subTotal!.toStringAsFixed(2)}",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("VAT CHARGES:",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  "SR ${_controller.vatPrice!.toStringAsFixed(2)}",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("DELIVERY CHARGES:",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  "SR ${_controller.orderDataInfo!.deliveryFees!.toStringAsFixed(2)}",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),

                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("PROMO DISCOUNT:",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  _controller.orderDataInfo!.discount!.value !=
                                          null
                                      ? "-SR ${_controller.orderDataInfo!.discount!.value.toStringAsFixed(2)}"
                                      : "-SR 00.00",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("WALLET AMOUNT:",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  "-SR ${_controller.orderDataInfo!.walletAmount!.toStringAsFixed(2)}",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("USER PAID :",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  _controller.orderDataInfo!.discount!.value !=
                                          null
                                      ? "SR ${_controller.orderDataInfo!.userPaidAmount.toStringAsFixed(2)}"
                                      : "SR 00.00",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: height * .02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("TOTAL:",
                                  style: urbanistregular.copyWith(
                                      // color: AppColors.blackColor,
                                      fontSize: width * .04)),
                              Text(
                                  "SR ${_controller.orderDataInfo!.finalTotal!.toStringAsFixed(2)}",
                                  style: urbanistMedium.copyWith(
                                      color: AppColors.darkblueColor,
                                      fontSize: width * .045))
                            ])),
                    // Container(
                    //   height: height * .24,
                    //   width: width,
                    //   child: ListView.separated(
                    //       itemBuilder: (context, index) {
                    //         return Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text(amountData[index]['title'],
                    //                   style: urbanistMedium.copyWith(
                    //                       color: AppColors.greyColor,
                    //                       fontSize: width * .04)),
                    //               Text(amountData[index]['rs'],
                    //                   style: urbanistMedium.copyWith(
                    //                       color: AppColors.blackColor,
                    //                       fontSize: width * .045))
                    //             ],
                    //           ),
                    //         );
                    //       },
                    //       separatorBuilder: (context, index) {
                    //         return Container(
                    //           height: width * .02,
                    //         );
                    //       },
                    //       itemCount: amountData.length),
                    // ),
                    Container(
                        margin: EdgeInsets.only(top: width * .02),
                        child: CustomButton(
                            radius: width * .03,
                            onTap: _controller.orderDataInfo!.driverStatus ==
                                    "5"
                                ? () {}
                                : () {
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
                                                                .whiteColor),
                                                        child: Column(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: width *
                                                                          .08),
                                                                  child: Text(
                                                                      "Are You sure to want change status?",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: urbanistSemiBold.copyWith(
                                                                          fontSize: width *
                                                                              .065,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              AppColors.darkblueColor))),
                                                              Row(children: [
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: width *
                                                                            .02,
                                                                        right: width *
                                                                            .02,
                                                                        top: width *
                                                                            .05),
                                                                    width:
                                                                        width *
                                                                            .23,
                                                                    child: CustomButton(
                                                                        onTap: () {
                                                                          Navigator.pop(
                                                                              context,
                                                                              false);
                                                                        },
                                                                        btnColor: AppColors.darkblueColor,
                                                                        btnText: "No")),
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        right: width *
                                                                            .02,
                                                                        top: width *
                                                                            .05),
                                                                    width:
                                                                        width *
                                                                            .23,
                                                                    child: CustomButton(
                                                                        onTap: () {
                                                                          Navigator.pop(
                                                                              context,
                                                                              true);
                                                                        },
                                                                        btnColor: AppColors.darkblueColor,
                                                                        btnText: "Yes"))
                                                              ])
                                                            ])),
                                                  )));
                                            })),
                                          );
                                        }).then((value) {
                                      if (value == true) {
                                        if (btnText == "Trip Requested" &&
                                            _controller.wrongStatus == false) {
                                          _controller
                                              .orderStatusChange1(
                                                  _controller.orderDataInfo!.id,
                                                  1)
                                              .then((value) {
                                            setState(() {
                                              btnText = "Trip Accepted";
                                              selectedColor =
                                                  AppColors.darkblueColor;
                                            });
                                          });
                                        } else if (btnText == "Trip Accepted" &&
                                            _controller.wrongStatus == false) {
                                          _controller
                                              .orderStatusChange1(
                                                  _controller.orderDataInfo!.id,
                                                  2)
                                              .then((value) {
                                            setState(() {
                                              btnText = "Trip Start";
                                              selectedColor =
                                                  AppColors.orangeColor;
                                            });
                                          });
                                        } else if (btnText == "Trip Start" &&
                                            _controller.wrongStatus == false) {
                                          _controller
                                              .orderStatusChange1(
                                                  _controller.orderDataInfo!.id,
                                                  3)
                                              .then((value) {
                                            setState(() {
                                              btnText =
                                                  "I am at customer location";
                                              selectedColor =
                                                  AppColors.orangeColor;
                                            });
                                          });
                                        } else if (btnText ==
                                                "I am at customer location" &&
                                            _controller.wrongStatus == false) {
                                          _controller
                                              .orderStatusChange1(
                                                  _controller.orderDataInfo!.id,
                                                  4)
                                              .then((value) {
                                            setState(() {
                                              btnText = "DELIVERING THE ITEM";
                                              selectedColor =
                                                  AppColors.lightPinkColor;
                                            });
                                          });
                                        } else if (btnText ==
                                                "DELIVERING THE ITEM" &&
                                            _controller.wrongStatus == false) {
                                          // _controller
                                          //     .orderStatusChange1(
                                          //   _controller.orderDataInfo!.id,
                                          //   5,
                                          // )
                                          // .then((value) {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                reverseDuration: const Duration(
                                                    milliseconds: 300),
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: InvoiceScreen(
                                                    selectedId: _controller
                                                        .orderDataInfo!.id)),
                                          );
                                          // });
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "This order is cancelled so you can't change the status",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                              textColor: AppColors.redColor,
                                              fontSize: 15);
                                          //
                                          print("here is status" +
                                              _controller.wrongStatus
                                                  .toString());
                                        }
                                      }
                                    });
                                  },
                            btnText: btnText,
                            btnColor: selectedColor))
                  ]),
            ),
          )),
        )
      ]),
    );
  }
}
