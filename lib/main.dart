import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show Directory, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:projectsync/Core/SecuredMessages/SMui.dart';
import 'package:projectsync/Services/Responsivity.dart';

import 'Core/Feed/Feedui.dart';
import 'Core/Login/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // debugRepaintRainbowEnabled = true;
  if(kIsWeb){
    runApp(Main());
  }
  else if (Platform.isAndroid || Platform.isIOS) {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    runApp(Main());
  }
}



class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      home: ResponsiveWidget(largeScreen: SecuredMessagingUI(),),
    );
  }
}
