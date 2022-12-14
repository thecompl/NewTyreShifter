import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyreshifter/config/Color.dart';
import '../Widget/Appbartext.dart';
import '../Widget/Customshap.dart';
import '../Widget/Textfield.dart';

import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    // ChatMessage(
    //     messageContent: "Is there any thing wrong?", messageType: "sender"),
    // ChatMessage(
    //     messageContent: "Is there any thing wrong?", messageType: "sender"),
    // ChatMessage(
    //     messageContent: "Is there any thing wrong?", messageType: "sender"),
    // ChatMessage(
    //     messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  String? type_account;
  bool chatstart = true;
  @override
  void initState() {
    log(chatstart.toString());
    get_typeaccount();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: PreferredSize(
        preferredSize: Platform.isAndroid
            ? Size.fromHeight(appbarheight_android)
            : Size.fromHeight(appbarheight_ios),
        child: Appbartext(
            title: type_account == get_shifter ? msg : msg + " (23:59 hours)"),
      ),

      // Appbartext().appbar(msg + "",
      //     TextStyles.withColor(TextStyles.mb16, color.black), context),
      body: Stack(
        children: [
          Container(
            // height: size.height*0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                    radius: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                            Image.asset(service_img, fit: BoxFit.cover)), //Text
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textfield().text(
                        "Summer times",
                        TextStyles.withColor(
                            TextStyles.mb16, color.text_grey2_color)),
                  ),
                  chatstart == false
                      ? Container(
                          alignment: Alignment.center,
                          height: size.height * 0.5,
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SvgPicture.asset(frame_icon),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Textfield().text(
                                      after24hrs,
                                      TextStyles.withColor(TextStyles.mb16,
                                          color.text_grey2_color)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Textfield().text(
                                      willavailable,
                                      TextStyles.withColor(TextStyles.mb16,
                                          color.text_grey2_color))
                                ]),
                          ),
                        )
                      : Container(
                          // height: size.height*0.5,
                          child: ListView.builder(
                            itemCount: messages.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.only(
                                      left: 14, right: 14, top: 10, bottom: 10),
                                  child: Align(
                                    alignment: messages[index].messageType ==
                                            "receiver"
                                        ? Alignment.topLeft
                                        : Alignment
                                            .topRight, //Change this to Alignment.topRight or Alignment.topLeft
                                    child: CustomPaint(
                                      painter: CustomChatBubble(
                                          isOwn: messages[index].messageType ==
                                                  "receiver"
                                              ? false
                                              : true,
                                          color: messages[index].messageType !=
                                                  "receiver"
                                              ? color.Primary_second_Color
                                              : color.msg_txt_color),
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "Hello World",
                                          style: TextStyles.withColor(
                                              TextStyles.mn14,
                                              messages[index].messageType !=
                                                      "receiver"
                                                  ? color.white
                                                  : color.black),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 75,

              // width: double.infinity,
              color: color.Primary_second_Color,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: Platform.isIOS
                        ? EdgeInsets.only(
                            bottom: 10,
                          )
                        : EdgeInsets.only(bottom: 0),
                    width: size.width * 0.82,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type a message...",
                          hintStyle: TextStyles.withColor(
                              TextStyles.mn14, color.txt_grey4_color),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: Platform.isIOS
                          ? EdgeInsets.only(bottom: 10)
                          : EdgeInsets.only(bottom: 0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  get_typeaccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type_account = prefs.getString("type");
    });

    print("type account--" + type_account.toString());
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
