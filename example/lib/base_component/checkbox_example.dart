import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CheckboxExamplePage extends StatefulWidget {
  const CheckboxExamplePage({super.key});

  @override
  CheckboxExamplePageState createState() => CheckboxExamplePageState();
}

class CheckboxExamplePageState extends State<CheckboxExamplePage> {
  List<String> selectedValues = ['Checkbox 1'];

  void onCheckboxTap(String value) {
    setState(() {
      if (selectedValues.contains(value)) {
        selectedValues.remove(value);
      } else {
        selectedValues.add(value);
      }
      debugPrint('Selected values: ${selectedValues.join(', ')}');
    });
  }

  Widget badge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: DLSColors.pacificBlueLight,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'new',
            textAlign: TextAlign.center,
            style: DLSTextStyle.paragraphSmall
                .copyWith(height: 0.14, color: DLSColors.textSub500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Custom Checkbox Group',
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ContentCardWidget(
              label: 'Checkbox 1',
              subLabel: 'Sub 1',
              description: 'Description for checkbox 1',
              isActive: selectedValues.contains('Checkbox 1'),
              isHovered: false,
              isDisabled: false,
              badge: badge(),
              leadingWidget: SvgPicture.asset('assets/svg/ic_mastercard.svg'),
              onTap: () {
                onCheckboxTap('Checkbox 1');
              },
              controlType: ContentCardType.checkbox,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Checkbox 2',
              subLabel: 'Sub 2',
              description: 'Description for checkbox 2',
              isActive: selectedValues.contains('Checkbox 2'),
              isHovered: true,
              isDisabled: false,
              leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
              onTap: () {
                onCheckboxTap('Checkbox 2');
              },
              controlType: ContentCardType.checkbox,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Checkbox 3',
              subLabel: 'Sub 3',
              description: 'Description for checkbox 3',
              isActive: selectedValues.contains('Checkbox 3'),
              isHovered: false,
              isDisabled: false,
              onTap: () {
                onCheckboxTap('Checkbox 3');
              },
              controlType: ContentCardType.checkbox,
            ),
            const SizedBox(height: 16),
            const ContentCardWidget(
              label: 'Checkbox 4',
              subLabel: 'Sub 4',
              description: 'Description for checkbox 4',
              isActive: true,
              isHovered: false,
              isDisabled: true,
              controlType: ContentCardType.checkbox,
            ),
          ],
        ),
      ),
    );
  }
}
