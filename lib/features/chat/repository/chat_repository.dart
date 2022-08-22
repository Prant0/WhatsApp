import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_ui/common/enums/message_enum.dart';
import 'package:whatsapp_ui/common/utlits/utlits.dart';
import 'package:whatsapp_ui/models/chat_contact_model.dart';
import 'package:whatsapp_ui/models/message_model.dart';
import 'package:whatsapp_ui/models/user_model.dart';


final chatRepositoryProvider=Provider((ref){
  return ChatRepository(auth: FirebaseAuth.instance, firestore:FirebaseFirestore.instance);
});

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository({required this.auth, required this.firestore});

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
  }) async {
    try {
      var timeSend = DateTime.now();
      UserModel receiverUserData;
      var userDataMap =
          await firestore.collection("users").doc(recieverUserId).get();
      receiverUserData = UserModel.fromMap(userDataMap.data()!);
      var messageId = const Uuid().v1();
      saveDataToContactsSubCollection(
          senderUser, receiverUserData, text, timeSend, recieverUserId);

      saveMessageToMessageSubCollection(
          text: text,
          messageId: messageId,
          timeSend: timeSend,
          messageType: MessageEnum.text,
          receiverUserId: recieverUserId,
          recieverUserName: receiverUserData.name,
          userName: senderUser.name);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  void saveDataToContactsSubCollection(
    UserModel senderUserData,
    UserModel recieverUserData,
    String text,
    DateTime timeSend,
    String recieverUserId,
  ) async {
    //user->receiver user id=>chats=>current user id -> set Data
    var receiverChatContact = ChatContactModel(
        name: senderUserData.name,
        profilePic: senderUserData.profilePic,
        contactId: senderUserData.uid,
        timeSent: timeSend,
        lastMessage: text);

    await firestore
        .collection("users")
        .doc(recieverUserId)
        .collection("chats")
        .doc(auth.currentUser!.uid)
        .set(receiverChatContact.toMap());

    //user -> current user id =>chats -> reciever user id ->set data

    var senderChatContact = ChatContactModel(
        name: recieverUserData.name,
        profilePic: recieverUserData.profilePic,
        contactId: recieverUserData.uid,
        timeSent: timeSend,
        lastMessage: text);

    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("chats")
        .doc(recieverUserId)
        .set(senderChatContact.toMap());
  }

  void saveMessageToMessageSubCollection(
      {required String receiverUserId,
      required String text,
      required DateTime timeSend,
      required String messageId,
      required String userName,
      required String recieverUserName,
      required MessageEnum messageType}) async {
    final message = MessageModel(
        senderId: auth.currentUser!.uid,
        recieverId: receiverUserId,
        text: text,
        messageId: messageId,
        timeSend: timeSend,
        isSeen: false,
        type: messageType);
    //user->sender user id->reciever id=>message->message id -> set Data
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("chats")
        .doc(receiverUserId)
        .collection("messages")
        .doc(messageId)
        .set(message.toMap());

    //user->reciever user id->sender id=>message->message id -> set Data

    await firestore
        .collection("users")
        .doc(receiverUserId)
        .collection("chats")
        .doc(auth.currentUser!.uid)
        .collection("messages")
        .doc(messageId)
        .set(message.toMap());
  }
}
