import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class PaginationExamplePage extends StatefulWidget {
  const PaginationExamplePage({super.key});

  @override
  State<PaginationExamplePage> createState() => _PaginationExamplePageState();
}

class _PaginationExamplePageState extends State<PaginationExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(title: const Text('Pagination')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CustomPaginationWidget(onTap: () {}),
                const SizedBox(width: 8),
                CustomPaginationWidget(onTap: () {}, active: true),
                const SizedBox(width: 8),
                CustomPaginationWidget(onTap: () {}, enabled: false),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CustomPaginationWidget(
                    onTap: () {}, type: CustomPaginationType.circle),
                const SizedBox(width: 8),
                CustomPaginationWidget(
                    onTap: () {},
                    type: CustomPaginationType.circle,
                    active: true),
                const SizedBox(width: 8),
                CustomPaginationWidget(
                    onTap: () {},
                    type: CustomPaginationType.circle,
                    enabled: false),
              ],
            ),
            const CustomDividerWidget(verticalSpace: DLSSizing.s2xSmall),
            CustomPaginationGroupWidget(
              onTap: (index) {},
              maxPages: 10,
            ),
            const SizedBox(height: 8),
            CustomPaginationGroupWidget(
              onTap: (index) {},
              maxPages: 2,
            ),
            const SizedBox(height: 8),
            CustomPaginationGroupWidget(
              onTap: (index) {},
              maxPages: 5,
            ),
            const SizedBox(height: 8),
            CustomPaginationGroupWidget(
              onTap: (index) {},
              maxPages: 100,
            ),
          ],
        ),
      ),
    );
  }
}
