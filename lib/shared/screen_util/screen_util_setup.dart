// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//A flutter plugin for adapting screen and font size.Let your UI display a reasonable layout on different screen sizes!
class ScreenUtilSetup extends StatelessWidget {

  const ScreenUtilSetup({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // ignore: deprecated_member_use
      data: MediaQueryData.fromView(WidgetsBinding.instance.window),
      child: Builder(
        builder: (BuildContext context) {
          ScreenUtil.init(
            context,
            designSize: const Size(375, 812),
          );
          return child!;
        },
      ),
    );
  }
}
