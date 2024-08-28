import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String recieverId;
  final Timestamp time;
  final String message;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.recieverId,
    required this.message,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return ({
      "senderId": senderId,
      "senderEmail": senderEmail,
      "recieverId": recieverId,
      "message": message,
      "time": time,
    });
  }
}
