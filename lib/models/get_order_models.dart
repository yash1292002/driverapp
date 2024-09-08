// To parse this JSON data, do
//
//     final getorderData = getorderDataFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

GetorderData getorderDataFromJson(String str) =>
    GetorderData.fromJson(json.decode(str));

String getorderDataToJson(GetorderData data) => json.encode(data.toJson());

class GetorderData {
  GetorderData({this.data, this.count});

  List<GetorderDataInfo>? data;
  int? count;

  factory GetorderData.fromJson(Map<String, dynamic> json) => GetorderData(
        data: json["data"] == null
            ? []
            : List<GetorderDataInfo>.from(
                json["data"]!.map((x) => GetorderDataInfo.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
      };
}

class GetorderDataInfo {
  GetorderDataInfo({
    this.id,
    this.orderNumber,
    this.customerId,
    this.subTotal,
    this.deliveryFees,
    this.finalTotal,
    this.addressId,
    this.orderAddressId,
    this.promoCodeId,
    this.cancelReasonId,
    this.driverId,
    this.paymentMethodId,
    this.transactionId,
    this.driverStatus,
    this.orderDeliveredImage,
    this.status,
    this.isSchedule,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.items,
  });

  String? id;
  String? orderNumber;
  CustomerId? customerId;
  dynamic subTotal;
  dynamic deliveryFees;
  dynamic finalTotal;
  dynamic addressId;
  OrderAddressId? orderAddressId;
  String? promoCodeId;
  String? cancelReasonId;
  DriverId? driverId;
  String? paymentMethodId;
  dynamic transactionId;
  String? driverStatus;
  String? orderDeliveredImage;
  int? status;
  int? isSchedule;
  dynamic discount;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? items;

  factory GetorderDataInfo.fromJson(Map<String, dynamic> json) =>
      GetorderDataInfo(
        id: json["id"],
        orderNumber: json["order_number"],
        customerId: json["customer_id"] == null
            ? null
            : CustomerId.fromJson(json["customer_id"]),
        subTotal: json["sub_total"],
        deliveryFees: json["delivery_fees"],
        finalTotal: json["final_total"]?.toDouble(),
        addressId: json["address_id"],
        orderAddressId: json["order_address_id"] == null
            ? null
            : OrderAddressId.fromJson(json["order_address_id"]),
        promoCodeId: json["promo_code_id"],
        cancelReasonId: json["cancel_reason_id"],
        driverId: json["driver_id"] == null
            ? null
            : DriverId.fromJson(json["driver_id"]),
        paymentMethodId: json["payment_method_id"],
        transactionId: json["transaction_id"],
        driverStatus: json["driver_status"],
        orderDeliveredImage: json["order_delivered_image"],
        status: json["status"],
        isSchedule: json["is_schedule"],
        discount: json["discount"]?.toDouble(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "customer_id": customerId?.toJson(),
        "sub_total": subTotal,
        "delivery_fees": deliveryFees,
        "final_total": finalTotal,
        "address_id": addressId,
        "order_address_id": orderAddressId?.toJson(),
        "promo_code_id": promoCodeId,
        "cancel_reason_id": cancelReasonId,
        "driver_id": driverId?.toJson(),
        "payment_method_id": paymentMethodId,
        "transaction_id": transactionId,
        "driver_status": driverStatus,
        "order_delivered_image": orderDeliveredImage,
        "status": status,
        "is_schedule": isSchedule,
        "discount": discount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "items": items,
      };
}

class CustomerId {
  CustomerId({
    this.id,
    this.email,
    this.name,
    this.mobileNo,
  });

  String? id;
  String? email;
  String? name;
  String? mobileNo;

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        mobileNo: json["mobile_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "mobile_no": mobileNo,
      };
}

class DriverId {
  DriverId({
    this.id,
    this.name,
    this.email,
    this.iqamaNumber,
    this.vehicleNumberPlate,
    this.mobileNo,
  });

  String? id;
  String? name;
  String? email;
  String? iqamaNumber;
  String? vehicleNumberPlate;
  String? mobileNo;

  factory DriverId.fromJson(Map<String, dynamic> json) => DriverId(
        id: json["id"],
        name: json["name"]!,
        email: json["email"]!,
        iqamaNumber: json["iqama_number"],
        vehicleNumberPlate: json["vehicle_number_plate"]!,
        mobileNo: json["mobile_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "iqama_number": iqamaNumber,
        "vehicle_number_plate": vehicleNumberPlate,
        "mobile_no": mobileNo,
      };
}

class OrderAddressId {
  OrderAddressId({
    this.id,
    this.location,
    this.notes,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? id;
  String? location;
  String? notes;
  double? latitude;
  double? longitude;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory OrderAddressId.fromJson(Map<String, dynamic> json) => OrderAddressId(
        id: json["id"],
        location: json["location"],
        notes: json["notes"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "notes": notes,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
