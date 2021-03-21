import 'package:flutter/cupertino.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/screens/product_page.dart';
import 'package:inventory_manager/screens/resume_page.dart';

class HomePage extends StatelessWidget {
  final pages = [
    ResumePage(),
    ProductPage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(InventoryIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(InventoryIcons.box),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(InventoryIcons.in_out),
            label: 'In/Out',
          ),
          BottomNavigationBarItem(
            icon: Icon(InventoryIcons.cogs),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return pages[index];
      },
    );
  }
}
