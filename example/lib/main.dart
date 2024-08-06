import 'package:example/base_component/accordion_example.dart';
import 'package:example/base_component/avatar_example.dart';
import 'package:example/base_component/badge_example.dart';
import 'package:example/base_component/banner_example.dart';
import 'package:example/base_component/checkbox_example.dart';
import 'package:example/base_component/file_upload_example.dart';
import 'package:example/base_component/key_component_example.dart';
import 'package:example/base_component/radio_example.dart';
import 'package:example/base_component/tag_example.dart';
import 'package:example/base_component/toggle_example.dart';
import 'package:example/base_component/divider_example.dart';
import 'package:example/base_component/breadcrumb_example.dart';
import 'package:example/base_component/button_example.dart';
import 'package:example/base_component/notification_example.dart';
import 'package:example/style/shadow_corner_page.dart';
import 'package:example/style/text_style_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Untukmu Design System Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TextStyleExamplePage()),
                );
              },
              child: const Text('Text Style Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShadowCornerExamplePage()),
                );
              },
              child: const Text('Corner & Shadow Example'),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccordionExamplePage()),
                );
              },
              child: const Text('Accordion Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AvatarExamplePage()),
                );
              },
              child: const Text('Avatar Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BadgeExamplePage()),
                );
              },
              child: const Text('Badge Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BannerExample()),
                );
              },
              child: const Text('Banner Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BreadcrumbExamplePage()),
                );
              },
              child: const Text('Breadcrumb Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ButtonExamplePage()),
                );
              },
              child: const Text('Button Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CheckboxExamplePage()),
                );
              },
              child: const Text('Checkbox Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DividerExamplePage()),
                );
              },
              child: const Text('Divider Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationExamplePage()),
                );
              },
              child: const Text('Notification Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KeyComponentExample()),
                );
              },
              child: const Text('Key Component Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RadioExamplePage()),
                );
              },
              child: const Text('Radio Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ToggleExamplePage()),
                );
              },
              child: const Text('Toggle Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TagExamplePage()),
                );
              },
              child: const Text('Tag Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FileUploadExample()),
                );
              },
              child: const Text('File Upload Example'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
