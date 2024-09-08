// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:driverapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'package:intl/intl.dart';
import 'package:driverapp/constant/app_colors.dart';
import 'package:driverapp/constant/app_textStyle.dart';
import '../../../controller/order_controller.dart';

class DeliverdOrdersScreen extends StatefulWidget {
  const DeliverdOrdersScreen({super.key});

  @override
  State<DeliverdOrdersScreen> createState() => _DeliverdOrdersScreenState();
}

class _DeliverdOrdersScreenState extends State<DeliverdOrdersScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    OrderController _controller =
        Provider.of<OrderController>(context, listen: false);
    _controller.getDriverOrderWithStatus("delivered").then((value) {
      setState(() {
        isLoading = false;
      });
    });
    AuthController _controllerAuth =
        Provider.of<AuthController>(context, listen: false);
    _controllerAuth.refreshToken(context).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    OrderController _controller =
        Provider.of<OrderController>(context, listen: true);
    Future.delayed(const Duration(seconds: 3), () {
      _controller.getDriverOrderWithStatus("delivered").then((value) {});
    });
    return Scaffold(
      backgroundColor: AppColors.darkgreyColor,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.darkblueColor,
            ))
          : _controller.getDeliverdOrderInfo!.isEmpty
              ? Center(
                  child: Text("No Deliverd Order Found",
                      style: urbanistSemiBold.copyWith(
                          fontSize: width * .045, color: AppColors.blackColor)),
                )
              : Column(
                  children: [
                    // SizedBox(
                    //   height: height * .02,
                    // ),
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
                              itemBuilder: (context, index) {
                                return Container(
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
                                                "No .${_controller.getDeliverdOrderInfo![index].orderNumber.toString()}",
                                                style: urbanistMedium.copyWith(
                                                    color: AppColors.blackColor,
                                                    fontSize: width * .045)),
                                            Text(
                                                DateFormat('dd MMM yyyy')
                                                    .format(_controller
                                                        .getDeliverdOrderInfo![
                                                            index]
                                                        .createdAt!)
                                                    .toString(),
                                                style: urbanistMedium.copyWith(
                                                    color:
                                                        AppColors.darkblueColor,
                                                    fontSize: width * .045)),
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
                                                    .getDeliverdOrderInfo![
                                                        index]
                                                    .customerId!
                                                    .name
                                                    .toString(),
                                                style: urbanistMedium.copyWith(
                                                    color: AppColors.blackColor,
                                                    fontSize: width * .045)),
                                            Text(
                                                "SAR ${_controller.getDeliverdOrderInfo![index].finalTotal.toStringAsFixed(2)}",
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
                                          _controller
                                              .getDeliverdOrderInfo![index]
                                              .orderAddressId!
                                              .location
                                              .toString(),
                                          style: urbanistMedium.copyWith(
                                              color: AppColors.blackColor,
                                              fontSize: width * .04)),
                                   
                                   
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: height * .02,
                                );
                              },
                              itemCount:
                                  _controller.getDeliverdOrderInfo!.length),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
