import 'dart:convert';
import 'package:example/implementation/model/product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxMap<String, bool> isLoadingMap =
      <String, bool>{}.obs; // Track loading state for each category
  var errorMessage = ''.obs;
  RxMap productList = <String, List<Product>>{}.obs;

  String _generateKey(
      String mainCategory, String subCategory1, String subCategory2) {
    return "$mainCategory-$subCategory1-$subCategory2";
  }

  Future<void> fetchProducts({
    required String interest,
    required String mainCategory,
    required String subCategory,
    required String subCategory2,
  }) async {
    final key = _generateKey(mainCategory, subCategory, subCategory2);

// Check if data is already in cache
    if (productList.containsKey(key) && productList[key].isNotEmpty) {
      // Data is cached, so skip fetching
      debugPrint(
          "Data fetched from cache for key: $key size: ${productList[key].length}");
      isLoadingMap[key] = false;
      return;
    }

    isLoadingMap[key] = true; // Set loading only for this specific category key

    final url = Uri.parse(
        "https://code-generator-prod-maeufmvgvq-as.a.run.app/serp-search");

    try {
      String jsonRequest = jsonEncode({
        "interest": interest,
        "main_category": mainCategory,
        "sub_category": subCategory,
        "sub_category_2": subCategory2,
      });

      debugPrint("json request $jsonRequest");

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonRequest,
      );

      if (response.statusCode == 200) {
        debugPrint("json response ${response.body}");
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse["error_code"] != 0) {
          errorMessage.value = "Error fetching products";
          return;
        }

        final products = (jsonResponse["data"] as List)
            .map((item) => Product.fromJson(item))
            .toList();

        productList[key] = products; // Store products based on category key
      } else {
        errorMessage.value = "Failed to load products";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoadingMap[key] = false; // Set loading to false only for this category
    }
  }

  List<Product> getProductsForSelectedCategories(
      String mainCategory, String subCategory, String subCategory2) {
    final key = _generateKey(mainCategory, subCategory, subCategory2);
    return productList[key] ?? [];
  }

  bool isLoadingForCategory(
      String mainCategory, String subCategory, String subCategory2) {
    final key = _generateKey(mainCategory, subCategory, subCategory2);
    return isLoadingMap[key] ?? false;
  }
}
