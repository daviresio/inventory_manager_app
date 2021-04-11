import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inventory_manager/controllers/auth_controller.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';

class LoginEmailScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var emailCtl = useTextEditingController();
    var passwordCtl = useTextEditingController();

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
                  Text('Enter your e-mail address').tinyBold(),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: InventorySpacing.tiny3),
                    child: CupertinoTextField(
                      placeholder: 'Email address',
                      controller: emailCtl,
                    ),
                  ),
                  Text(
                    'Sign-up will be proceeded if a account with this e-mail don\'t exist on Simple Inventory',
                  ).tiny(),
                  SizedBox(height: InventorySpacing.medium3),
                  Text('Enter your password').tinyBold(),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: InventorySpacing.tiny3),
                    child: CupertinoTextField(
                      placeholder: 'Password',
                      obscureText: true,
                      controller: passwordCtl,
                    ),
                  ),
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
          color: InventoryColors.primaryColor,
          onPressed: () async {
            await loginOrCreateUserByMail(
              email: emailCtl.value.text,
              password: passwordCtl.value.text,
            );
            // Navigator.of(context).pop();
          },
          child: Text('Next'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
