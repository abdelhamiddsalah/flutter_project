import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    bool status;
    String message;
    Data? data; // Nullable

    SignUpModel({
        required this.status,
        required this.message,
        this.data, // Nullable
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) {
        return SignUpModel(
            status: json["status"] ?? false, // Default to false if null
            message: json["message"] ?? "", // Default to empty string if null
            data: json["data"] != null ? Data.fromJson(json["data"]) : null, // Handle null data
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(), // Handle null data
    };
}

class Data {
    String? name; // Nullable
    String? phone; // Nullable
    String? email; // Nullable
    int? id; // Nullable
    String? image; // Nullable
    String? token; // Nullable

    Data({
        this.name,
        this.phone,
        this.email,
        this.id,
        this.image,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            name: json["name"], // Nullable
            phone: json["phone"], // Nullable
            email: json["email"], // Nullable
            id: json["id"], // Nullable
            image: json["image"], // Nullable
            token: json["token"], // Nullable
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "id": id,
        "image": image,
        "token": token,
    };
}
