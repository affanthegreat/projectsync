import 'package:flutter/material.dart';
import 'package:projectsync/Core/SecuredMessages/SMui.dart' deferred as SMui;
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Services/Responsivity.dart';

class FeedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1080),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Center(
                child: Text(
                  "SYNC",
                  style: poppins(p4, h1 + 10, FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveWidget.isSmallScreen(context)
                      ? IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: Icon(
                            Icons.search,
                            color: p4,
                          ))
                      : Container(
                          height: h1 + 10,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.3,color: p3)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  width: 357,
                                  child: TextField(

                                  )),
                              IconButton(
                                  onPressed: () async {

                                  },
                                  iconSize: 20,
                                  icon: Icon(
                                    Icons.search,
                                    color: p4,
                                  )),
                            ],
                          ),
                        ),
                  IconButton(
                      onPressed: () async {
                        await SMui.loadLibrary();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SMui.SecuredMessagingUI()));
                      },
                      iconSize: 30,
                      icon: Icon(
                        Icons.messenger_rounded,
                        color: p4,
                      )),
                  Visibility(
                      maintainSemantics: false,
                      maintainSize: false,
                      visible: ResponsiveWidget.isSmallScreen(context),
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
