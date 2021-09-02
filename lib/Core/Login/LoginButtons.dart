import 'package:flutter/material.dart';
import 'package:projectsync/Services/AuthHandler.dart';
import 'package:projectsync/Services/HiveHandler.dart';
import 'package:projectsync/Services/Responsivity.dart';
import '../Feed/Feedui.dart';
import '../Register/Register.dart' deferred as reg;
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
class LoginButton extends StatelessWidget {
  final TextEditingController e;
  final TextEditingController p;

  LoginButton(this.e, this.p);

  @override
  Widget build(BuildContext context) {




    void auth() async {
      try {
        Usr.user = (await Usr.auth
                .signInWithEmailAndPassword(email: e.text, password: p.text))
            .user;
        if (Usr.user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResponsiveWidget(largeScreen: Feed())));
          await HiveHandler().loginSaver(e.text,Usr.user!.uid.toString());
          final snackBar = SnackBar(backgroundColor: p3, content: Text("Welcome ${Usr.user!.displayName}!", style: poppins(p4, h2, FontWeight.w500),));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        }
      } catch (e) {
        String s = e.toString().split("]")[1];
        final snackBar = SnackBar(
            backgroundColor: p3,
            content: Text(
              s,
              style: poppins(p4, h2, FontWeight.w500),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return InkWell(
      onTap: () async {
        auth();
      },
      child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 100, minHeight: 60),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: p3),
            child: Center(
              child: Text(
                "Login",
                style: poppins(p1, h2),
              ),
            ),
          )),
    );
  }
}

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool smallScreen = width > 400;
    return InkWell(
      onTap: () async {
        await reg.loadLibrary();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => reg.Register()));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 70, minHeight: 60),
        child: Container(
          child: Center(
            child: Text(
              "New user?\nLet’s go to here.",
              style: poppins(p4, smallScreen ? h2 : h3),
            ),
          ),
        ),
      ),
    );
  }
}
