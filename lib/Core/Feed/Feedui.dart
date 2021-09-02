import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';
import 'package:projectsync/Core/Feed/FeedNewPost.dart';
import 'package:projectsync/Core/Feed/FeedStream.dart' deferred as Stream;
import 'package:projectsync/Designs/Colors.dart';
import 'package:projectsync/Designs/Fonts.dart';
import 'package:projectsync/Services/Responsivity.dart';
import 'FeedAppBar.dart';
import 'package:projectsync/Core/SecuredMessages/SMui.dart' deferred as SMui;

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

bool isVisible = true;

class _FeedState extends State<Feed> {
  bool loading = true;
  String pageId = 'Home';

  _libraryLoader() async {
    await Stream.loadLibrary();
    await SMui.loadLibrary();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _libraryLoader();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Widget feedBottom() {
      if (ResponsiveWidget.isSmallScreen(context)) {
        return Stream.Stream();
      } else {
        return Stream.StreamWithStories();
      }
    }

    Widget FlexibleAppBar() {
      return SliverAppBar(
        expandedHeight: 90,
        primary: true,
        forceElevated: false,
        shadowColor: Colors.white,
        backgroundColor: Colors.grey.shade50,
        title: Text(
          "SYNC",
          style: poppins(p4, h1 + 10, FontWeight.w700),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: BoxDecoration(color: Colors.grey.shade100),
          ),
        ),
      );
    }

    Widget appDrawer() {
      return FractionallySizedBox(
        widthFactor: 0.5,
        child: Container(
          color: p1,
          child: Stream.Settings(),
        ),
      );
    }

    Widget messages() {
      SMui.loadLibrary();
      return SMui.SecuredMessagingUI();
    }


    if (ResponsiveWidget.isSmallScreen(context)) {
      return Scaffold(
        extendBody: true,
        body: Builder(builder: (context) {
          switch (pageId) {
            case 'Home':
              print("home in");
              return SingleChildScrollView(
                child: !loading ? feedBottom() : CupertinoActivityIndicator(),
              );
            case 'Messages':
              print("messeges in");
              return messages();
            case 'Search':
              print("search in");
              return Container();
            case 'Settings':
              print('settings in');
              return Stream.Settings();
            default:
              return Container();
          }
        }),
        bottomNavigationBar: PandaBar(
          backgroundColor: Colors.white,
          buttonData: [
            PandaBarButtonData(id: 'Home', icon: Icons.home, title: 'Home'),
            PandaBarButtonData(
                id: 'Messages', icon: Icons.messenger, title: 'Messages'),
            PandaBarButtonData(
                id: 'Search', icon: Icons.search, title: 'Search'),
            PandaBarButtonData(
                id: 'Settings', icon: Icons.settings, title: 'Settings'),
          ],
          onChange: (id) {
            setState(() {
              pageId = id;
            });
            print(pageId);
          },
          onFabButtonPressed: () {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return Material(child: FeedNewPost());
                });
          },
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawerEnableOpenDragGesture: false,
        drawer: appDrawer(),
        appBar: null,
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: height, maxWidth: 1080, minWidth: 344),
            child: Container(
              color: p1,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(children: [
                  ResponsiveWidget.isSmallScreen(context) == false
                      ? FeedAppBar()
                      : Container(),
                  !loading ? feedBottom() : CupertinoActivityIndicator(),
                ]),
              ),
            ),
          ),
        ),
      );
    }
  }
}
