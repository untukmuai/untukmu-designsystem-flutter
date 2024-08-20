import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/ui/number_paginator.dart';

class CustomPaginationGroupWidget extends StatefulWidget {
  const CustomPaginationGroupWidget({
    super.key,
    required this.maxPages,
    this.currentPage,
    this.onTap,
    this.widthConstraint,
    this.activePage = 1,
  });

  final Function(int index)? onTap;
  final int activePage;

  final int maxPages;
  final int? currentPage;
  final double? widthConstraint;

  @override
  State<CustomPaginationGroupWidget> createState() =>
      _CustomPaginationGroupWidgetState();
}

class _CustomPaginationGroupWidgetState
    extends State<CustomPaginationGroupWidget> {
  late int currentPage;

  @override
  void initState() {
    currentPage = widget.currentPage ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      numberPages: widget.maxPages,
      initialPage: currentPage,
      onPageChange: (page) {
        setState(() {
          currentPage = page;
        });
      },
    );
  }
}
