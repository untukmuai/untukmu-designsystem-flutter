import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum HintState {
  normal,
  error,
  disabled,
}

class HintTextWidget extends StatelessWidget {
  final String hint;
  final String? suggestions;
  final HintState hintState;

  const HintTextWidget({
    super.key,
    required this.hint,
    this.suggestions,
    this.hintState = HintState.normal,
  });

  @override
  Widget build(BuildContext context) {
    return createHint();
  }

  Widget createHint() {
    if (hintState == HintState.normal) {
      if (suggestions != null) {
        return Row(
          children: [
            const Icon(
              IconsaxPlusLinear.hashtag,
              color: DLSColors.iconDisabled300,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(hint,
                style: DLSTextStyle.paragraphXSmall
                    .copyWith(color: DLSColors.textDisabled300)),
            const SizedBox(width: 4),
            Text(suggestions!,
                style: DLSTextStyle.labelXSmall
                    .copyWith(color: DLSColors.orchidPurpleDark)),
          ],
        );
      } else {
        return Row(
          children: [
            const Icon(
              Icons.info,
              color: DLSColors.iconSoft400,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(hint,
                style: DLSTextStyle.paragraphXSmall
                    .copyWith(color: DLSColors.textSub500)),
          ],
        );
      }
    } else if (hintState == HintState.error) {
      if (suggestions != null) {
        return Row(
          children: [
            const Icon(
              IconsaxPlusLinear.hashtag,
              color: DLSColors.redDark,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(hint,
                style: DLSTextStyle.paragraphXSmall
                    .copyWith(color: DLSColors.textDisabled300)),
            const SizedBox(width: 4),
            Text(suggestions!,
                style: DLSTextStyle.labelXSmall
                    .copyWith(color: DLSColors.redBase)),
          ],
        );
      } else {
        return Row(
          children: [
            const Icon(
              Icons.info,
              color: DLSColors.redDark,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(hint,
                style: DLSTextStyle.paragraphXSmall
                    .copyWith(color: DLSColors.redBase)),
          ],
        );
      }
    } else if (hintState == HintState.disabled) {
      if (suggestions != null) {
        return Row(
          children: [
            const Icon(
              IconsaxPlusLinear.hashtag,
              color: DLSColors.textDisabled300,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(hint,
                style: DLSTextStyle.paragraphXSmall
                    .copyWith(color: DLSColors.textDisabled300)),
            const SizedBox(width: 4),
            Text(suggestions!,
                style: DLSTextStyle.labelXSmall
                    .copyWith(color: DLSColors.textDisabled300)),
          ],
        );
      } else {
        return Row(
          children: [
            const Icon(
              Icons.info,
              color: DLSColors.iconDisabled300,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(hint,
                style: DLSTextStyle.paragraphXSmall
                    .copyWith(color: DLSColors.textDisabled300)),
          ],
        );
      }
    } else {
      return const Text('Hint State not found');
    }
  }
}
