import 'package:flutter/material.dart';

import '../../../common/textfield/utils/colors.dart';
import '../../../videopage.dart';
import '../screens/ProfilePageScreen.dart';

class NavWidets extends StatefulWidget {
  const NavWidets({super.key});

  @override
  State<NavWidets> createState() => _NavWidetsState();
}

class _NavWidetsState extends State<NavWidets> {
  int _selectedicon = 0;
  final _screens = [
    VideoPage(),
    const Scaffold(
        body: Center(
      child: Text("Fav"),
    )),
    ProfilePageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedicon != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.mainblackColor,
          currentIndex: _selectedicon,
          onTap: (i) => setState(() => _selectedicon = i),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
                activeIcon: Icon(Icons.favorite),
                label: "Fav"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                activeIcon: Icon(Icons.person),
                label: "Profile"),
          ]),
    );
  }
}
