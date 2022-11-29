// To parse this JSON data, do
//
//     final daycare = daycareFromJson(jsonString);

import 'dart:convert';

List<Daycare> daycareFromJson(String str) =>
    List<Daycare>.from(json.decode(str).map((x) => Daycare.fromJson(x)));

String daycareToJson(List<Daycare> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Daycare {
  Daycare({
    required this.name,
    required this.address,
    required this.owner,
    required this.phoneNumber,
    required this.email,
  });

  String name;
  String address;
  String owner;
  String phoneNumber;
  String email;

  factory Daycare.fromJson(Map<String, dynamic> json) => Daycare(
        name: json["name"],
        address: json["address"],
        owner: json["owner"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "owner": owner,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
