import 'dart:convert';

import 'appointment_entity.dart';
import 'review_entity.dart';

List<Daycare> daycareFromJson(String str) =>
    List<Daycare>.from(json.decode(str).map((x) => Daycare.fromJson(x)));

String daycareToJson(List<Daycare> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Daycare {
  Daycare({
    required this.id,
    required this.daycareName,
    required this.address,
    required this.location,
    required this.owner,
    required this.phoneNumber,
    required this.email,
    required this.imageUrl,
    required this.approvalStatus,
    this.appointmentList,
    required this.daycareId,
    required this.description,
    this.reviews,
  });

  String id;
  String daycareName;
  String address;
  Location location;
  String owner;
  String phoneNumber;
  String email;
  String imageUrl;
  String approvalStatus;
  List<Appointment>? appointmentList;
  List<Review>? reviews;
  String daycareId;
  String description;

  factory Daycare.fromJson(Map<String, dynamic> json) => Daycare(
        id: json["_id"],
        daycareName: json["daycare_name"],
        address: json["address"],
        location: Location.fromJson(json["location"]),
        owner: json["owner"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        approvalStatus: json["approvalStatus"],
        appointmentList: json["appointmentList"] == null
            ? null
            : List<Appointment>.from(
                json["appointmentList"].map((x) => Appointment.fromJson(x))),
        daycareId: json["daycare_id"],
        description: json["description"] == null ? null : json["description"],
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "daycare_name": daycareName,
        "address": address,
        "location": location.toJson(),
        "owner": owner,
        "phoneNumber": phoneNumber,
        "email": email,
        "imageUrl": imageUrl,
        "approvalStatus": approvalStatus,
        "appointmentList": appointmentList == null ? null : appointmentList,
        "daycare_id": daycareId,
        "description": description,
        "reviews": reviews == null ? null : reviews,
      };
}

class Location {
  Location({
    required this.coordinates,
  });

  List<Coordinate> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates: List<Coordinate>.from(
            json["coordinates"].map((x) => Coordinate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x.toJson())),
      };
}

class Coordinate {
  Coordinate({
    required this.lat,
    required this.lon,
  });

  String lat;
  String lon;

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
