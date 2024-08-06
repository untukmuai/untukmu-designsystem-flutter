import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class PasswordCheckerExample extends StatefulWidget {
  const PasswordCheckerExample({super.key});

  @override
  PasswordCheckerExampleState createState() => PasswordCheckerExampleState();
}

class PasswordCheckerExampleState extends State<PasswordCheckerExample> {
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: true,
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Enter your password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: DLSColors.textSub500, width: 1),
              ),
            ),
          ),
          const SizedBox(height: 20),
          PasswordCheckerWidget(password: _password),
        ],
      ),
    );
  }
}
