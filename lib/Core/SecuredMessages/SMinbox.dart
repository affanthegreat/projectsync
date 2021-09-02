import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';





class Conversations extends StatefulWidget {
  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FractionallySizedBox(

      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 320
        ),
        child: Container(
          height: height,
          color: Colors.grey.shade200,

          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return ConversationThread();
              }),
        ),
      ),
    );
  }
}




class ConversationThread extends StatefulWidget {
  @override
  _ConversationThreadState createState() => _ConversationThreadState();
}

class _ConversationThreadState extends State<ConversationThread> {
  bool s = false;
  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 75,
          maxHeight: 100,
        minWidth: 311
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 5,top: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    child: CircleAvatar(backgroundColor: p3,)),
                Container(
                    margin: EdgeInsets.all(5),
                    child: Text("John Smith",style: poppins(p4,h3,FontWeight.w600),))
              ],
            ),
            Row(
              children: [
                Visibility(
                    visible:s,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.volume_mute,color: p4,))),
                Visibility(
                    visible:s,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.archive,color: p4,))),
                Visibility(
                    visible:s,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: p4,))),
                IconButton(onPressed: (){
                  setState(() {
                    s = !s;
                  });
                }, icon: Icon(Icons.arrow_left_sharp,color: p3,)),

              ],


            ),

          ],
        ),
      ),
    );
  }
}

