import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

/// Holds all the relevant information for the configuration of how the
/// [NumberPaginator] should look like.
class NumberPaginatorUIConfig {
  /// The shape of the [PaginatorButton]s.
  final CustomPaginationType? type;

  /// The [PaginatorButton]'s foreground color (text/icon color) when selected.
  ///
  /// Defaults to [Colors.white].
  final Color? buttonSelectedForegroundColor;

  /// The [PaginatorButton]'s foreground color (text/icon color) when unselected.
  ///
  /// Defaults to DLSColors.textSub500.
  final Color buttonUnselectedForegroundColor;

  /// The [PaginatorButton]'s background color when selected.
  ///
  /// Defaults to the [Theme]'s accent color.
  final Color? buttonSelectedBackgroundColor;

  /// The [PaginatorButton]'s background color when unselected.
  ///
  /// Defaults to `null`.
  final Color? buttonUnselectedBackgroundColor;

  /// The [MainAxisAlignment] of the [Row] that holds the prev/next buttons and
  /// the page number buttons. This property only takes effect [mode] is set to
  /// [ContentDisplayMode.hidden].
  ///
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// The [EdgeInsets] that should be used as padding for the number paginator's
  /// content.
  final EdgeInsets? contentPadding;

  /// The [TextStyle] that should be used for the [PaginatorButton]'s text.
  /// This property only takes effect if [mode] is set to
  /// [ContentDisplayMode.numbers].
  /// The color of the text is determined by [buttonSelectedForegroundColor] and
  /// [buttonUnselectedForegroundColor].
  final TextStyle? buttonTextStyle;

  /// The [Padding] that should be used for the [PaginatorButton]'s content.
  final EdgeInsetsGeometry? buttonPadding;

  const NumberPaginatorUIConfig({
    this.type,
    this.buttonSelectedForegroundColor,
    this.buttonUnselectedForegroundColor = DLSColors.textSub500,
    this.buttonSelectedBackgroundColor,
    this.buttonUnselectedBackgroundColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.contentPadding,
    this.buttonTextStyle,
    this.buttonPadding,
  });
}
