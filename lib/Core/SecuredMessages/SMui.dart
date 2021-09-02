import 'package:flutter/material.dart';
import 'package:projectsync/Core/SecuredMessages/Chatbox.dart';
import 'package:projectsync/Core/SecuredMessages/SMinbox.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Services/Responsivity.dart';


class SecuredMessagingUI extends StatefulWidget {
  @override
  _SecuredMessagingUIState createState() => _SecuredMessagingUIState();
}

class _SecuredMessagingUIState extends State<SecuredMessagingUI> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: p1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints:BoxConstraints(
              maxWidth: 1080
            ) ,
            child: Container(
              child: AppBar(
                backgroundColor: p1,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                automaticallyImplyLeading: !ResponsiveWidget.isSmallScreen(context),
                title: Text(
                  "Messaging",
                  style: poppins(p4, h2, FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
      body:Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: height,
              maxWidth: 1080,
            ),
            child: width > 750? Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Conversations()),
                Expanded(
                    flex: 4,
                    child: Chat(

                    ))
              ],
            ):Conversations()),
      )
    );
  }
}

