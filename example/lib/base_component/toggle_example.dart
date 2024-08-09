import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class ToggleExamplePage extends StatefulWidget {
  const ToggleExamplePage({super.key});

  @override
  ToggleExamplePageState createState() => ToggleExamplePageState();
}

class ToggleExamplePageState extends State<ToggleExamplePage> {
  bool isToggle1Active = false;
  bool isToggle2Active = false;
  bool isToggle3Active = true;

  void _handleToggleChange(int toggleNumber) {
    setState(() {
      if (toggleNumber == 1) {
        isToggle1Active = !isToggle1Active;
        debugPrint(
            'Toggle 1 is now ${isToggle1Active ? "active" : "inactive"}');
      } else if (toggleNumber == 2) {
        isToggle2Active = !isToggle2Active;
        debugPrint(
            'Toggle 2 is now ${isToggle2Active ? "active" : "inactive"}');
      } else if (toggleNumber == 3) {
        isToggle3Active = !isToggle3Active;
        debugPrint(
            'Toggle 3 is now ${isToggle3Active ? "active" : "inactive"}');
      }
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
        title: const Text('Custom Toggle Example',
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ContentCardWidget(
              label: 'Toggle 1',
              subLabel: '(Sub 1)',
              description: 'Description for toggle 1',
              isActive: isToggle1Active,
              isHovered: false,
              isDisabled: false,
              badge: badge(),
              leadingWidget: SvgPicture.asset('assets/svg/ic_mastercard.svg'),
              onTap: () {
                _handleToggleChange(1);
              },
              controlType: ContentCardType.toggle,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Toggle 2',
              subLabel: '(Sub 2)',
              description: 'Description for toggle 2',
              isActive: isToggle2Active,
              isHovered: true,
              isDisabled: false,
              leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
              onTap: () {
                _handleToggleChange(2);
              },
              controlType: ContentCardType.toggle,
            ),
            const SizedBox(height: 16),
            ContentCardWidget(
              label: 'Toggle 3',
              subLabel: '(Sub 3)',
              description: 'Description for toggle 3',
              isActive: isToggle3Active,
              isHovered: false,
              isDisabled: true,
              controlType: ContentCardType.toggle,
            ),
          ],
        ),
      ),
    );
  }
}
