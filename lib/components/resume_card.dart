import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/helper/date_helper.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ResumeCard extends StatelessWidget {
  final DateTime date1;
  final int total1;
  final int stockIn1;
  final int stockOut1;
  final DateTime date2;
  final int total2;
  final int stockIn2;
  final int stockOut2;

  ResumeCard({
    @required this.date1,
    @required this.total1,
    @required this.stockIn1,
    @required this.stockOut1,
    @required this.date2,
    @required this.total2,
    @required this.stockIn2,
    @required this.stockOut2,
  });

  final _pageController = PageController();

  Widget _values({
    @required String label,
    @required int value,
    bool hasBorder = true,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: InventorySpacing.medium2),
        decoration: BoxDecoration(
          border: hasBorder
              ? Border(
                  left: BorderSide(
                    color: InventoryColor.white.withOpacity(0.4),
                    width: 0.6,
                  ),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value.toString()).bigTitle(color: InventoryColor.white),
            SizedBox(height: InventorySpacing.small3),
            Text(label).smallBody(color: InventoryColor.white.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }

  Widget _cardContent({
    @required DateTime date,
    @required int total,
    @required int stockIn,
    @required int stockOut,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: InventorySpacing.medium2),
          child: Row(
            children: [
              Text(DateHelper.isToday(date) ? 'Today' : 'Yesterday')
                  .mediumBold(color: InventoryColor.white),
              SizedBox(width: InventorySpacing.small1),
              Text('${DateHelper.getMinthInitials(date)} ${date.day}')
                  .mediumBold(color: InventoryColor.white.withOpacity(0.5))
            ],
          ),
        ),
        SizedBox(height: InventorySpacing.medium3),
        Row(
          children: [
            _values(label: 'Total', value: total, hasBorder: false),
            _values(label: 'Stock In', value: stockIn),
            _values(label: 'Stock Out', value: stockOut),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: InventorySpacing.medium2.spacingAll(),
      padding: EdgeInsets.symmetric(vertical: InventorySpacing.medium2),
      decoration: BoxDecoration(
        color: InventoryColor.primaryColor,
        borderRadius: InventoryRadius.medium.radiusAll(),
      ),
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            children: [
              _cardContent(
                date: date1,
                total: total1,
                stockIn: stockIn1,
                stockOut: stockOut1,
              ),
              _cardContent(
                date: date2,
                total: total2,
                stockIn: stockIn2,
                stockOut: stockOut2,
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: InventorySpacing.small3,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: WormEffect(
                dotHeight: 6,
                dotWidth: 6,
                spacing: InventorySpacing.tiny2,
                dotColor: InventoryColor.white.withOpacity(0.3),
                activeDotColor: InventoryColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
