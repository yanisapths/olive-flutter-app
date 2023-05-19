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
    required this.clinicId,
  });

  String id;
  String reviewId;
  String comments;
  String date;
  String customerName;
  String clinicId;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        reviewId: json["review_id"] == null ? null : json["review_id"],
        comments: json["comments"],
        date: json["date"] == null ? null : json["date"],
        customerName: json["customer_name"],
        clinicId: json["daycare_id"] == null ? null : json["clinic_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "review_id": reviewId == null ? null : reviewId,
        "comments": comments,
        "date": date == null ? null : date,
        "customerName": customerName,
        "clinic_id": clinicId == null ? null : clinicId,
      };
}
