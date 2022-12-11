import 'dart:convert';

List<Review> reviewFromJson(String str) =>
    List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  Review({
    required this.id,
    required this.reviewId,
    required this.comments,
    required this.date,
    required this.customerName,
    required this.appointmentId,
    required this.daycareId,
  });

  String id;
  String reviewId;
  String comments;
  String date;
  String customerName;
  String appointmentId;
  String daycareId;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        reviewId: json["review_id"] == null ? null : json["review_id"],
        comments: json["comments"],
        date: json["date"] == null ? null : json["date"],
        customerName: json["customerName"],
        appointmentId: json["appointment_id"],
        daycareId: json["daycare_id"] == null ? null : json["daycare_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "review_id": reviewId == null ? null : reviewId,
        "comments": comments,
        "date": date == null ? null : date,
        "customerName": customerName,
        "appointment_id": appointmentId,
        "daycare_id": daycareId == null ? null : daycareId,
      };
}
