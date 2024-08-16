import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

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
    currentPage = widget.activePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth =
        MediaQuery.of(context).size.width - (widget.widthConstraint ?? 32);
    double prefixWidth = deviceWidth * 0.325 - DLSSizing.s3xSmall;
    double suffixWidth = deviceWidth * 0.325 - DLSSizing.s3xSmall;
    double contentWidth = deviceWidth * 0.35;

    bool isCollapsed = deviceWidth < 640;

    if (isCollapsed) {
      contentWidth = deviceWidth * 0.5;
      prefixWidth = deviceWidth * 0.25;
      suffixWidth = deviceWidth * 0.25;
    }

    int maxItems = ((contentWidth / 34)).floor();
    maxItems =
        ((contentWidth - DLSSizing.s3xSmall * (maxItems - 1)) / 34).floor();
    bool ellipsisable = widget.maxPages > maxItems;

    bool isPrevActive = (currentPage - 1) > 0;
    bool isNextActive = currentPage < widget.maxPages;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: prefixWidth,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              if (!isCollapsed)
                Container(
                  width: prefixWidth * 0.5 - (DLSSizing.s3xSmall / 2),
                  padding: const EdgeInsets.all(DLSSizing.s4xSmall),
                  child: Text(
                    'Page $currentPage of ${widget.maxPages}',
                    style: DLSTextStyle.labelMedium,
                  ),
                ),
              Visibility(
                visible: isPrevActive,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentPage = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(DLSSizing.s4xSmall),
                          constraints:
                              const BoxConstraints(minHeight: 34, minWidth: 34),
                          child: SvgPicture.asset(
                              "packages/untukmu_flutter_design_system/assets/icons/arrow-left-double-line.svg"),
                        ),
                      ),
                      const SizedBox(width: DLSSizing.s3xSmall),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentPage--;
                          });
                        },
                        child: Container(
                          constraints:
                              const BoxConstraints(minHeight: 34, minWidth: 34),
                          child: const Icon(
                            Iconsax.arrow_left_2,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: contentWidth,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  ellipsisable ? maxItems : widget.maxPages,
                  (index) {
                    bool isActive = (index + 1) == currentPage;
                    bool lastItem = index ==
                        ((ellipsisable ? maxItems : widget.maxPages) - 1);
                    bool ellipsisItem = index == (maxItems - 2);

                    return Container(
                      margin: lastItem
                          ? null
                          : const EdgeInsets.only(right: DLSSizing.s3xSmall),
                      child: CustomPaginationWidget(
                        active: isActive,
                        onTap: widget.onTap == null
                            ? null
                            : () => widget.onTap!(index),
                        value: ellipsisable && ellipsisItem
                            ? '...'
                            : lastItem
                                ? widget.maxPages.toString()
                                : (index + 1).toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: suffixWidth,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Visibility(
                  visible: isNextActive,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentPage++;
                          });
                        },
                        borderRadius: DLSRadius.radius8,
                        child: Container(
                          constraints:
                              const BoxConstraints(minHeight: 34, minWidth: 34),
                          child: const Icon(
                            Iconsax.arrow_right_3,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: DLSSizing.s3xSmall),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentPage = widget.maxPages;
                          });
                        },
                        borderRadius: DLSRadius.radius8,
                        child: Container(
                          padding: const EdgeInsets.all(DLSSizing.s4xSmall),
                          constraints:
                              const BoxConstraints(minHeight: 34, minWidth: 34),
                          child: SvgPicture.asset(
                              "packages/untukmu_flutter_design_system/assets/icons/arrow-right-double-line.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pageDropdown(isCollapsed),
            ],
          ),
        ),
      ],
    );
  }

  Widget pageDropdown(bool isCollapsed) {
    if (isCollapsed) {
      return const SizedBox();
    }

    return CompactDropdownWidget(
      selectedValue: '$currentPage',
      suffix: '/ page',
      valueAlignment: Alignment.center,
      items: List.generate(
        widget.maxPages,
        (index) {
          String page = '${(index + 1)}';
          return page;
        },
      ),
      filled: true,
      fillColor: DLSColors.bgWhite0,
    );
  }
}
