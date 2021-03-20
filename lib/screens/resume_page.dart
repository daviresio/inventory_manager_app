import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/inventory_card.dart';
import 'package:inventory_manager/components/inventory_divider.dart';
import 'package:inventory_manager/components/inventory_ui.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:inventory_manager/components/resume_card.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Container(
              height: 40,
              padding: EdgeInsets.only(left: InventorySpacing.small1),
              child: Text('Home'),
            ),
            border: null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    InventoryIcons.plus,
                    color: InventoryColor.darkColor,
                    size: 18,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: InventorySpacing.small3),
                GestureDetector(
                  child: Icon(
                    InventoryIcons.bell,
                    color: InventoryColor.darkColor,
                    size: 18,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ResumeCard(
                date1: DateTime.now(),
                total1: 19,
                stockIn1: 0,
                stockOut1: 0,
                date2: DateTime.now().subtract(Duration(days: 1)),
                total2: 19,
                stockIn2: 0,
                stockOut2: 0,
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: InventorySpacing.medium2),
                child: InventoryCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            InventoryIcons.search,
                            color: InventoryColor.mediumColor,
                            size: 16,
                          ),
                          SizedBox(width: InventorySpacing.small1),
                          Text('Search product').mediumRegular(
                            color: InventoryColor.mediumColor,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            child: InventoryDivider.vertical(
                              color: InventoryColor.mediumColor,
                              width: 0.5,
                              margin: EdgeInsets.only(
                                right: InventorySpacing.small3,
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                              InventoryIcons.barcode_read,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: InventorySpacing.medium2.spacingAll(),
                child: InventoryCard(
                  title: 'Add Product',
                  child: Column(
                    children: [
                      _itemRow(
                        icon: InventoryIcons.plus,
                        title: 'Register new items',
                        onTap: () {},
                      ),
                      _itemRow(
                        icon: InventoryIcons.file_csv,
                        iconColor: Colors.green,
                        title: 'Register by Excel file',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: InventorySpacing.medium2.spacingHorizontal(),
                child: InventoryCard(
                  title: 'Stock In/Out',
                  child: Column(
                    children: [
                      _itemRow(
                        icon: InventoryIcons.level_down_alt,
                        title: 'Stock In',
                        onTap: () {},
                      ),
                      _itemRow(
                        icon: InventoryIcons.level_up_alt,
                        iconColor: Colors.redAccent,
                        title: 'Stock Out',
                        onTap: () {},
                      ),
                      _itemRow(
                        icon: InventoryIcons.in_out,
                        iconColor: Colors.green,
                        title: 'Audit',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: InventorySpacing.medium2.spacingAll(),
                child: InventoryCard(
                  title: 'Low stock reminder',
                  child: Column(
                    children: [
                      _itemRow(
                        icon: InventoryIcons.tachometer_alt_slowest,
                        iconColor: Colors.redAccent,
                        title: 'Check stock shortage',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: InventorySpacing.medium2.spacingHorizontal(),
                child: InventoryCard(
                  title: 'Inventory Count',
                  child: Column(
                    children: [
                      _itemRow(
                        icon: InventoryIcons.barcode_read,
                        title: 'Scan and check quantities',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: InventorySpacing.medium2.spacingAll(),
                child: InventoryCard(
                  title: 'Add member',
                  child: Column(
                    children: [
                      _itemRow(
                        icon: InventoryIcons.user_plus,
                        title: 'Invite team members',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: InventorySpacing.medium2
                    .spacingHorizontal()
                    .and(bottom: InventorySpacing.medium2),
                child: InventoryCard(
                  title: 'Dashboard',
                  child: Column(
                    children: [
                      _itemRow(
                        icon: InventoryIcons.chart_line,
                        title: 'Analyze inventory status',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _itemRow({
    @required IconData icon,
    @required String title,
    @required onTap,
    Color iconColor = InventoryColor.primaryColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: InventorySpacing.small1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: iconColor),
              SizedBox(width: InventorySpacing.small3),
              Text(title).mediumRegular()
            ],
          ),
          Icon(
            InventoryIcons.angle_right,
            size: 16,
            color: InventoryColor.darkColor,
          ),
        ],
      ),
    );
  }
}
