// To parse this JSON data, do
//
//     final getUserData = getUserDataFromJson(jsonString);

import 'dart:convert';

GetUserData getUserDataFromJson(String str) => GetUserData.fromJson(json.decode(str));

String getUserDataToJson(GetUserData data) => json.encode(data.toJson());

class GetUserData {
    GetUserData({
        this.data,
    });

    GetUserDataInfo? data;

    factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
        data: json["data"] == null ? null : GetUserDataInfo.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class GetUserDataInfo {
    GetUserDataInfo({
        this.id,
        this.name,
        this.email,
        this.iqamaNumber,
        this.vehicleNumberPlate,
        this.mobileNo,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    String? name;
    String? email;
    String? iqamaNumber;
    String? vehicleNumberPlate;
    String? mobileNo;
    DateTime? createdAt;
    dynamic updatedAt;

    factory GetUserDataInfo.fromJson(Map<String, dynamic> json) => GetUserDataInfo(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        iqamaNumber: json["iqama_number"],
        vehicleNumberPlate: json["vehicle_number_plate"],
        mobileNo: json["mobile_no"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "iqama_number": iqamaNumber,
        "vehicle_number_plate": vehicleNumberPlate,
        "mobile_no": mobileNo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
    };
}
