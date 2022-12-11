import 'dart:convert';

List<Appointment> appointmentFromJson(String str) => List<Appointment>.from(
    json.decode(str).map((x) => Appointment.fromJson(x)));

String appointmentToJson(List<Appointment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appointment {
  Appointment({
    required this.customerName,
    required this.date,
    required this.phoneNumber,
    required this.startTime,
    required this.endTime,
    required this.daycareName,
    required this.daycareId,
    required this.status,
    required this.appointmentId,
  });

  String customerName;
  DateTime date;
  String phoneNumber;
  String startTime;
  String endTime;
  String daycareName;
  String daycareId;
  String status;
  String appointmentId;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        customerName: json["customerName"],
        date: DateTime.parse(json["date"]),
        phoneNumber: json["phoneNumber"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        daycareName: json["daycare_name"],
        daycareId: json["daycare_id"],
        status: json["status"],
        appointmentId: json["appointment_id"],
      );

  Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "date": date.toIso8601String(),
        "phoneNumber": phoneNumber,
        "startTime": startTime,
        "endTime": endTime,
        "daycare_name": daycareName,
        "daycare_id": daycareId,
        "status": status,
        "appointment_id": appointmentId,
      };
}
