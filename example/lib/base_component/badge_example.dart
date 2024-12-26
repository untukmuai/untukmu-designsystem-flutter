import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
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
            const SizedBox(height: 16),
            const Row(
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
                    IconsaxPlusLinear.flash_1,
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
            const Divider(),
            Row(
              children: [
                StatusBadgeWidget(
                  style: StatusBadgeStyle.stroke,
                  prefixWidget: CircleAvatar(
                    radius: 12,
                    backgroundColor: DLSColors.primaryBase,
                    child: Text(
                      '1',
                      style: DLSTextStyle.labelSmall
                          .copyWith(color: DLSColors.textWhite0),
                    ),
                  ),
                  title: 'Active Notifications',
                  textColor: DLSColors.textSub500,
                  strokeColor: DLSColors.strokeSoft200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
