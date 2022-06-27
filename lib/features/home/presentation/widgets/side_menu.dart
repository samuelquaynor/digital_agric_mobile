import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo.png'),
          ),
          DrawerListTile(
            title: 'Dashboard',
            svgSrc: 'assets/svg/menu_dashbord.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Transaction',
            svgSrc: 'assets/svg/menu_tran.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Task',
            svgSrc: 'assets/svg/menu_task.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Documents',
            svgSrc: 'assets/svg/menu_doc.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Store',
            svgSrc: 'assets/svg/menu_store.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Notification',
            svgSrc: 'assets/svg/menu_notification.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Profile',
            svgSrc: 'assets/svg/menu_profile.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Settings',
            svgSrc: 'assets/svg/menu_setting.svg',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
