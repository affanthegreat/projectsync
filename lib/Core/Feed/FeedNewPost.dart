import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';


class FeedNewPost extends StatefulWidget {
  @override
  _FeedNewPostState createState() => _FeedNewPostState();
}

class _FeedNewPostState extends State<FeedNewPost> {


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints( maxWidth: 1080),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              child: Text("New Post",style: poppins(p4,h3,FontWeight.w600),),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100.withOpacity(0.65),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  TextField(
                    minLines: 1,
                    maxLines: 10,
                    maxLength: 150,
                    decoration: new InputDecoration(
                      counterStyle: poppins(p4,h3,FontWeight.w400) ,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      ),
                    style: poppins(p4,h3,FontWeight.w500),
                  ),
                  Divider(color: p3,thickness: 0.2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: (){},iconSize: 25, icon: Icon(Icons.add_a_photo,color: p4.withOpacity(0.5),)),
                          IconButton(onPressed: (){},iconSize: 25, icon: Icon(Icons.attach_file_rounded,color: p4.withOpacity(0.5),))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: p3,
                        ),
                        child: Center(
                          child: Text("Post",style: poppins(p1,h4,FontWeight.w600),),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),

          ],
        ));
  }
}
