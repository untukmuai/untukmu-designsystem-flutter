import 'package:example/base_component/accordion_example.dart';
import 'package:example/base_component/avatar_example.dart';
import 'package:example/base_component/badge_example.dart';
import 'package:example/base_component/banner_example.dart';
import 'package:example/base_component/checkbox_example.dart';
import 'package:example/base_component/dropdown_example.dart';
import 'package:example/base_component/file_upload_example.dart';
import 'package:example/base_component/key_component_example.dart';
import 'package:example/base_component/pagination_example.dart';
import 'package:example/base_component/radio_example.dart';
import 'package:example/base_component/tag_example.dart';
import 'package:example/base_component/text_area_example.dart';
import 'package:example/base_component/text_input_example.dart';
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
    final examples = [
      {'title': 'Accordion Example', 'page': const AccordionExamplePage()},
      {'title': 'Avatar Example', 'page': const AvatarExamplePage()},
      {'title': 'Badge Example', 'page': const BadgeExamplePage()},
      {'title': 'Banner Example', 'page': const BannerExample()},
      {'title': 'Breadcrumb Example', 'page': const BreadcrumbExamplePage()},
      {'title': 'Button Example', 'page': const ButtonExamplePage()},
      {'title': 'Checkbox Example', 'page': const CheckboxExamplePage()},
      {
        'title': 'Corner & Shadow Example',
        'page': const ShadowCornerExamplePage()
      },
      {'title': 'Divider Example', 'page': const DividerExamplePage()},
      {'title': 'Dropdown Example', 'page': const DropdownExample()},
      {'title': 'File Upload Example', 'page': const FileUploadExample()},
      {'title': 'Key Component Example', 'page': const KeyComponentExample()},
      {
        'title': 'Notification Example',
        'page': const NotificationExamplePage()
      },
      {'title': 'Pagination Example', 'page': const PaginationExamplePage()},
      {'title': 'Radio Example', 'page': const RadioExamplePage()},
      {'title': 'Tag Example', 'page': const TagExamplePage()},
      {'title': 'Text Area Example', 'page': const TextAreaExample()},
      {'title': 'Text Input Example', 'page': const TextInputExample()},
      {'title': 'Text Style Example', 'page': const TextStyleExamplePage()},
      {'title': 'Toggle Example', 'page': const ToggleExamplePage()},
    ];

    examples
        .sort((a, b) => (a['title'] as String).compareTo(b['title'] as String));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Untukmu Design System Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: examples.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => examples[index]['page'] as Widget,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                examples[index]['title'] as String,
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
