import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jusitfi_admin/api/chat/get_chat.dart';
import 'package:jusitfi_admin/presentation/widgets/drop_down_button.dart';
import 'package:web_socket_channel/io.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var w;

  List<Widget> message=[];
 var yourtoken="";
 var channel;
 TextEditingController messagecontroller =new TextEditingController();



  makeconnection()  async {
    var resp= await getchat(1);
    print(resp);
    for(Map<String,dynamic> i in resp){

      if(i['sender']=='36'){
        setState(() {
          message.add(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.reply,color: Colors.black,size: 20,),
                  Container(

                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 9),
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black,),
                          borderRadius: BorderRadius.circular(5)

                      ),
                      child:


                        Text(i['content']['text'],style: TextStyle(color: Colors.black),),



                      )

                ],
              )



          );
          message.add(SizedBox(height: 10,));
        });
      }
      else {
        setState(() {
          message.add(Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.reply,color: Colors.black,size: 20,),
                    Container(

                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),color: Colors.black
                      ),
                      child:
                          Row(
                            children: [
                              Text(i['content']['text'],textAlign: TextAlign.center,style: TextStyle(height: .5,color: Colors.white),),
                        SizedBox(width: 10,),

                        Icon(i['content']['isSeen']=='true'?Icons.done:Icons.done_all,color: Colors.white,size: 10,)
                            ],
                          ),

                    )
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(i['created_at'].toString().substring(11,16),textAlign: TextAlign.center,style: TextStyle(height: .5,color: Colors.black),)),
            ],
          ));
          message.add(SizedBox(height: 10,));
        });



      }


    }




 channel = IOWebSocketChannel.connect('ws://15.206.28.255:8000/ws/client_advocate/sender/36/receiver/42/', headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $yourtoken',
   'token':yourtoken
    });
 if(channel!=null){
   channel.stream.listen((msg){
     msg=jsonDecode(msg);
     setState(() {
       message.insert(0, Row(
         mainAxisAlignment: MainAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(
               padding: EdgeInsets.symmetric(vertical: 5,horizontal: 9),
               decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black,),
                   borderRadius: BorderRadius.circular(5)

               ),
               child: Column(
                 children: [
                   Text(msg['data']['content']['text'],style: TextStyle(color: Colors.black),),
                 ],
               )),
           Icon(Icons.reply,color: Colors.black,size: 20,),
         ],
       ));
       message.insert(0,SizedBox(height: 10,));

     });



   });
 }


  }


@override
  initState(){

super.initState();
yourtoken='0f464ab809733c1e19c02d50a1e7be04c86d74a0';

  makeconnection();

  }

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;



    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Message",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        "assets/images/advocate_image.png",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Priya Sharma",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "Case Title : ABC",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date : 15-3-2023",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

       Expanded(
         child: Padding(
           padding: EdgeInsets.only(top: 10,bottom: 75,right: 10,left: 10),
           child: Container(
child:ListView.builder(

  reverse: true,

    itemCount: message.length,
    itemBuilder: (BuildContext context, int index) {
  return message[index];
    },)
         ),
       )





       ) ],
      ),
      bottomSheet: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                )),
            child: IconButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  debugPrint(image.path);
                }
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(

              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
               height: 60,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child:  Expanded(
                child: TextField(

                  minLines: 1,
                  maxLines: 100,

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "message",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(

                      color: Colors.white, onPressed: () {

                      if (messagecontroller.text.isNotEmpty) {
                        channel.sink.add(


                          jsonEncode(  {
    "type":"chat_message",
    "case_connect_id":1,
    "content":{
    "text":messagecontroller.text
    }})
                        );

                        setState(() {
                          message.insert(0,SizedBox(height: 10,));
                          message.insert(0,Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.reply,color: Colors.black,size: 20,),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),color: Colors.black
                                      ),
                                      child:  Row(
                                        children: [
                                          Text(messagecontroller.text,textAlign: TextAlign.center,style: TextStyle(height: .5,color: Colors.white),),
                                          SizedBox(width: 10,),
                                          Icon(Icons.done,color: Colors.white,size: 10,)
                                        ],
                                      ),)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text("Just Now",textAlign: TextAlign.center,style: TextStyle(height: .5,color: Colors.black),),


                              ],
                            ),
                          )


                          );

                          messagecontroller.text="";


                        });

                      }

                    }, icon: Icon(Icons.send,),
                    ),

                  ),
                  controller: messagecontroller,
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }
 @override
 void dispose(){
channel.sink.close();
super.dispose();
 }


}



