import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';

class LoginTextField extends StatefulWidget {
  final String title;
  final TextEditingController txtController;

  LoginTextField(this.title, this.txtController);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 130),
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
                  style: poppins(p4,h2 + 2,FontWeight.w500),
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

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
      alignment: Alignment.centerLeft,
        child: Text(
      "Forget your password?",
      style: poppins(p3, h2, FontWeight.w500),
    ));
  }
}
