

import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';


class StoriesStream extends StatefulWidget {
  @override
  _StoriesStreamState createState() => _StoriesStreamState();
}

class _StoriesStreamState extends State<StoriesStream> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      child: Column(
        children: [
          StoryStreamtitle(),
          StoryStream()
        ],
      ),
    );
  }
}

class StoryStreamtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 10, bottom: 10),
        child: Text(
          "Stories",
          style: poppins(p4, h3, FontWeight.w600),
        ));
  }
}

class StoryStream extends StatefulWidget {
  @override
  _StoryStreamState createState() => _StoryStreamState();
}

class _StoryStreamState extends State<StoryStream> {
  ScrollController _controller =  new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }



  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 95
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            controller: _controller,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {

              return StoryView();
            }),
      ),
    );
  }
}

class StoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double r = 55;
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: r,
                minWidth: r,
              maxHeight: r,
              minHeight: r
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
          Text("John Marston",style: poppins(p4.withOpacity(0.85),h4,FontWeight.w600))
        ],
      ),
    );
  }
}
