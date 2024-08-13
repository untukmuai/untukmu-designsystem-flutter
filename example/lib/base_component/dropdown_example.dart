import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                InlineDropdownWidget(
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                ),
                SizedBox(width: DLSSizing.s3xSmall),
                InlineDropdownWidget(
                  enabled: false,
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                ),
              ],
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            Row(
              children: [
                InlineDropdownWidget(
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                  filled: true,
                  fillColor: DLSColors.bgWhite0,
                ),
                SizedBox(width: DLSSizing.s3xSmall),
                InlineDropdownWidget(
                  enabled: false,
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                  filled: true,
                  fillColor: DLSColors.bgWhite0,
                ),
              ],
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            Row(
              children: [
                CompactDropdownWidget(
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                  filled: true,
                  fillColor: DLSColors.bgWhite0,
                ),
                SizedBox(width: DLSSizing.s3xSmall),
                CompactDropdownWidget(
                  enabled: false,
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                  filled: true,
                  fillColor: DLSColors.bgWhite0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
