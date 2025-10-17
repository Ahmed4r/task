import 'package:flutter/material.dart';
import 'package:flutter_fastapi/screens/filter_page.dart';
import 'package:flutter_fastapi/screens/homepage.dart';
import 'package:flutter_fastapi/screens/plan_selected.dart';
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
          initialRoute: NavigationApp.routeName,
          routes: {
            Homepage.routeName: (context) => Homepage(),
            FilterPage.routeName: (context) => FilterPage(),
            PlanSelected.routeName: (context) => const PlanSelected(),
            NavigationApp.routeName: (context) => const NavigationApp(),
          },
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: Color(0xffffffff),
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: GoogleFonts.tajawal(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                height: 1.2.h,
                letterSpacing: 0,
                color: Colors.black,
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
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
