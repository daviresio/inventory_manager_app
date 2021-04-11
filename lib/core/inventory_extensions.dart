import 'package:flutter/widgets.dart';
import 'package:inventory_manager/core/inventory_colors.dart';

extension InventoryTextExtension on Text {
  static const defaultTextColor = InventoryColors.darkColor;

  Text tiny({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 10,
        color: color,
      ),
    );
  }

  Text tinyBold({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10,
        color: color,
      ),
    );
  }

  Text small({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: color,
      ),
    );
  }

  Text smallBold({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: color,
      ),
    );
  }

  Text mediumBold({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: color,
      ),
    );
  }

  Text mediumRegular({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: color,
      ),
    );
  }

  Text bigTitleRegular({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 20,
        color: color,
      ),
    );
  }

  Text bigTitleBold({Color color = defaultTextColor}) {
    return Text(
      data!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: color,
      ),
    );
  }

  TextSpan toSpan() {
    return TextSpan(text: data, style: style);
  }
}

extension InventoryIconExtension on Icon {
  Icon defaultStyle() {
    return Icon(icon, color: InventoryColors.darkColor, size: 16);
  }
}
