import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class TextStyleExamplePage extends StatefulWidget {
  const TextStyleExamplePage({super.key});

  @override
  State<TextStyleExamplePage> createState() => _TextStyleExamplePageState();
}

class _TextStyleExamplePageState extends State<TextStyleExamplePage> {
  static const titleText = 'The quick brown fox jumps over the lazy dog.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Text Style'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TEXT STYLE',
                style: DLSTextStyle.display1
                    .copyWith(color: DLSColors.primaryBase)),
            const SizedBox(height: 16),
            Text('DISPLAY',
                style: DLSTextStyle.display1
                    .copyWith(color: DLSColors.secondaryBase)),
            const SizedBox(height: 12),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.display1,
            ),
            const SizedBox(height: 8),
            Text(
              titleText,
              style: DLSTextStyle.display2,
            ),
            const SizedBox(height: 16),
            Text('TITLE',
                style: DLSTextStyle.titleH1
                    .copyWith(color: DLSColors.secondaryBase)),
            const SizedBox(height: 12),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.titleH1,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.titleH2,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.titleH3,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.titleH4,
            ),
            const SizedBox(height: 16),
            Text('LABEL',
                style: DLSTextStyle.labelLarge
                    .copyWith(color: DLSColors.secondaryBase)),
            const SizedBox(height: 12),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.labelLarge,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.labelMedium,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.labelSmall,
            ),
            const SizedBox(height: 16),
            Text('PARAGRAPH',
                style: DLSTextStyle.paragraphMedium
                    .copyWith(color: DLSColors.secondaryBase)),
            const SizedBox(height: 12),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.paragraphMedium,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.paragraphSmall,
            ),
            const SizedBox(height: 16),
            Text('SUBHEADING',
                style: DLSTextStyle.subheadingMedium
                    .copyWith(color: DLSColors.secondaryBase)),
            const SizedBox(height: 12),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.subheadingMedium,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.subheadingSmall,
            ),
            const SizedBox(height: 8),
            Text(
              titleText.toUpperCase(),
              style: DLSTextStyle.subheadingXSmall,
            ),
          ],
        ),
      ),
    );
  }
}
