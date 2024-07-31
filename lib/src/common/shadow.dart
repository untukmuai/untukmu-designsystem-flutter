import 'package:flutter/material.dart';

class DLSShadow {
  static final BoxShadow xSmallShadow = BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
    color: const Color(0xFFE4E5E7).withOpacity(0.24),
  );

  static final BoxShadow smallShadow = BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
    color: const Color(0xFF1B1C1D).withOpacity(0.04),
  );

  static final BoxShadow mediumShadow = BoxShadow(
    offset: const Offset(0, 16),
    blurRadius: 32,
    spreadRadius: -12,
    color: const Color(0xFF585C5F).withOpacity(0.1),
  );

  static final BoxShadow largeShadow = BoxShadow(
    offset: const Offset(0, 16),
    blurRadius: 40,
    spreadRadius: -8,
    color: const Color(0xFF585C5F).withOpacity(0.16),
  );

  static final BoxShadow xLargeShadow = BoxShadow(
    offset: const Offset(0, 24),
    blurRadius: 56,
    spreadRadius: -4,
    color: const Color(0xFF585C5F).withOpacity(0.16),
  );

  static final BoxShadow xxLargeShadow = BoxShadow(
    offset: const Offset(0, 40),
    blurRadius: 96,
    spreadRadius: -8,
    color: const Color(0xFF585C5F).withOpacity(0.2),
  );
}
