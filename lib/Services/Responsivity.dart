import 'package:flutter/material.dart';
import 'package:projectsync/Designs/Fonts.dart';



class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;


  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < 820;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width >= 820 &&
        MediaQuery
            .of(context)
            .size
            .width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          if(isDownScaled == true) fontScaler();
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          if(isDownScaled == true) isDownScaled = fontScaler();
          return mediumScreen ?? largeScreen;
        } else {
          if(isDownScaled == false) isDownScaled = fontDownScaler();
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
