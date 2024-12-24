import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/sizing.dart';
import 'package:untukmu_flutter_design_system/src/components/dropdown/dropdown.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/model/config.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/pagination.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/ui/number_paginator_controller.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/ui/widgets/inherited_number_paginator.dart';
import 'package:untukmu_flutter_design_system/src/components/pagination/ui/widgets/number_content.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

typedef NumberPaginatorContentBuilder = Widget Function(int index);

/// The main widget used for creating a [NumberPaginator].
class NumberPaginator extends StatefulWidget {
  /// Total number of pages that should be shown.
  final int numberPages;

  /// Index of initially selected page.
  final int initialPage;

  /// This function is called when the user switches between pages. The received
  /// parameter indicates the selected index, starting from 0.
  final Function(int)? onPageChange;

  /// The UI config for the [NumberPaginator].
  final NumberPaginatorUIConfig config;

  /// A builder for the central content of the paginator. If provided, the
  /// [config] is ignored.
  final NumberPaginatorContentBuilder? contentBuilder;

  /// The controller for the paginator. Can be used to control the paginator from the outside.
  /// If not provided, a new controller is created.
  final NumberPaginatorController? controller;

  /// Whether the "prev" button should be shown.
  ///
  /// Defaults to `true`.
  final bool showPrevButton;

  /// Whether the "next" button should be shown.
  ///
  /// Defaults to `true`.
  final bool showNextButton;

  /// Content of the "previous" button which when pressed goes one page back.
  final IconData? prevButtonIcon;

  /// Content of the "next" button which when pressed goes one page forward.
  final IconData? nextButtonIcon;

  /// Content of the "first" button which when pressed goes to first page.
  final IconData? firstPageButtonIcon;

  /// Content of the "last" button which when pressed goes to last page.
  final IconData? lastPageButtonIcon;

  // Width constraint
  final double? widthConstraint;

  /// Creates an instance of [NumberPaginator].
  const NumberPaginator({
    super.key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.config = const NumberPaginatorUIConfig(),
    this.contentBuilder,
    this.controller,
    this.showPrevButton = true,
    this.showNextButton = true,
    this.prevButtonIcon = Icons.chevron_left,
    this.nextButtonIcon = Icons.chevron_right,
    this.firstPageButtonIcon = Icons.keyboard_double_arrow_left_rounded,
    this.lastPageButtonIcon = Icons.keyboard_double_arrow_right_rounded,
    this.widthConstraint,
  })  : assert(initialPage >= 0),
        assert(initialPage <= numberPages - 1);

  const NumberPaginator.noPrevNextButtons({
    super.key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.config = const NumberPaginatorUIConfig(),
    this.contentBuilder,
    this.controller,
    this.widthConstraint,
  })  : showPrevButton = false,
        showNextButton = false,
        prevButtonIcon = null,
        nextButtonIcon = null,
        firstPageButtonIcon = null,
        lastPageButtonIcon = null,
        assert(initialPage >= 0),
        assert(initialPage <= numberPages - 1);

  @override
  NumberPaginatorState createState() => NumberPaginatorState();
}

class NumberPaginatorState extends State<NumberPaginator> {
  late NumberPaginatorController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? NumberPaginatorController();
    _controller.currentPage = widget.initialPage;
  }

  void _handlePageChange(int page) {
    if (widget.onPageChange != null && page != _controller.currentPage) {
      widget.onPageChange!(page);
    }
    _controller.currentPage = page;
  }

  @override
  Widget build(BuildContext context) {
    var width = widget.widthConstraint ?? MediaQuery.of(context).size.width;
    bool isCollapsed = width < 640;

    return InheritedNumberPaginator(
      numberPages: widget.numberPages,
      initialPage: widget.initialPage,
      onPageChange: _handlePageChange,
      config: widget.config,
      child: SizedBox(
        width: width,
        height: 48,
        child: Row(
          mainAxisAlignment: widget.config.mainAxisAlignment,
          children: [
            pageIndicator(isCollapsed: isCollapsed),
            const SizedBox(width: DLSSizing.s2xSmall),
            CustomPaginationWidget(
              onTap: _controller.currentPage > 0
                  ? () => _handlePageChange(0)
                  : null,
              icon: widget.firstPageButtonIcon,
              iconSize: 16,
              isArrow: true,
            ),
            CustomPaginationWidget(
              onTap: _controller.currentPage > 0
                  ? () => _handlePageChange(_controller.currentPage - 1)
                  : null,
              icon: widget.prevButtonIcon,
              isArrow: true,
            ),
            _buildCenterContent(),
            CustomPaginationWidget(
              onTap: _controller.currentPage < widget.numberPages - 1
                  ? () => _handlePageChange(_controller.currentPage + 1)
                  : null,
              icon: widget.nextButtonIcon,
              isArrow: true,
            ),
            CustomPaginationWidget(
              onTap: _controller.currentPage < widget.numberPages - 1
                  ? () => _handlePageChange(widget.numberPages - 1)
                  : null,
              icon: widget.lastPageButtonIcon,
              iconSize: 16,
              isArrow: true,
            ),
            const SizedBox(width: DLSSizing.s2xSmall),
            pageDropdown(isCollapsed: isCollapsed),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterContent() {
    return Expanded(
      child: Container(
        padding: widget.config.contentPadding,
        child: NumberContent(
          currentPage: _controller.currentPage,
        ),
      ),
    );
  }

  Widget pageIndicator({bool isCollapsed = false}) {
    if (isCollapsed) {
      return const SizedBox();
    }

    return Text(
      'Page ${(_controller.currentPage + 1)} of ${widget.numberPages}',
      style: DLSTextStyle.labelMedium.copyWith(color: DLSColors.textSub500),
    );
  }

  Widget pageDropdown({bool isCollapsed = false}) {
    if (isCollapsed) {
      return const SizedBox();
    }

    return CompactDropdownWidget(
      selectedValue: '${(_controller.currentPage + 1)}',
      suffix: '/ page',
      valueAlignment: Alignment.center,
      items: List.generate(
        widget.numberPages,
        (index) {
          String page = '${(index + 1)}';
          return page;
        },
      ),
      filled: true,
      fillColor: DLSColors.bgWhite0,
      onChanged: (value) {
        if (value != null) {
          _handlePageChange(int.parse(value) - 1);
        }
      },
    );
  }
}
