import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RadioExamplePage extends StatefulWidget {
  const RadioExamplePage({super.key});

  @override
  RadioExamplePageState createState() => RadioExamplePageState();
}

class RadioExamplePageState extends State<RadioExamplePage> {
  String selectedValue = 'Option 1';

  void _handleRadioChange(String value) {
    setState(() {
      selectedValue = value;
      debugPrint('Selected value is now: $selectedValue');
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
        title: const Text('Custom Radio Group',
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ContentCardWidget(
              label: 'Option 1',
              subLabel: '(Sub 1)',
              description: 'Description for option 1',
              isActive: selectedValue == 'Option 1',
              isHovered: false,
              isDisabled: false,
              badge: badge(),
              leadingWidget: SvgPicture.asset('assets/svg/ic_mastercard.svg'),
              onTap: () {
                _handleRadioChange('Option 1');
              },
              controlType: ContentCardType.radio,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Option 2',
              subLabel: '(Sub 2)',
              description: 'Description for option 2',
              isActive: selectedValue == 'Option 2',
              isHovered: true,
              isDisabled: false,
              leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
              onTap: () {
                _handleRadioChange('Option 2');
              },
              controlType: ContentCardType.radio,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Option 3',
              subLabel: '(Sub 3)',
              description: 'Description for option 3',
              isActive: selectedValue == 'Option 3',
              isHovered: false,
              isDisabled: false,
              onTap: () {
                _handleRadioChange('Option 3');
              },
              controlType: ContentCardType.radio,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Option 4',
              subLabel: '(Sub 4)',
              description: 'Description for option 4',
              isActive: selectedValue == 'Option 4',
              isHovered: false,
              isDisabled: true,
              onTap: () {
                _handleRadioChange('Option 4');
              },
              controlType: ContentCardType.radio,
            ),
          ],
        ),
      ),
    );
  }
}
