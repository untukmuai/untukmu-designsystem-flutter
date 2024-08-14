import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class TextInputExample extends StatefulWidget {
  const TextInputExample({super.key});

  @override
  State<TextInputExample> createState() => _TextInputExampleState();
}

class _TextInputExampleState extends State<TextInputExample> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(
        title: const Text('Text Input Example'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Phone Number",
                hintText: "(555) 000-0000",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                enableClear: true,
                suffixWidget:
                    const Icon(Icons.info, color: DLSColors.iconSoft400),
                inputMode: InputMode.phoneNumber,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Phone Number",
                hintText: "(555) 000-0000",
                showOptionalLabel: true,
                isInvalid: true,
                hintTextMessage: "Please check this field.",
                controller: controller,
                inputFormatters: [
                  PhoneNumberInputFormatter(),
                ],
                suffixWidget:
                    const Icon(Icons.info, color: DLSColors.iconSoft400),
                inputMode: InputMode.phoneNumber,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Card Number",
                hintText: "0000 0000 0000 0000",
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.cardNumber,
                inputFormatters: [
                  CcDigitInputFormatter(),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Website",
                hintText: "www.example.com",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.website,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Amount",
                hintText: "0.00",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.amount,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Date",
                hintText: "DD/MM/YYYY",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                dateFormat: "dd/MM/yyyy",
                inputMode: InputMode.date,
                inputFormatters: [
                  DateInputTextFormatter(),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Password",
                hintText: "********",
                showOptionalLabel: true,
                enableClear: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.password,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Share Link",
                hintText: "https://example.com",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.shareLink,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Invite Members",
                hintText: "Enter email",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.invite,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Website",
                hintText: "www.example.com",
                showOptionalLabel: true,
                hintTextMessage: "This is a hint text to help user.",
                controller: controller,
                inputMode: InputMode.websiteWithCounter,
              ),
              const SizedBox(height: 16),
              CustomTextInputWidget(
                label: "Tag",
                hintText: "www.example.com",
                showOptionalLabel: true,
                controller: controller,
                inputMode: InputMode.tag,
                enableAddNew: true,
                onTagsChanged: (tags) {
                  debugPrint(tags.toString());
                },
                listTag: const ["London", "Berlin", "Paris"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
