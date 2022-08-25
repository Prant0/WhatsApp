import 'package:whatsapp_ui/common/enums/message_enum.dart';

class MessageModel {
  final String senderId, recieverId, text, messageId;
  final DateTime timeSend;
  final bool isSeen;
  final MessageEnum type;

  MessageModel(
      {required this.senderId,
      required this.recieverId,
      required this.text,
      required this.messageId,
      required this.timeSend,
      required this.isSeen,
      required this.type});


  Map<String,dynamic> toMap(){
    return {
      "senderId":senderId,
      "recieverId":recieverId,
      "text":text,
      "messageId":messageId,
      "timeSent":timeSend.millisecondsSinceEpoch,
      "isSeen":isSeen,
      "type":type.type,
    };
  }

  factory MessageModel.fromMap(Map<String,dynamic>map){
    return MessageModel(
        senderId: map["senderId"]??"",
        recieverId: map["recieverId"]??"",
        text: map["text"]??"",
        messageId: map["messageId"]??"",
        timeSend: DateTime.fromMicrosecondsSinceEpoch(map["timeSent"]),
        isSeen: map["isSeen"]??false,
        type: (map["type"] as String).toEnum(),

    );
  }
}
