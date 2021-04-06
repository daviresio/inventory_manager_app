import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/controllers/auth_controller.dart';
import 'package:inventory_manager/screens/auth/auth_screen.dart';
import 'package:inventory_manager/screens/home_page.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var authState = useProvider(authStateProvider);
    return authState.when(
      data: (data) {
        logout();
        if (data != null) {
          return HomePage();
        }
        return AuthScreen();
      },
      loading: () => Container(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
      error: (_, __) => Container(
        child: Center(
          child: Text('erro'),
        ),
      ),
    );
  }
}
