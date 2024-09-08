// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:driverapp/views/order/pending__order/pending_order_details.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import 'package:driverapp/controller/auth_controller.dart';
import 'package:intl/intl.dart';

import '../../../controller/order_controller.dart';

class PendingOrdersScreen extends StatefulWidget {
  const PendingOrdersScreen({super.key});

  @override
  State<PendingOrdersScreen> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    OrderController _controller =
        Provider.of<OrderController>(context, listen: false);
    AuthController _controllerAuth =
        Provider.of<AuthController>(context, listen: false);

    _controller.getDriverOrderWithStatus("pending").then((value) {
      setState(() {
        isLoading = false;
      });
    });

    // _controllerAuth.refreshToken(context).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    OrderController _controller =
        Provider.of<OrderController>(context, listen: true);
    Future.delayed(const Duration(seconds: 3), () {
      _controller.getDriverOrderWithStatus("pending").then((value) {});
    });

    return Scaffold(
      backgroundColor: AppColors.darkgreyColor,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.darkblueColor))
          : _controller.getPendingOrderInfo!.isEmpty
              ? Center(
                  child: Text("No Pending Order Found",
                      style: urbanistSemiBold.copyWith(
                          fontSize: width * .045, color: AppColors.blackColor)))
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: width * .04),
                          height: height * .75,
                          width: width,
                          child: ListView.separated(
                            shrinkWrap: false,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            itemCount: _controller.getPendingOrderInfo!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _controller
                                      .getOrderInfoes(_controller
                                          .getPendingOrderInfo![index].id)
                                      .then((value) {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          reverseDuration:
                                              const Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child:
                                              const PendingOrderDetailsScreen()),
                                    ).then((value) {
                                      setState(() {});
                                      isLoading = true;

                                      _controller
                                          .getDriverOrderWithStatus("pending")
                                          .then((value) {
                                        setState(() {});
                                        isLoading = false;
                                      });
                                    });
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.greyColor
                                                .withOpacity(.5),
                                            blurRadius:
                                                8.0, // soften the shadow
                                            spreadRadius:
                                                1.0, //extend the shadow
                                            offset: const Offset(
                                                1.0, // Move to right 10  horizontally
                                                1))
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "No .${_controller.getPendingOrderInfo![index].orderNumber.toString()}",
                                                style: urbanistMedium.copyWith(
                                                    color: AppColors.blackColor,
                                                    fontSize: width * .044)),
                                            Text(
                                                DateFormat('dd MMM yyyy')
                                                    .format(_controller
                                                        .getPendingOrderInfo![
                                                            index]
                                                        .createdAt!)
                                                    .toString(),
                                                style: urbanistMedium.copyWith(
                                                    color:
                                                        AppColors.darkblueColor,
                                                    fontSize: width * .044)),
                                          ]),
                                      const Divider(),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("CUSTOMER",
                                                style:
                                                    urbanistSemiBold.copyWith(
                                                        color:
                                                            AppColors.greyColor,
                                                        fontSize:
                                                            width * .035)),
                                            Text("ORDER PRICE",
                                                style:
                                                    urbanistSemiBold.copyWith(
                                                        color:
                                                            AppColors.greyColor,
                                                        fontSize: width * .035))
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _controller
                                                  .getPendingOrderInfo![index]
                                                  .customerId!
                                                  .name
                                                  .toString(),
                                              style: urbanistMedium.copyWith(
                                                  color: AppColors.blackColor,
                                                  fontSize: width * .045),
                                            ),
                                            Text(
                                                "SAR ${_controller.getPendingOrderInfo![index].finalTotal.toStringAsFixed(2)}",
                                                style: urbanistMedium.copyWith(
                                                    color: AppColors.blackColor,
                                                    fontSize: width * .045)),
                                          ]),
                                      const Divider(),
                                      Text("ADDRESS",
                                          style: urbanistBold.copyWith(
                                              color: AppColors.greyColor,
                                              fontSize: width * .035)),
                                      Text(
                                        _controller.getPendingOrderInfo![index]
                                            .orderAddressId!.location
                                            .toString(),
                                        style: urbanistMedium.copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: width * .04),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: width * .02),
                                            height: height * .03,
                                            width: width * .3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * .02),
                                                color: _controller
                                                            .getPendingOrderInfo![
                                                                index]
                                                            .driverStatus ==
                                                        "0"
                                                    ? AppColors.blueColor
                                                    : _controller
                                                                .getPendingOrderInfo![
                                                                    index]
                                                                .driverStatus ==
                                                            "1"
                                                        ? AppColors
                                                            .darkblueColor
                                                        : _controller
                                                                    .getPendingOrderInfo![
                                                                        index]
                                                                    .driverStatus ==
                                                                "2"
                                                            ? AppColors
                                                                .orangeColor
                                                            : _controller
                                                                        .getPendingOrderInfo![
                                                                            index]
                                                                        .driverStatus ==
                                                                    "3"
                                                                ? AppColors
                                                                    .lightPinkColor
                                                                : _controller
                                                                            .getPendingOrderInfo![
                                                                                index]
                                                                            .driverStatus ==
                                                                        "4"
                                                                    ? AppColors
                                                                        .darkpurpal
                                                                    : AppColors
                                                                        .greenColor),
                                            child: Center(
                                                child: Text(
                                              _controller
                                                          .getPendingOrderInfo![
                                                              index]
                                                          .driverStatus ==
                                                      "0"
                                                  ? "Trip Requested"
                                                  : _controller
                                                              .getPendingOrderInfo![
                                                                  index]
                                                              .driverStatus ==
                                                          "1"
                                                      ? "Trip Accepted"
                                                      : _controller
                                                                  .getPendingOrderInfo![
                                                                      index]
                                                                  .driverStatus ==
                                                              "2"
                                                          ? "Trip Start"
                                                          : _controller
                                                                      .getPendingOrderInfo![
                                                                          index]
                                                                      .driverStatus ==
                                                                  "3"
                                                              ? "At Customer"
                                                              : _controller
                                                                          .getPendingOrderInfo![
                                                                              index]
                                                                          .driverStatus ==
                                                                      "4"
                                                                  ? "Delevering Item"
                                                                  : "Deliverd",
                                              style: urbanistBold.copyWith(
                                                  color: AppColors.whiteColor,
                                                  fontSize: width * .035),
                                            )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height * .02);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
