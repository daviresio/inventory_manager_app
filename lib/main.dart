import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_routes.dart';
import 'package:inventory_manager/screens/auth/auth_screen.dart';
import 'package:inventory_manager/screens/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Inventory Manager',
      theme: CupertinoThemeData(
        barBackgroundColor: Colors.grey.shade50,
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      // initialRoute: InventoryRoutes.home,
      // routes: {
      //   InventoryRoutes.home: (_) => HomePage(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case InventoryRoutes.main:
            return CupertinoPageRoute(
              builder: (_) => MainScreen(),
              settings: settings,
            );
          case InventoryRoutes.auth:
            return CupertinoPageRoute(
              builder: (_) => AuthScreen(),
              settings: settings,
            );
          case InventoryRoutes.home:
            return CupertinoPageRoute(
              builder: (_) => HomePage(),
              settings: settings,
            );
          default:
            return CupertinoPageRoute(
              builder: (_) => MainScreen(),
              settings: settings,
            );
        }
      },
    );
  }
}
