import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class BadgeExamplePage extends StatefulWidget {
  const BadgeExamplePage({super.key});

  @override
  State<BadgeExamplePage> createState() => _BadgeExamplePageState();
}

class _BadgeExamplePageState extends State<BadgeExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CustomBadgeWidget(
                  style: CustomBadgeStyle.light,
                  backgroundColor: DLSColors.pacificBlueLight,
                  textColor: DLSColors.pacificBlueDarker,
                ),
                SizedBox(width: 8),
                CustomBadgeWidget(
                  style: CustomBadgeStyle.filled,
                  backgroundColor: DLSColors.pacificBlueBase,
                ),
                SizedBox(width: 8),
                CustomBadgeWidget(
                  style: CustomBadgeStyle.stroke,
                  strokeColor: DLSColors.pacificBlueLight,
                  textColor: DLSColors.pacificBlueBase,
                ),
                SizedBox(width: 8),
                CustomBadgeWidget(
                  style: CustomBadgeStyle.stroke,
                  strokeColor: DLSColors.pacificBlueLight,
                  textColor: DLSColors.pacificBlueBase,
                  disabled: true,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CustomBadgeWidget(
                  style: CustomBadgeStyle.light,
                  prefixIcon: Icon(
                    Icons.brightness_1,
                    size: 6,
                    color: DLSColors.pacificBlueDarker,
                  ),
                  backgroundColor: DLSColors.pacificBlueLight,
                  textColor: DLSColors.pacificBlueDarker,
                ),
                SizedBox(width: 8),
                CustomBadgeWidget(
                  style: CustomBadgeStyle.filled,
                  backgroundColor: DLSColors.pacificBlueBase,
                  suffixIcon: Icon(
                    Iconsax.flash_11,
                    size: 10,
                    color: DLSColors.bgWhite0,
                  ),
                ),
                SizedBox(width: 8),
                CustomBadgeWidget(
                  style: CustomBadgeStyle.stroke,
                  strokeColor: DLSColors.pacificBlueLight,
                  textColor: DLSColors.pacificBlueBase,
                  title: '2',
                ),
                SizedBox(width: 8),
                CustomBadgeWidget(
                  style: CustomBadgeStyle.light,
                  prefixIcon: Icon(
                    Icons.brightness_1,
                    size: 6,
                    color: DLSColors.pacificBlueDarker,
                  ),
                  backgroundColor: DLSColors.pacificBlueLight,
                  textColor: DLSColors.pacificBlueDarker,
                  disabled: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
