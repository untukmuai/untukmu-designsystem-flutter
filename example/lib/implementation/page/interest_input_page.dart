import 'package:example/implementation/controller/chatbot_controller.dart';
import 'package:example/implementation/controller/product_controller.dart';
import 'package:example/implementation/model/gemini_response.dart';
import 'package:example/implementation/page/dashboard_page.dart';
import 'package:example/implementation/controller/gemini_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestInputPage extends StatefulWidget {
  @override
  _InterestInputPageState createState() => _InterestInputPageState();
}

class _InterestInputPageState extends State<InterestInputPage> {
  final TextEditingController _interestController = TextEditingController();
  final GeminiController geminiController = Get.put(GeminiController());
  final ChatbotController chatbotController = Get.put(ChatbotController());
  final ProductController productController = Get.put(ProductController());
  String selectedLanguage = 'english'; // Default language
  bool isLoading = false;

  void _handleAccess() async {
    String interest = _interestController.text.trim().toLowerCase();

    if (interest.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      GeminiResponseData? geminiResponseData =
          await geminiController.process(interest, selectedLanguage);
      chatbotController.reset();
      chatbotController.setCharacter(interest);
      chatbotController.setLanguage(selectedLanguage);

      setState(() {
        isLoading = false;
      });

      if (geminiResponseData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardExamplePage(
              geminiResponseData: geminiResponseData,
              interest: interest,
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter an interest")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Interest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _interestController,
              decoration: const InputDecoration(
                labelText: 'Interest',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Language:'),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items: ['indonesia', 'english']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator() // Show loading indicator
                : ElevatedButton(
                    onPressed: _handleAccess,
                    child: const Text('Access'),
                  ),
          ],
        ),
      ),
    );
  }
}
