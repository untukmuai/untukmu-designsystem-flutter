import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

enum PasswordStrengthState {
  unfilled,
  weak,
  moderate,
  strong,
}

class PasswordCheckerWidget extends StatefulWidget {
  final String password;
  final String unfilledMessage;
  final String weakMessage;
  final String moderateMessage;
  final String strongMessage;
  final String uppercaseRequirement;
  final String numberRequirement;
  final String lengthRequirement;

  const PasswordCheckerWidget({
    super.key,
    required this.password,
    this.unfilledMessage = 'Must contain at least;',
    this.weakMessage = 'Weak password. Must contain at least;',
    this.moderateMessage = 'Moderate password. Must contain at least;',
    this.strongMessage = 'Strong password. Your password is secure.',
    this.uppercaseRequirement = 'At least 1 uppercase',
    this.numberRequirement = 'At least 1 number',
    this.lengthRequirement = 'At least 8 characters',
  });

  @override
  PasswordCheckerWidgetState createState() => PasswordCheckerWidgetState();
}

class PasswordCheckerWidgetState extends State<PasswordCheckerWidget> {
  bool hasUppercase = false;
  bool hasDigits = false;
  bool hasMinLength = false;
  PasswordStrengthState passwordStrength = PasswordStrengthState.unfilled;

  @override
  void didUpdateWidget(PasswordCheckerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _checkPassword(widget.password);
  }

  void _checkPassword(String password) {
    setState(() {
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasDigits = password.contains(RegExp(r'\d'));
      hasMinLength = password.length >= 8;

      if (password.isEmpty) {
        passwordStrength = PasswordStrengthState.unfilled;
      } else if (hasUppercase && hasDigits && hasMinLength) {
        passwordStrength = PasswordStrengthState.strong;
      } else if (hasUppercase && (hasDigits || hasMinLength)) {
        passwordStrength = PasswordStrengthState.moderate;
      } else if (hasUppercase || hasDigits || hasMinLength) {
        passwordStrength = PasswordStrengthState.weak;
      } else {
        passwordStrength = PasswordStrengthState.weak;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPasswordStrengthIndicator(),
        const SizedBox(height: 10),
        _buildRequirementRow(
            widget.uppercaseRequirement, passwordStrength, hasUppercase),
        _buildRequirementRow(
            widget.numberRequirement, passwordStrength, hasDigits),
        _buildRequirementRow(
            widget.lengthRequirement, passwordStrength, hasMinLength),
      ],
    );
  }

  Widget _buildPasswordStrengthIndicator() {
    String text;
    Color color;
    int strengthLevel;

    switch (passwordStrength) {
      case PasswordStrengthState.strong:
        text = widget.strongMessage;
        color = DLSColors.successBase;
        strengthLevel = 3;
        break;
      case PasswordStrengthState.moderate:
        text = widget.moderateMessage;
        color = DLSColors.warningBase;
        strengthLevel = 2;
        break;
      case PasswordStrengthState.weak:
        text = widget.weakMessage;
        color = DLSColors.errorBase;
        strengthLevel = 1;
        break;
      case PasswordStrengthState.unfilled:
      default:
        text = widget.unfilledMessage;
        color = DLSColors.textSub500;
        strengthLevel = 0;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (index) {
            return Expanded(
              child: Container(
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: index < strengthLevel ? color : DLSColors.bgSoft200,
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style:
              DLSTextStyle.paragraphSmall.copyWith(color: DLSColors.iconSub500),
        ),
      ],
    );
  }

  Widget _buildRequirementRow(
      String text, PasswordStrengthState state, bool met) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            met || state == PasswordStrengthState.unfilled
                ? Icons.check_circle
                : Icons.cancel,
            size: 16,
            color: state == PasswordStrengthState.unfilled
                ? DLSColors.iconDisabled300
                : met
                    ? DLSColors.successBase
                    : DLSColors.iconSoft400,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: DLSTextStyle.paragraphSmall.copyWith(
              color: state == PasswordStrengthState.unfilled
                  ? DLSColors.textSoft400
                  : met
                      ? DLSColors.textSub500
                      : DLSColors.textSub500,
            ),
          ),
        ],
      ),
    );
  }
}
