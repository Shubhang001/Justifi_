
import 'package:web_socket_channel/io.dart';
class Chatmodel {
  String type;
  Data data;

  Chatmodel({
    required this.type,
    required this.data,
  });

  factory Chatmodel.fromJson(Map<String, dynamic> json, {required type}) {
    return Chatmodel(
        type: json['type'],
        data: json['data']
    );
  }
}

class Data {
  int messageId;
  int threadId;
  int senderId;
  int receiverId;
  Content content;
  String format;
  String category;
  String status;
  dynamic replyTo;
  bool isSeen;
  DateTime createdAt;

  Data({
    required this.messageId,
    required this.threadId,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.format,
    required this.category,
    required this.status,
    required this.replyTo,
    required this.isSeen,
    required this.createdAt,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
  return Data(
  messageId:json['messageId'],
   threadId:json['threadId'],
   senderId:json['senderId'],
   receiverId:json['receiverId'],
 content:json['content'],
   format:json['format'],
   category:json['category'],
  status:json['status'],
replyTo:json['replyTo'],
isSeen:json['isSeen'],
  createdAt:json['createdAt']
  );}

}

class Content {
  String text;

  Content({
    required this.text,
  });
  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(text: json['text']

    );
  }

}
// getchat(){
//
//  var channel = IOWebSocketChannel.connect('ws://15.206.28.255:8000/ws/client_advocate/sender/36/receiver/42/', headers: {
//     'Content-type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $yourtoken',
//     'token':yourtoken
//   });
//   if(channel!=null){
//     print("connection succeed");
//   }
//
// }