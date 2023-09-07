import 'dart:convert';
import 'package:http/http.dart' as http;
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
getchat(caseid) async {

  List<dynamic> alldata=[];
  final response1 =
      await http.get(Uri.parse("http://15.206.28.255:8000/v1/chats/client-advocate/${caseid}/"));
  final int count=jsonDecode(response1.body)['count'];


  if (response1.statusCode == 200) {

    for(var i=1;i<=(count/10).ceil();i++) {
      print(count);

      final response =
      await http.get(Uri.parse(
          "http://15.206.28.255:8000/v1/chats/client-advocate/${caseid}?page=$i"));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];
        print(data);
        for (var j in data) {

            alldata.add(j);

        }

        return alldata;
      }

      else {
        return "Operation Failed";
      }
    }}}