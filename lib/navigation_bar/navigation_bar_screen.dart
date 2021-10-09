import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/home/home_page.dart';
import 'package:moretech_app/notifications/notifications_page.dart';
import 'package:moretech_app/other/other_page.dart';
import 'package:moretech_app/profile/profile_page.dart';

class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({Key? key}) : super(key: key);

  final _screens = [
    HomePage(),
    NotificationsPage(),
    ProfilePage(),
    OtherPage()
  ];

  final _selectedIndexNotifier = ValueNotifier<int>(2);

  // Лямбда установления цвета для иконок nav bar'a
  Color _setColor(bool predicate) => predicate ? blue50 : pureWhite;
  Widget _formatIcon({required String path, required bool predicate}) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: SvgPicture.asset(path, color: _setColor(predicate)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndexNotifier,
      builder: (_, val, __) => Scaffold(
        body: _screens.elementAt(val),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: val,
          backgroundColor: blue100,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: blue50,
          unselectedItemColor: pureWhite,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          onTap: (int index) => _selectedIndexNotifier.value = index,
          items: [
            BottomNavigationBarItem(
                icon: _formatIcon(
                    path: "lib/assets/icons/ico_ home (fill).svg",
                    predicate: val == 0),
                label: "главная"),
            BottomNavigationBarItem(
                icon: _formatIcon(
                    path: "lib/assets/icons/ico_ notifications (fill).svg",
                    predicate: val == 1),
                label: "уведомления"),
            BottomNavigationBarItem(
                icon: _formatIcon(
                    path: "lib/assets/icons/ico_ man (fill).svg",
                    predicate: val == 2),
                label: "профиль"),
            BottomNavigationBarItem(
                icon: _formatIcon(
                    path: "lib/assets/icons/ico_ kebab (fill).svg",
                    predicate: val == 3),
                label: "прочее"),
          ],
        ),
      ),
    );
  }
}
