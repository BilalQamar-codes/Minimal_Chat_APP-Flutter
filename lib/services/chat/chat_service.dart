import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/message.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
// import '';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = AuthService();

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String recieverId, message) async {
    final currentUserId = _auth.getCurrentUser()!.uid;
    final currentUserEmail = _auth.getCurrentUser()!.email.toString();
    final timeStamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      recieverId: recieverId,
      message: message,
      time: timeStamp,
    );

    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String user1Id, user2Id) {
    List<String> ids = [user1Id, user2Id];
    ids.sort();
    String chatRoomId = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("time", descending: false)
        .snapshots();
  }
}
