import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectsync/Core/Feed/FeedNewPost.dart';
import 'package:projectsync/Core/Feed/Stories.dart';

import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Services/AuthHandler.dart';
import 'package:projectsync/Services/Responsivity.dart';

class StreamWithStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(children: [
          FractionallySizedBox(widthFactor: 0.65, child: Stream()),
          FractionallySizedBox(widthFactor: 0.35, child: Settings())
        ])
      ],
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(width: 10, color: Colors.grey.shade100),
      )

      ),
      child: Column(
        children: [

          ResponsiveWidget.isSmallScreen(context)?Container():FeedNewPost(),
          ResponsiveWidget.isSmallScreen(context)?Container():Divider(thickness: 10, color: Colors.grey.shade100),
          FractionallySizedBox(
            widthFactor: 1,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 250),
              child: Container(
                margin: EdgeInsets.all(2),
                color: p6,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      child: CircleAvatar(
                        radius: 40,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Johnny Bhaiyya",
                              style: poppins(p4, h4, FontWeight.w600)),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Divider(thickness: 10, color: Colors.grey.shade100),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                "Quick Access",
                style: poppins(p4, h3, FontWeight.w600),
              )),
          Container(
              margin: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Your Profile",
                    style: poppins(p4.withOpacity(0.75), h4, FontWeight.w600)),
              )),
          Container(
              margin: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Settings",
                    style: poppins(p4.withOpacity(0.75), h4, FontWeight.w600)),
              )),
          Container(
              margin: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("About",
                    style: poppins(p4.withOpacity(0.75), h4, FontWeight.w600)),
              )),
          InkWell(
            onTap: () {
              Usr.signout();
              if (Usr.user == null) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                final snackBar = SnackBar(
                    backgroundColor: p3,
                    content: Text(
                      'Successfully Logged Out',
                      style: poppins(p4, h2, FontWeight.w500),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Container(
                margin: EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sign Out",
                      style:
                          poppins(p4.withOpacity(0.75), h4, FontWeight.w600)),
                )),
          ),
        ],
      ),
    );
  }
}

class Stream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // Streamtitle(),
        RefreshIndicator(onRefresh: _handleRefresh, child: FeedStream())
      ],
    );
  }

  Future<void> _handleRefresh() async {
    Future.delayed(const Duration(milliseconds: 500));
  }
}

class Streamtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 10, bottom: 10),
        child: Text(
          "From your Connections",
          style: poppins(p4, h3, FontWeight.w600),
        ));
  }
}

class FeedStream extends StatefulWidget {
  @override
  _FeedStreamState createState() => _FeedStreamState();
}

class _FeedStreamState extends State<FeedStream> {
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FractionallySizedBox(
      // widthFactor: ResponsiveWidget.isSmallScreen(context) ? 0.85 : 0.75,
      widthFactor: 1,
      child: Container(
        child: ListView.builder(
            controller: _controller,
            physics:BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              if(index == 0){
                return Column(
                  children: [Container(
                      child: Divider(
                        thickness: 12,
                        color: Colors.grey.shade200,
                      )),
                    StoriesStream(),
                    Container(
                        child: Divider(
                          thickness: 12,
                          color: Colors.grey.shade200,
                        )),
                    Streamtitle(),
                    PostBox()],
                );
              }
              return PostBox();
            }),
      ),
    );
  }
}

class PostBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: p1,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundColor: p3,
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          "John Nickolson",
                          style: poppins(p4, h3, FontWeight.w600),
                        ))
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "6-9-420",
                      style: poppins(p4, h4, FontWeight.w400),
                    ))
              ],
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum commodo, erat et condimentum hendrerit, nibh dui aliquet felis, vitae blandit leo.",
                  style: poppins(p4.withOpacity(0.95), h3, FontWeight.w500),
                )),
            Container(
              constraints: BoxConstraints(maxHeight: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Image(
                filterQuality: FilterQuality.low,
                image: Image.network(
                  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                ).image,
              ),
            ),
            Container(
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
