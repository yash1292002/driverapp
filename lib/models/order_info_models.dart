// // To parse this JSON data, do
// //
// //     final orderData = orderDataFromJson(jsonString);

// import 'dart:convert';

// OrderData orderDataFromJson(String str) => OrderData.fromJson(json.decode(str));

// String orderDataToJson(OrderData data) => json.encode(data.toJson());

// class OrderData {
//   OrderData({
//     this.data,
//   });

//   OrderDataInfo? data;

//   factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
//         data:
//             json["data"] == null ? null : OrderDataInfo.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//       };
// }

// class OrderDataInfo {
//   OrderDataInfo(
//       {this.id,
//       this.orderNumber,
//       this.customerId,
//       this.subTotal,
//       this.deliveryFees,
//       this.finalTotal,
//       this.addressId,
//       this.orderAddressId,
//       this.promoCodeId,
//       this.cancelReasonId,
//       this.driverId,
//       this.paymentMethodId,
//       this.transactionId,
//       this.driverStatus,
//       this.orderDeliveredImage,
//       this.status,
//       this.isSchedule,
//       this.discount,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.payment,
//       this.items,
//       this.walletAmount,
//       this.receivableNo});

//   String? id;
//   String? orderNumber;
//   CustomerId? customerId;
//   dynamic subTotal;
//   dynamic deliveryFees;
//   dynamic finalTotal;
//   dynamic addressId;
//   OrderAddressId? orderAddressId;
//   dynamic promoCodeId;
//   dynamic cancelReasonId;
//   DriverId? driverId;
//   String? paymentMethodId;
//   dynamic transactionId;
//   String? driverStatus;
//   String? orderDeliveredImage;
//   int? status;
//   int? isSchedule;
//   Discount? discount;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//   Payment? payment;
//   List<Item>? items;
//   dynamic receivableNo;
//   dynamic walletAmount;

//   factory OrderDataInfo.fromJson(Map<String, dynamic> json) => OrderDataInfo(
//       id: json["id"],
//       orderNumber: json["order_number"],
//       customerId: json["customer_id"] == null
//           ? null
//           : CustomerId.fromJson(json["customer_id"]),
//       subTotal: json["sub_total"],
//       deliveryFees: json["delivery_fees"],
//       finalTotal: json["final_total"],
//       addressId: json["address_id"],
//       orderAddressId: json["order_address_id"] == null
//           ? null
//           : OrderAddressId.fromJson(json["order_address_id"]),
//       promoCodeId: json["promo_code_id"],
//       cancelReasonId: json["cancel_reason_id"],
//       driverId: json["driver_id"] == null
//           ? null
//           : DriverId.fromJson(json["driver_id"]),
//       paymentMethodId: json["payment_method_id"],
//       transactionId: json["transaction_id"],
//       driverStatus: json["driver_status"],
//       orderDeliveredImage: json["order_delivered_image"],
//       status: json["status"],
//       isSchedule: json["is_schedule"],
//       discount:
//           json["discount"] == null ? null : Discount.fromJson(json["discount"]),
//       createdAt: json["created_at"] == null
//           ? null
//           : DateTime.parse(json["created_at"]),
//       updatedAt: json["updated_at"] == null
//           ? null
//           : DateTime.parse(json["updated_at"]),
//       deletedAt: json["deleted_at"],
//       payment:
//           json["payment"] == null ? null : Payment.fromJson(json["payment"]),
//       items: json["items"] == null
//           ? []
//           : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
//       receivableNo: json["receivable_mobile_no"],
//       walletAmount: json['wallet_amount']);

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "order_number": orderNumber,
//         "customer_id": customerId?.toJson(),
//         "sub_total": subTotal,
//         "delivery_fees": deliveryFees,
//         "final_total": finalTotal,
//         "address_id": addressId,
//         "order_address_id": orderAddressId?.toJson(),
//         "promo_code_id": promoCodeId,
//         "cancel_reason_id": cancelReasonId,
//         "driver_id": driverId?.toJson(),
//         "payment_method_id": paymentMethodId,
//         "transaction_id": transactionId,
//         "driver_status": driverStatus,
//         "order_delivered_image": orderDeliveredImage,
//         "status": status,
//         "is_schedule": isSchedule,
//         "discount": discount?.toJson(),
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "deleted_at": deletedAt,
//         "payment": payment?.toJson(),
//         "items": items == null
//             ? []
//             : List<dynamic>.from(items!.map((x) => x.toJson())),
//         "receivable_mobile_no": receivableNo,
//         "wallet_amount": walletAmount,
//       };
// }

// class CustomerId {
//   CustomerId({
//     this.id,
//     this.email,
//     this.name,
//     this.mobileNo,
//   });

//   String? id;
//   String? email;
//   String? name;
//   String? mobileNo;

//   factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
//         id: json["id"],
//         email: json["email"],
//         name: json["name"],
//         mobileNo: json["mobile_no"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "name": name,
//         "mobile_no": mobileNo,
//       };
// }

// class Discount {
//   Discount({
//     this.type,
//     this.value,
//   });

//   dynamic type;
//   dynamic value;

//   factory Discount.fromJson(Map<String, dynamic> json) => Discount(
//         type: json["type"],
//         value: json["value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "value": value,
//       };
// }

// class DriverId {
//   DriverId({
//     this.id,
//     this.name,
//     this.email,
//     this.iqamaNumber,
//     this.vehicleNumberPlate,
//     this.mobileNo,
//   });

//   String? id;
//   String? name;
//   String? email;
//   String? iqamaNumber;
//   String? vehicleNumberPlate;
//   String? mobileNo;

//   factory DriverId.fromJson(Map<String, dynamic> json) => DriverId(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         iqamaNumber: json["iqama_number"],
//         vehicleNumberPlate: json["vehicle_number_plate"],
//         mobileNo: json["mobile_no"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "iqama_number": iqamaNumber,
//         "vehicle_number_plate": vehicleNumberPlate,
//         "mobile_no": mobileNo,
//       };
// }

// class Item {
//   Item({
//     this.productId,
//     this.productName,
//     this.productDescription,
//     this.productVariantId,
//     this.productVariantDescription,
//     this.productVariantName,
//     this.productVariantImage,
//     this.id,
//     this.qty,
//     this.price,
//     this.vatPrice,
//   });

//   String? productId;
//   String? productName;
//   String? productDescription;
//   String? productVariantId;
//   String? productVariantDescription;
//   String? productVariantName;
//   String? productVariantImage;
//   String? id;
//   int? qty;
//   dynamic price;
//   dynamic vatPrice;

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         productId: json["product_id"],
//         productName: json["product_name"],
//         productDescription: json["product_description"],
//         productVariantId: json["product_variant_id"],
//         productVariantDescription: json["product_variant_description"],
//         productVariantName: json["product_variant_name"],
//         productVariantImage: json["product_variant_image"],
//         id: json["id"],
//         qty: json["qty"],
//         price: json["price"],
//         vatPrice: json["vat_price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "product_name": productName,
//         "product_description": productDescription,
//         "product_variant_id": productVariantId,
//         "product_variant_description": productVariantDescription,
//         "product_variant_name": productVariantName,
//         "product_variant_image": productVariantImage,
//         "id": id,
//         "qty": qty,
//         "price": price,
//         "vat_price": vatPrice,
//       };
// }

// class OrderAddressId {
//   OrderAddressId({
//     this.id,
//     this.location,
//     this.notes,
//     this.latitude,
//     this.longitude,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });

//   String? id;
//   String? location;
//   String? notes;
//   double? latitude;
//   double? longitude;
//   DateTime? createdAt;
//   dynamic updatedAt;
//   dynamic deletedAt;

//   factory OrderAddressId.fromJson(Map<String, dynamic> json) => OrderAddressId(
//         id: json["id"],
//         location: json["location"],
//         notes: json["notes"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"],
//         deletedAt: json["deleted_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "location": location,
//         "notes": notes,
//         "latitude": latitude,
//         "longitude": longitude,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt,
//         "deleted_at": deletedAt,
//       };
// }

// class Payment {
//   Payment({
//     this.id,
//     this.name,
//     this.description,
//     this.locale,
//     this.paymentTypeId,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });

//   String? id;
//   String? name;
//   String? description;
//   String? locale;
//   String? paymentTypeId;
//   DateTime? createdAt;
//   dynamic updatedAt;
//   dynamic deletedAt;

//   factory Payment.fromJson(Map<String, dynamic> json) => Payment(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         locale: json["locale"],
//         paymentTypeId: json["payment_type_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"],
//         deletedAt: json["deleted_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "locale": locale,
//         "payment_type_id": paymentTypeId,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt,
//         "deleted_at": deletedAt,
//       };
// }
// To parse this JSON data, do
//
//     final orderData = orderDataFromJson(jsonString);

import 'dart:convert';

OrderData orderDataFromJson(String str) => OrderData.fromJson(json.decode(str));

String orderDataToJson(OrderData data) => json.encode(data.toJson());

class OrderData {
  OrderDataInfo? data;

  OrderData({
    this.data,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        data:
            json["data"] == null ? null : OrderDataInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class OrderDataInfo {
  String? id;
  String? orderNumber;
  CustomerId? customerId;
  dynamic subTotal;
  dynamic deliveryFees;
  dynamic finalTotal;
  String? addressId;
  String? receivableMobileNo;
  OrderAddressId? orderAddressId;
  dynamic promoCodeId;
  dynamic cancelReasonId;
  DriverId? driverId;
  String? dispatcherId;
  String? paymentMethodId;
  String? transactionId;
  String? driverStatus;
  String? dispatcherStatus;
  String? orderDeliveredImage;
  int? status;
  int? isSchedule;
  Discount? discount;
  dynamic walletAmount;
  dynamic odooOrderId;
  dynamic userPaidAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Payment? payment;
  List<Item>? items;

  OrderDataInfo({
    this.id,
    this.orderNumber,
    this.customerId,
    this.subTotal,
    this.deliveryFees,
    this.finalTotal,
    this.addressId,
    this.receivableMobileNo,
    this.orderAddressId,
    this.promoCodeId,
    this.cancelReasonId,
    this.driverId,
    this.dispatcherId,
    this.paymentMethodId,
    this.transactionId,
    this.driverStatus,
    this.dispatcherStatus,
    this.orderDeliveredImage,
    this.status,
    this.isSchedule,
    this.discount,
    this.walletAmount,
    this.odooOrderId,
    this.userPaidAmount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.payment,
    this.items,
  });

  factory OrderDataInfo.fromJson(Map<String, dynamic> json) => OrderDataInfo(
        id: json["id"],
        orderNumber: json["order_number"],
        customerId: json["customer_id"] == null
            ? null
            : CustomerId.fromJson(json["customer_id"]),
        subTotal: json["sub_total"],
        deliveryFees: json["delivery_fees"],
        finalTotal: json["final_total"],
        addressId: json["address_id"],
        receivableMobileNo: json["receivable_mobile_no"],
        orderAddressId: json["order_address_id"] == null
            ? null
            : OrderAddressId.fromJson(json["order_address_id"]),
        promoCodeId: json["promo_code_id"],
        cancelReasonId: json["cancel_reason_id"],
        driverId: json["driver_id"] == null
            ? null
            : DriverId.fromJson(json["driver_id"]),
        dispatcherId: json["dispatcher_id"],
        paymentMethodId: json["payment_method_id"],
        transactionId: json["transaction_id"],
        driverStatus: json["driver_status"],
        dispatcherStatus: json["dispatcher_status"],
        orderDeliveredImage: json["order_delivered_image"],
        status: json["status"],
        isSchedule: json["is_schedule"],
        discount: json["discount"] == null
            ? null
            : Discount.fromJson(json["discount"]),
        walletAmount: json["wallet_amount"],
        odooOrderId: json["odoo_order_id"],
        userPaidAmount: json["user_paid_amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "customer_id": customerId?.toJson(),
        "sub_total": subTotal,
        "delivery_fees": deliveryFees,
        "final_total": finalTotal,
        "address_id": addressId,
        "receivable_mobile_no": receivableMobileNo,
        "order_address_id": orderAddressId?.toJson(),
        "promo_code_id": promoCodeId,
        "cancel_reason_id": cancelReasonId,
        "driver_id": driverId?.toJson(),
        "dispatcher_id": dispatcherId,
        "payment_method_id": paymentMethodId,
        "transaction_id": transactionId,
        "driver_status": driverStatus,
        "dispatcher_status": dispatcherStatus,
        "order_delivered_image": orderDeliveredImage,
        "status": status,
        "is_schedule": isSchedule,
        "discount": discount?.toJson(),
        "wallet_amount": walletAmount,
        "odoo_order_id": odooOrderId,
        "user_paid_amount": userPaidAmount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "payment": payment?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class CustomerId {
  String? id;
  String? email;
  String? name;
  String? mobileNo;

  CustomerId({
    this.id,
    this.email,
    this.name,
    this.mobileNo,
  });

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

class Discount {
  dynamic type;
  dynamic value;

  Discount({
    this.type,
    this.value,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class DriverId {
  String? id;
  String? name;
  String? email;
  String? iqamaNumber;
  String? vehicleNumberPlate;
  String? mobileNo;

  DriverId({
    this.id,
    this.name,
    this.email,
    this.iqamaNumber,
    this.vehicleNumberPlate,
    this.mobileNo,
  });

  factory DriverId.fromJson(Map<String, dynamic> json) => DriverId(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        iqamaNumber: json["iqama_number"],
        vehicleNumberPlate: json["vehicle_number_plate"],
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

class Item {
  String? productId;
  String? productName;
  String? productDescription;
  String? productVariantId;
  String? productVariantDescription;
  String? productVariantName;
  dynamic productVariantImage;
  String? id;
  int? qty;
  dynamic price;
  dynamic vatPrice;

  Item({
    this.productId,
    this.productName,
    this.productDescription,
    this.productVariantId,
    this.productVariantDescription,
    this.productVariantName,
    this.productVariantImage,
    this.id,
    this.qty,
    this.price,
    this.vatPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productVariantId: json["product_variant_id"],
        productVariantDescription: json["product_variant_description"],
        productVariantName: json["product_variant_name"],
        productVariantImage: json["product_variant_image"],
        id: json["id"],
        qty: json["qty"],
        price: json["price"],
        vatPrice: json["vat_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_description": productDescription,
        "product_variant_id": productVariantId,
        "product_variant_description": productVariantDescription,
        "product_variant_name": productVariantName,
        "product_variant_image": productVariantImage,
        "id": id,
        "qty": qty,
        "price": price,
        "vat_price": vatPrice,
      };
}

class OrderAddressId {
  String? id;
  String? location;
  String? notes;
  double? latitude;
  double? longitude;
  String? zoneId;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  OrderAddressId({
    this.id,
    this.location,
    this.notes,
    this.latitude,
    this.longitude,
    this.zoneId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory OrderAddressId.fromJson(Map<String, dynamic> json) => OrderAddressId(
        id: json["id"],
        location: json["location"],
        notes: json["notes"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        zoneId: json["zone_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "notes": notes,
        "latitude": latitude,
        "longitude": longitude,
        "zone_id": zoneId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class Payment {
  String? id;
  String? name;
  String? description;
  String? locale;
  String? paymentTypeId;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Payment({
    this.id,
    this.name,
    this.description,
    this.locale,
    this.paymentTypeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        locale: json["locale"],
        paymentTypeId: json["payment_type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "locale": locale,
        "payment_type_id": paymentTypeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
