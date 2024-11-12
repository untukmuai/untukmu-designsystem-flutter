import 'dart:convert';

import 'package:example/implementation/model/gemini_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiController extends GetxController {
  var isLoading = false.obs;
  var inputText = ''.obs;
  var imageCamera = ''.obs;
  var imageGallery = ''.obs;
  var selectedModel = 'Gemini 1.5 Flash'.obs;
  String apiKey = "AIzaSyDElLVksRftg7ow65IAFKTHZIU2hUcqbCE";

  GenerativeModel getModel() {
    String selectedModelString = 'gemini-1.5-flash';
    if (selectedModel.value == 'Gemini 1.5 Flash') {
      selectedModelString = 'gemini-1.5-flash';
    } else if (selectedModel.value == 'Gemini 1.5 Pro') {
      selectedModelString = 'gemini-1.5-pro';
    } else if (selectedModel.value == 'Gemini 1.0 Pro') {
      selectedModelString = 'gemini-1.0-pro';
    }

    GenerativeModel model = GenerativeModel(
      model: selectedModelString,
      apiKey: apiKey,
      // safetySettings: [
      //   SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
      //   SafetySetting(
      //       HarmCategory.dangerousContent, HarmBlockThreshold.none),
      //   // SafetySetting(HarmCategory.unspecified, HarmBlockThreshold.low),
      //   SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      //   SafetySetting(
      //       HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
      // ],
      // generationConfig: GenerationConfig(
      //     temperature: 1.0, topK: 64, topP: 0.95, maxOutputTokens: 9000));
    );
    debugPrint("question using model $selectedModelString");

    return model;
  }

  Future<GeminiResponseData?> process(String interest, String language) async {
    GeminiResponseData? result;
    isLoading.value = true;
    update();
    try {
      final model = getModel();
      String prompt = """

      You are a UI/UX writer.
      I need values such as the title and hint in marketing language, categories with subcategories (minimum 3 categories and 5 sub categories), 
      and a theme color based on a product palette that aligns with the user's interest.
      Ensure that the categories are relevant to the user's interest.

      for example, if the user's interest is "Lakers", the background color is purple and the secondary background color is yellow.

      Example:
      Interest: Lakers
      Language: id

      {
        "search_product_title": "",
        "search_product_hint": "",
        "theme_color": {
          "text_color": "#000000",
          "background_color": "#FF552583",
          "secondary_background_color": "#FF451593"
        },
        "categories": [
          {
            "name": "apparel",
            "sub": [
              {
                "name": "men apparel",
                "sub": [
                  "jersey", "t-shirt", "hoodie & sweatshirts"
                ]
              }
            ]
          }
        ]
      }

      Generate for a user with the following:
      Interest: $interest
      Language: $language

      Note:
      1. Ensure the background color matches the theme of $interest and the text color 
      is appropriate for visibility against the background color. make the text easy to read.
      2. Add emoji for each category, before the category name and sub category 1, also add spacing between the emoji and the category name.
      3. Seconday background color is different with the background color.
      4. Both background color and secondary background color should be relevan with $interest and using high contrast (darker).
      
      ONLY SHOW THE JSON OUTPUT

      """;
      final content = [Content.text(prompt)];
      debugPrint("question $prompt");
      final response = await model.generateContent(content);
      debugPrint("response ${response.text}");

      String responseText = response.text!.replaceAll("```json", "");
      responseText = responseText.replaceAll("```", "");

      final Map<String, dynamic> jsonMap = json.decode(responseText);
      result = GeminiResponseData.fromJson(jsonMap);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      debugPrint(e.toString());
    }
    isLoading.value = false;
    update();
    return result;
  }
}
