import 'package:example/implementation/model/news_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var articles = <NewsArticle>[].obs;

  // Replace 'YOUR_API_KEY' with your actual API key
  final String apiKey = 'e5982f5737d047a98d96b63752fe3020';

  // Cache to store articles based on query
  final Map<String, List<NewsArticle>> _cache = {};

  Future<void> fetchNews(String query) async {
    // If the query exists in the cache, use the cached data
    if (_cache.containsKey(query)) {
      articles.value = _cache[query]!;
      return;
    }

    isLoading.value = true;
    try {
      final now = DateTime.now();
      final fromDate = DateTime(now.year, now.month - 1, now.day);
      final formattedFromDate = fromDate.toIso8601String().split('T').first;

      final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&from=$formattedFromDate&sortBy=publishedAt&apiKey=$apiKey&pageSize=20&language=en',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> articlesJson = data['articles'];

        final fetchedArticles = articlesJson
            .map((articleJson) => NewsArticle.fromJson(articleJson))
            .toList();

        // Update the articles list
        articles.value = fetchedArticles;

        //remove removed article
        articles.removeWhere((element) => element.title == "[Removed]");

        // Store the fetched articles in the cache
        _cache[query] = fetchedArticles;
      } else {
        Get.snackbar('Error', 'Failed to fetch news');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
