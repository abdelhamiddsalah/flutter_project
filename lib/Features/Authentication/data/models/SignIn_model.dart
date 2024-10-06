
import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    bool status;
    String message;
    Data data;

    SignInModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String name;
    String email;
    String phone;
    String image;
    int points;
    int credit;
    String token;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.image,
        required this.points,
        required this.credit,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        credit: json["credit"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "points": points,
        "credit": credit,
        "token": token,
    };
}
