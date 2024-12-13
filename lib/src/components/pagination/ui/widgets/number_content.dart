import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/radius.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/model/pagination_type.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/custom_pagination_widget.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/ui/widgets/inherited_number_paginator.dart';

class NumberContent extends StatelessWidget {
  final int currentPage;

  const NumberContent({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// Buttons have an aspect ratio of 1:1. Therefore use paginator height as
        /// button width.
        var buttonWidth = constraints.maxHeight;
        var availableSpots = (constraints.maxWidth / buttonWidth).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPageButton(context, 0),
            if (_frontDotsShouldShow(context, availableSpots))
              _buildDots(context),
            if (InheritedNumberPaginator.of(context).numberPages > 1)
              ..._generateButtonList(context, availableSpots),
            if (_backDotsShouldShow(context, availableSpots))
              _buildDots(context),
            if (InheritedNumberPaginator.of(context).numberPages > 1)
              _buildPageButton(
                  context, InheritedNumberPaginator.of(context).numberPages - 1,
                  lastItem: true),
          ],
        );
      },
    );
  }

  /// Generates the variable button list which is at the center of the (optional)
  /// dots. The very last and first pages are shown independently of this list.
  List<Widget> _generateButtonList(BuildContext context, int availableSpots) {
    // if dots shown: available minus (2 for first and last pages + 2 for dots)
    var shownPages = availableSpots -
        2 -
        (_backDotsShouldShow(context, availableSpots) ? 1 : 0) -
        (_frontDotsShouldShow(context, availableSpots) ? 1 : 0);

    var numberPages = InheritedNumberPaginator.of(context).numberPages;

    int minValue, maxValue;
    minValue = max(1, currentPage - shownPages ~/ 2);
    maxValue = min(minValue + shownPages, numberPages - 1);

    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(1, numberPages - 1);
    }

    return List.generate(maxValue - minValue,
        (index) => _buildPageButton(context, minValue + index));
  }

  /// Builds a button for the given index.
  Widget _buildPageButton(BuildContext context, int index,
      {bool lastItem = false}) {
    return Container(
      margin: EdgeInsets.only(right: lastItem ? 0 : 8),
      child: CustomPaginationWidget(
        onTap: () =>
            InheritedNumberPaginator.of(context).onPageChange?.call(index),
        active: _selected(index),
        value: '${index + 1}',
      ),
    );
  }

  Widget _buildDots(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.bottomCenter,
          decoration: ShapeDecoration(
            shape: InheritedNumberPaginator.of(context).config.type ==
                    CustomPaginationType.rounded
                ? RoundedRectangleBorder(borderRadius: DLSRadius.radius8)
                : const CircleBorder(),
            color: InheritedNumberPaginator.of(context)
                .config
                .buttonUnselectedBackgroundColor,
          ),
          child: Text(
            "...",
            style: TextStyle(
              color: InheritedNumberPaginator.of(context)
                  .config
                  .buttonUnselectedForegroundColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  /// Checks if pages don't fit in available spots and dots have to be shown.
  bool _backDotsShouldShow(BuildContext context, int availableSpots) =>
      availableSpots < InheritedNumberPaginator.of(context).numberPages &&
      currentPage <
          InheritedNumberPaginator.of(context).numberPages -
              availableSpots ~/ 2;

  bool _frontDotsShouldShow(BuildContext context, int availableSpots) =>
      availableSpots < InheritedNumberPaginator.of(context).numberPages &&
      currentPage > availableSpots ~/ 2 - 1;

  /// Checks if the given index is currently selected.
  bool _selected(index) {
    return index == currentPage;
  }
}
