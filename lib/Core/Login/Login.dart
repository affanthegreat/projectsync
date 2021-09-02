import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Services/AuthHandler.dart';
import 'package:projectsync/Services/Responsivity.dart';
import 'package:projectsync/Widgets/HomeLogo.dart';
import 'LoginButtons.dart';
import 'LoginTextField.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    c = context;
    return Scaffold(
      backgroundColor: ResponsiveWidget.isSmallScreen(context)?Colors.grey.shade50:Colors.grey.shade100,
      body: Stack(
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
                      Logo(),
                      LoginTextField("email", emailController),
                      LoginTextField("password", passwordController),
                      ForgetPassword(),
                      Container(
                        margin: EdgeInsets.only(left:40,right: 40,top: 60,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RegisterButton(),
                            LoginButton(emailController,passwordController),
                          ],
                        ),
                      )
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
