import 'package:get/get.dart';
import 'dart:convert';

class DashboardController extends GetxController {
  RxMap<String, dynamic> data = <String, dynamic>{}.obs;
  RxList<String> categories = <String>[].obs;
  RxMap<String, List<String>> subCategories = <String, List<String>>{}.obs;
  RxList<String> items = <String>[].obs;

  void initializeData(String jsonData) {
    final parsedData = json.decode(jsonData);

    // Load categories and subcategories
    categories
        .assignAll(parsedData['categories'].map((cat) => cat['name']).toList());
    for (var category in parsedData['categories']) {
      subCategories[category['name']] =
          category['sub'].map((sub) => sub['name']).toList();
    }
  }

  void updateItems(String selectedSubCategory) {
    // Retrieve items based on the selected sub-category
    items.assignAll(subCategories[selectedSubCategory] ?? []);
  }
}
