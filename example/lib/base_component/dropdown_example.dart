import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  final TextEditingController currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
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
            const SizedBox(height: DLSSizing.s3xSmall),
            const Row(
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
            const SizedBox(height: DLSSizing.s3xSmall),
            const Row(
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
            const SizedBox(height: DLSSizing.s3xSmall),
            CustomDropdownWidget(
              label: 'Currency',
              hintText: 'Select Currency',
              controller: currencyController,
            ),
            CustomDropdownWidget(
              label: 'Currency',
              hintText: 'Select Currency',
              controller: currencyController,
              showOptionalLabel: true,
            ),
          ],
        ),
      ),
    );
  }
}
