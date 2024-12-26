import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class BreadcrumbExamplePage extends StatefulWidget {
  const BreadcrumbExamplePage({super.key});

  @override
  State<BreadcrumbExamplePage> createState() => _BreadcrumbExamplePageState();
}

class _BreadcrumbExamplePageState extends State<BreadcrumbExamplePage> {
  List<String> breads = [
    'Home',
    'Profile',
    'Address',
    'Address Detail',
    'Edit Address',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(title: const Text('Breadcrumb')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const BreadcrumbItemWidget(
                type: BreadcrumbItemType.iconLabel,
                icon: IconsaxPlusLinear.home_2,
                label: 'Home'),
            const SizedBox(height: 8),
            const BreadcrumbItemWidget(
                type: BreadcrumbItemType.label,
                icon: IconsaxPlusLinear.home_2,
                label: 'Home'),
            const SizedBox(height: 8),
            const BreadcrumbItemWidget(
                type: BreadcrumbItemType.icon,
                icon: IconsaxPlusLinear.home_2,
                label: 'Home'),
            const Divider(),
            BreadcrumbGroupWidget(
              itemIcon: IconsaxPlusLinear.home_2,
              items: breads,
            ),
            const SizedBox(height: 8),
            BreadcrumbGroupWidget(
              itemIcon: IconsaxPlusLinear.home_2,
              items: breads,
              type: BreadcrumbItemType.label,
            ),
            const SizedBox(height: 8),
            BreadcrumbGroupWidget(
              itemIcon: IconsaxPlusLinear.home_2,
              items: breads,
              type: BreadcrumbItemType.icon,
            ),
          ],
        ),
      ),
    );
  }
}
