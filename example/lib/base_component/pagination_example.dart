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
      appBar: AppBar(title: const Text('Pagination')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CustomPagination(onTap: () {}),
                const SizedBox(width: 8),
                CustomPagination(onTap: () {}, active: true),
                const SizedBox(width: 8),
                CustomPagination(onTap: () {}, enabled: false),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CustomPagination(
                    onTap: () {}, type: CustomPaginationType.circle),
                const SizedBox(width: 8),
                CustomPagination(
                    onTap: () {},
                    type: CustomPaginationType.circle,
                    active: true),
                const SizedBox(width: 8),
                CustomPagination(
                    onTap: () {},
                    type: CustomPaginationType.circle,
                    enabled: false),
              ],
            ),
            const CustomDivider(verticalSpace: DLSSizing.s2xSmall),
            CustomPaginationGroup(
              onTap: (index) {},
              maxPages: 10,
            ),
            const SizedBox(height: 8),
            CustomPaginationGroup(
              onTap: (index) {},
              maxPages: 2,
            ),
            const SizedBox(height: 8),
            CustomPaginationGroup(
              onTap: (index) {},
              maxPages: 5,
            ),
            const SizedBox(height: 8),
            CustomPaginationGroup(
              onTap: (index) {},
              maxPages: 100,
            ),
          ],
        ),
      ),
    );
  }
}
