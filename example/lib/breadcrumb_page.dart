import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
            const BreadcrumbItem(
                type: BreadcrumbItemType.iconLabel,
                icon: Iconsax.home_24,
                label: 'Home'),
            const SizedBox(height: 8),
            const BreadcrumbItem(
                type: BreadcrumbItemType.label,
                icon: Iconsax.home_24,
                label: 'Home'),
            const SizedBox(height: 8),
            const BreadcrumbItem(
                type: BreadcrumbItemType.icon,
                icon: Iconsax.home_24,
                label: 'Home'),
            const Divider(),
            BreadcrumbGroup(
              itemIcon: Iconsax.home_24,
              items: breads,
            ),
            const SizedBox(height: 8),
            BreadcrumbGroup(
              itemIcon: Iconsax.home_24,
              items: breads,
              type: BreadcrumbItemType.label,
            ),
            const SizedBox(height: 8),
            BreadcrumbGroup(
              itemIcon: Iconsax.home_24,
              items: breads,
              type: BreadcrumbItemType.icon,
            ),
          ],
        ),
      ),
    );
  }
}
