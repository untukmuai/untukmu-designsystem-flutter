import 'package:flutter/material.dart';

class DLSShadow {
  static const BoxShadow radioShadow = BoxShadow(
    blurRadius: 2,
    offset: Offset(0, 2),
    spreadRadius: 0,
    color: Color(0x1B1C1D1F),
  );

  static const BoxShadow radioDotActive = BoxShadow(
    blurRadius: 3,
    offset: Offset(0, -2),
    spreadRadius: 0,
    color: Color(0x1BCFD1D3),
  );

  static final BoxShadow xSmallShadow = BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
    color: const Color(0xFFE4E5E7).withValues(alpha: 0.24),
  );

  static final BoxShadow smallShadow = BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF1B1C1D).withValues(alpha: 0.04),
  );

  static final BoxShadow mediumShadow = BoxShadow(
    offset: const Offset(0, 16),
    blurRadius: 32,
    spreadRadius: -12,
    color: const Color(0xFF585C5F).withValues(alpha: 0.1),
  );

  static final BoxShadow largeShadow = BoxShadow(
    offset: const Offset(0, 16),
    blurRadius: 40,
    spreadRadius: -8,
    color: const Color(0xFF585C5F).withValues(alpha: 0.16),
  );

  static final BoxShadow xLargeShadow = BoxShadow(
    offset: const Offset(0, 24),
    blurRadius: 56,
    spreadRadius: -4,
    color: const Color(0xFF585C5F).withValues(alpha: 0.16),
  );

  static final BoxShadow xxLargeShadow = BoxShadow(
    offset: const Offset(0, 40),
    blurRadius: 96,
    spreadRadius: -8,
    color: const Color(0xFF585C5F).withValues(alpha: 0.2),
  );
}
