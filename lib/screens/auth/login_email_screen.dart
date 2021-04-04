import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';

class LoginEmailScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InventoryColors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: InventorySpacing.small3.spacingAll(),
              margin: EdgeInsets.only(
                bottom: InventorySpacing.small3,
              ),
              child: Center(
                child: Text('Start with e-mail').mediumBold(),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: InventorySpacing.big2),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter your e-mail address').smallBold(),
                  SizedBox(height: InventorySpacing.tiny3),
                  CupertinoTextField(
                    placeholder: 'Email address',
                  ),
                  SizedBox(height: InventorySpacing.tiny3),
                  Text(
                    'Sign-up will be proceeded if a account with this e-mail don\'t exist on Simple Inventory',
                  ).small(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        margin: InventorySpacing.medium2.spacingHorizontal(),
        child: CupertinoButton(
          child: Text('Next'),
          color: InventoryColors.primaryColor,
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
