import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CurrencyItem implements KeyValueItem {
  final String code;
  final String name;

  CurrencyItem(this.code, this.name);

  @override
  String get key => code;

  @override
  String get value => name;
}

class DropdownKeyValExample extends StatefulWidget {
  const DropdownKeyValExample({super.key});

  @override
  State<DropdownKeyValExample> createState() => _DropdownKeyValExampleState();
}

class _DropdownKeyValExampleState extends State<DropdownKeyValExample> {
  final currencies = [
    CurrencyItem('USD', 'US Dollar'),
    CurrencyItem('IDR', 'Indonesian Rupiah')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown Example'),
        ),
        body: Column(
          children: [
            const SizedBox(height: DLSSizing.s3xSmall),
            CustomDropdownKeyValWidget(
              items: currencies,
              label: 'Currency',
              hintText: 'Select Currency',
            ),
            CustomDropdownKeyValWidget(
              items: currencies,
              label: 'Currency',
              hintText: 'Select Currency',
              showOptionalLabel: true,
            ),
            CustomDropdownKeyValWidget(
              isEditable: false,
              items: currencies,
              label: 'Currency',
              hintText: 'Select Currency',
              showOptionalLabel: true,
            )
          ],
        ));
  }
}
