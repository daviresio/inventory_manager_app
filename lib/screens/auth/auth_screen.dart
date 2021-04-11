import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_manager/components/inventory_ink_well.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/screens/auth/login_email_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: InventorySpacing.big3,
          horizontal: InventorySpacing.big3,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 128,
                  height: 128,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: InventorySpacing.tiny1),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        Text('SIMPLE ')
                            .bigTitleBold(color: InventoryColors.primaryColor)
                            .toSpan(),
                        Text('INVENTORY')
                            .bigTitleRegular(
                                color: InventoryColors.primaryColor)
                            .toSpan(),
                      ],
                    ),
                  ),
                ),
                Text('Convenient Inventory Managment').tinyBold(),
              ],
            ),
            Column(
              children: [
                Text('Easy Start').mediumBold(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: InventorySpacing.small3),
                  child: Row(
                    children: [],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: InventoryColors.lightColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: InventorySpacing.tiny3),
                      child: Text('or').tinyBold(),
                    ),
                    Flexible(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: InventoryColors.lightColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: InventorySpacing.small3),
                  child: InventoryInkWell(
                    onTap: () async {
                      await showCupertinoModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        builder: (_) => LoginEmailScreen(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(InventorySpacing.medium1),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            InventoryIcons.cogs,
                            size: 14,
                            color: InventoryColors.darkColor,
                          ),
                          SizedBox(width: InventorySpacing.small1),
                          Text('Start with e-mail').mediumRegular(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
