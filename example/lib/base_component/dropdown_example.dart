import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  final List<String> items = ['CORPORATE', 'INDIVIDUAL', 'OTHER'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final data = CustomDropdownData(code: '1', name: 'USD');

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
                  items: ['USD', 'IDR'],
                  hintText: 'Currency',
                  filled: true,
                  fillColor: DLSColors.bgWhite0,
                  type: CompactDropdownType.icon,
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
              selectedItem: data,
              onChanged: (value) => debugPrint(value?.code),
              items: [
                data,
                CustomDropdownData(code: '2', name: 'IDR'),
              ],
              label: 'Currency',
              hintText: 'Select Currency',
            ),
            CustomDropdownWidget(
              items: [
                CustomDropdownData(code: '1', name: 'USD'),
                CustomDropdownData(code: '2', name: 'IDR'),
              ],
              label: 'Currency',
              hintText: 'Select Currency',
              showOptionalLabel: true,
            ),
            CustomDropdownWidget(
              isEditable: false,
              items: [
                CustomDropdownData(code: '1', name: 'USD'),
                CustomDropdownData(code: '2', name: 'IDR'),
              ],
              label: 'Currency',
              hintText: 'Select Currency',
              showOptionalLabel: true,
            ),
            SizedBox(
              width: 100,
              child: CustomDropdownGenericWidget<String>(
                items: items,
                itemToString: (value) => value,
                selectedItem: selectedItem,
                onItemChanged: (value) => setState(() => selectedItem = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
