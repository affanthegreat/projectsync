import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';


class RegisterTextField extends StatefulWidget {
  final String title;
  final TextEditingController txtController;

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();

  RegisterTextField(this.title, this.txtController);
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 120),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: poppins(p4, h2),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
              decoration: BoxDecoration(
                  color: p4.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                  style: poppins(p4,h2+ 2,FontWeight.w500),
                  controller: widget.txtController,

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
