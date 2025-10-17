import 'package:flutter/material.dart';
import 'package:flutter_fastapi/screens/homepage.dart';
import 'package:flutter_fastapi/screens/plan_selected.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationApp extends StatefulWidget {
  static const String routeName = '/navigation-app';
  const NavigationApp({super.key});

  @override
  State<NavigationApp> createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    Homepage(),
    const ChatPage(),
    const AddAdsPage(),
    const MyAdsPage(),
    const PlanSelected(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() => _selectedIndex = value),
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 24,
                height: 24,
              ),
              label: 'الرئيسيه',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/chat.svg',
                width: 24,
                height: 24,
              ),
              label: 'المحادثه',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/add.svg',
                width: 24,
                height: 24,
              ),
              label: 'اضف اعلان',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/myads.svg',
                width: 24,
                height: 24,
              ),
              label: 'اعلاناتي',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}

class AddAdsPage extends StatelessWidget {
  const AddAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add Ads Page'));
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat Page'));
  }
}

class MyAdsPage extends StatelessWidget {
  const MyAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('My Ads Page'));
  }
}
