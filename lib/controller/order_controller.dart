// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:driverapp/Services/api_services.dart';
import 'package:driverapp/models/get_order_models.dart';
import 'package:driverapp/models/order_info_models.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:driverapp/Services/sharedprefrence.dart';
import 'package:driverapp/constant/app_colors.dart';

import '../constant/app_colors.dart';

class OrderController extends ChangeNotifier {
  List<GetorderDataInfo>? _getOrderInfo;
  List<GetorderDataInfo>? get getOrderInfo => _getOrderInfo;
  List<GetorderDataInfo>? _getPendingOrderInfo;
  List<GetorderDataInfo>? get getPendingOrderInfo => _getPendingOrderInfo;
  List<GetorderDataInfo>? _getDeliverdOrderInfo;
  List<GetorderDataInfo>? get getDeliverdOrderInfo => _getDeliverdOrderInfo;
  List<GetorderDataInfo>? _getCancelOrderInfo;
  List<GetorderDataInfo>? get getCancelOrderInfo => _getCancelOrderInfo;

  void resetOrderList() {
    _getPendingOrderInfo = [];
    _getDeliverdOrderInfo = [];
    _getCancelOrderInfo = [];
  }

  File? _file;
  File? get file => _file;

  void setFile(File file) {
    _file = file;
    notifyListeners();
  }

  Future getDriverOrder() async {
    var response = await ApiServices().getdriverOrder();
    if (response != null) {
      if (response.statusCode == 200) {
        GetorderData? _data = getorderDataFromJson(json.encode(response.data));
        _getOrderInfo = _data.data;
        log("-------------------_getOrderInfo " +
            _getOrderInfo!.length.toString());

        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
  }

  Future getDriverOrderWithStatus(String? status) async {
    var response = await ApiServices().getdriverOrderWithStatus(status);
    if (response != null) {
      if (response.statusCode == 200) {
        GetorderData? _data = getorderDataFromJson(json.encode(response.data));
        if (status == "pending") {
          log("-------------------pending " + _data.data!.length.toString());
          _getPendingOrderInfo = _data.data;
          log("-------------------pending " +
              _getPendingOrderInfo!.length.toString());
        } else if (status == "delivered") {
          _getDeliverdOrderInfo = _data.data;
          log("-------------------delivered " +
              _getDeliverdOrderInfo!.length.toString());
        } else if (status == "cancelled") {
          log("-------------------delivered Cancel" +
              _getCancelOrderInfo!.length.toString());
          _getCancelOrderInfo = _data.data;
        }

        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
  }

  OrderDataInfo? _orderDataInfo;
  OrderDataInfo? get orderDataInfo => _orderDataInfo;

  // CustomerId? _customerInfo;
  // CustomerId? get customerInfo => _customerInfo;

  OrderData? _data;
  OrderData? get data => _data;

  double? _vatPrice = 0.0;
  double? get vatPrice => _vatPrice;

  Future getOrderInfoes(_orderId) async {
    log("------_orderId   " + _orderId);

    var response = await ApiServices().getOrderInfo(_orderId);
    if (response != null) {
      _data = orderDataFromJson(json.encode(response.data));
      log("------responce   " + response.data.toString());
      if (response.statusCode == 200 && _data!.data != null) {
        _orderDataInfo = _data!.data;
        _vatPrice = 0.0;
        for (var i = 0; i < _orderDataInfo!.items!.length; i++) {
          _vatPrice = _vatPrice! + _orderDataInfo!.items![i].vatPrice!;
        }
        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
  }

  Future changeDriverStatus(_status) async {
    print("-------------- status :: $_status");
    var response = await ApiServices().changeDriverStatus(_status);
    if (response != null) {
      if (response.statusCode == 200) {
        log("change the driver status ==== " + response.data.toString());
        return true;
      } else {
        return false;
      }
    }
  }

  Future orderStatusChange(orderid, status) async {
    String? token = SharedPrefService().getToken();
    var headers = {'accept': '*/*', 'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'PUT',
        // Uri.parse(
        //     'https://qaapis.yaafoods.com/api/driver/driver-order-status'));
        // Uri.parse(
        //     'https://stageapis.yaafoods.com/api/driver/driver-order-status'));

        Uri.parse('https://api.yaafoods.com/api/driver/driver-order-status'));
    request.fields.addAll({'order_id': orderid, 'status': status.toString()});
    request.files.add(await http.MultipartFile.fromPath('image', file!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());

      return true;
    } else {
      print(response.reasonPhrase);

      return false;
    }
  }

  bool? _wrongStatus = false;
  bool? get wrongStatus => _wrongStatus; 

  void setStatus(bool val){
    _wrongStatus = val;
    notifyListeners();
  }

  Future orderStatusChange1(orderid, status) async {
    try {
      String? token = SharedPrefService().getToken();
    var headers = {'accept': '*/*', 'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'PUT',
        // Uri.parse(
        //     'https://qaapis.yaafoods.com/api/driver/driver-order-status'));
        // Uri.parse(
        //     'https://stageapis.yaafoods.com/api/driver/driver-order-status'));
        Uri.parse('https://api.yaafoods.com/api/driver/driver-order-status'));
    request.fields.addAll(
        {'order_id': orderid, 'status': status.toString(), 'image': ''});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("---------------------   " + await response.stream.bytesToString());
     setStatus(false);
      return true;
    } else {
      print(""+response.reasonPhrase.toString());
      setStatus(true);

      Fluttertoast.showToast(
            msg: "This order is cancelled so you can't change the status",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.whiteColor,
            textColor: AppColors.redColor,
            fontSize: 15);
      return false;
    }
    } catch (e) {
      setStatus(true);
      log("message=========="+e.toString());
    }
  }

  launchUserWhatsAppUri(usernumber) async {
    final link = WhatsAppUnilink(
      phoneNumber: usernumber.toString(),
      text: "Hey!",
    );
    await launch(link.asUri().toString());
  }

  launchReceivableWhatsAppUri(recivebalnumber) async {
    final link =
        WhatsAppUnilink(phoneNumber: recivebalnumber.toString(), text: "Hey!");
    await launch(link.asUri().toString());
  }

  static Future<void> openMap(double? latitude, double? longitude) async {
    var googleUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunch(googleUrl.toString())) {
      await launch(googleUrl.toString());
    } else {
      throw 'Could not open the map.';
    }
  }
}
