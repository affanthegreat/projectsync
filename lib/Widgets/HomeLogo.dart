import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
      alignment: Alignment.centerLeft,
      child: Text("SYNC",style: poppins2(p3,h1 + 70),),
    );
  }
}
