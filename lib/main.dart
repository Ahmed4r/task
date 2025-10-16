import 'package:flutter/material.dart';
import 'package:flutter_fastapi/widgets/nav.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {

  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task App for it legend',
          home: NavigationApp(),
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: GoogleFonts.tajawal(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.h,
                letterSpacing: 0,
                color: Colors.black,
              ),
              unselectedLabelStyle: GoogleFonts.tajawal(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.2.h,
                letterSpacing: 0,
              ),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 10,
            ),
          ),
        );
      },
    );
  }
}
