import 'package:flutter/cupertino.dart';

class InventoryLoadingContainer extends StatelessWidget {
  final Widget child;
  final bool loading;

  const InventoryLoadingContainer({
    required this.loading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: loading ? 0.6 : 1,
            child: child,
          ),
          if (loading)
            Align(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(),
            ),
        ],
      ),
    );
  }
}
