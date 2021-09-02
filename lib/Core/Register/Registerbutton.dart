import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectsync/Core/Feed/Feedui.dart';
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Models/User.dart';
import 'package:projectsync/Services/AuthHandler.dart';
import 'package:projectsync/Services/HiveHandler.dart';
import 'package:projectsync/Services/Responsivity.dart';

class NewRegisterButton extends StatelessWidget {
  final TextEditingController u;
  final TextEditingController e;
  final TextEditingController p;
  final TextEditingController vp;

  NewRegisterButton(this.u, this.e, this.p, this.vp);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool smallScreen = width > 400;
    return Container(
      margin: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
      child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 60),
          child: InkWell(
            onTap: () async {
              SyncUser currentUser =
              new SyncUser(u.text, e.text, Usr.user!.uid);
              print(currentUser.uid);

              final usersCollection =
              FirebaseFirestore.instance.collection('users');
              await usersCollection.add({
                'username': currentUser.username,
                'email': currentUser.email,
                'uid': currentUser.uid
              });

              if (p.text != vp.text) {
                final snackBar = SnackBar(
                    backgroundColor: p3,
                    content: Text(
                      'Both Passwords do not match. Check Again',
                      style: poppins(p4, h2, FontWeight.w500),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                var isRegistered = Usr.register(e.text, p.text);
                if (isRegistered == true) {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResponsiveWidget(largeScreen: Feed())));
                  await HiveHandler().loginSaver(e.text,Usr.user!.uid);


                  final snackBar = SnackBar(
                      backgroundColor: p3,
                      content: Text(
                        "Welcome ${Usr.user!.displayName}!",
                        style: poppins(p4, h2, FontWeight.w500),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  final snackBar2 = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Successfully created a account.',
                        style: poppins(p2, h2, FontWeight.w500),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                } else {
                  final snackBar = SnackBar(
                      backgroundColor: p3,
                      content: Text(
                        Usr.e.toString(),
                        style: poppins(p4, h2, FontWeight.w500),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: p2),
              child: Center(
                child: Text(
                  "Create a new account",
                  style: poppins(p4, smallScreen ? h1 : h2, FontWeight.w700),
                ),
              ),
            ),
          )),
    );
  }
}
