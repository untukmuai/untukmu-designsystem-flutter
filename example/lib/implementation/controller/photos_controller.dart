import 'package:example/implementation/model/photos_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotosController extends GetxController {
  var isLoading = true.obs;
  var photos = <Photo>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPhotos(String query) async {
    final url = 'https://api.pexels.com/v1/search?query=$query&per_page=10';
    final headers = {
      'Authorization':
          'LkatLk702PANYLIRvqveRNPfMygf3vsbF8FcxDBG7VTqiSz0G4mk4OVt',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> photosJson = jsonResponse['photos'];
        photos.value = photosJson.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load photos");
      }
    } catch (e) {
      print("Error fetching photos: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
