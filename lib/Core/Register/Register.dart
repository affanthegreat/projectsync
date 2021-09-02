import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Services/Responsivity.dart';
import 'RegisterTextField.dart';
import 'Registerbutton.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userCntrl = new TextEditingController();
  TextEditingController emailCntrl = new TextEditingController();
  TextEditingController passwordCntrl =  new TextEditingController();
  TextEditingController verifypasswordCntrl = new TextEditingController();



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: ResponsiveWidget.isSmallScreen(context)?Colors.grey.shade50:Colors.grey.shade100,
      body:Stack(
        children: [
          Align(
            alignment: ResponsiveWidget.isSmallScreen(context)?Alignment.topCenter:Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 500, maxWidth: 600),
              child: Container(
                margin:EdgeInsets.all(10) ,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: p1,
                  border: Border.all(color: p6,width: 2)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Logo(),
                      RegisterTextField("username", userCntrl),
                      RegisterTextField("email", emailCntrl),
                      RegisterTextField("password", passwordCntrl),
                      RegisterTextField("verify password", verifypasswordCntrl),
                      NewRegisterButton(userCntrl,emailCntrl,passwordCntrl,verifypasswordCntrl)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text("SYNC platform -version 0.1     alpha.ATG",style: poppins(p4,h4,FontWeight.w500),))
        ],
      ),
    );
  }
}
