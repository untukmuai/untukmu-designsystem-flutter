import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatbotController extends GetxController {
  var messages =
      <Map<String, String>>[].obs; // Menyimpan pesan antara pengguna dan bot
  var isLoading = false.obs;
  String apiKey =
      "AIzaSyDElLVksRftg7ow65IAFKTHZIU2hUcqbCE"; // Ganti dengan API key Anda
  String? character;
  String language = 'english'; // Bahasa default adalah Indonesia

  late final GenerativeModel model;

  @override
  void onInit() {
    super.onInit();
    model = GenerativeModel(
      model: 'gemini-1.5-flash', // Model untuk fungsi chat
      apiKey: apiKey,
    );
  }

  void setCharacter(String character) {
    this.character = character;
  }

  void setLanguage(String languageName) {
    language = languageName.toLowerCase();
  }

  void reset() {
    messages.clear();
  }

  Future<void> sendMessage(String userMessage) async {
    isLoading.value = true;
    update();

    try {
      if (userMessage.isNotEmpty) {
        // Tambahkan pesan pengguna ke daftar
        messages.add({'sender': 'user', 'message': userMessage});
      }

      // Tambahkan pesan "typing..." dari bot
      messages
          .add({'sender': 'bot', 'message': 'typing...', 'isTyping': 'true'});

      // Bangun riwayat percakapan tanpa pesan "typing..."
      String conversation = '';
      for (var msg in messages) {
        if (msg['isTyping'] == 'true') continue;
        String sender = msg['sender'] == 'user' ? 'User' : character ?? 'Bot';
        String message = msg['message'] ?? '';
        conversation += '$sender: $message\n';
      }

      // Bangun prompt dengan bahasa yang dipilih
      String prompt = '''
      Anda adalah "${character ?? 'Bot'}" yang akan menjawab semua pertanyaan tentang ${character}. 
      Lakukan percakapan dengan pengguna dalam bahasa "$language", 
      merespons seperti "${character ?? 'Bot'}" akan merespons. 
      Gunakan sudut pandang orang pertama tunggal.
      berikan jawaban tanpa menuliskan ulang chat sebelumnya.

      $conversation
      ${character ?? 'Bot'}:
      ''';

      // Kirim prompt ke API Gemini
      final response = await model.generateContent(
        [Content.text(prompt)],
      );

      // Ambil balasan bot
      String botReply = response.text?.trim() ?? '';

      // Hapus pesan "typing..."
      messages.removeWhere((msg) => msg['isTyping'] == 'true');

      // Tambahkan balasan bot ke daftar pesan
      messages.add({'sender': 'bot', 'message': botReply});
    } catch (e) {
      // Hapus pesan "typing..." jika ada error
      messages.removeWhere((msg) => msg['isTyping'] == 'true');
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  // Metode untuk mengirim salam awal
  Future<void> sendGreeting() async {
    // Hanya kirim greeting jika tidak ada pesan sebelumnya
    if (messages.isEmpty) {
      isLoading.value = true;
      update();

      try {
        // Tambahkan pesan "typing..." dari bot
        messages
            .add({'sender': 'bot', 'message': 'typing...', 'isTyping': 'true'});

        // Bangun prompt awal dengan bahasa yang dipilih
        String prompt = '''
Anda adalah "${character ?? 'Bot'}". Berikan salam pembuka kepada pengguna dalam bahasa "$language", seperti "${character ?? 'Bot'}" akan menyapa. Gunakan sudut pandang orang pertama tunggal.

${character ?? 'Bot'}:
''';

        // Kirim prompt ke API Gemini
        final response = await model.generateContent(
          [Content.text(prompt)],
        );

        // Ambil balasan bot
        String botReply = response.text?.trim() ?? '';

        // Hapus pesan "typing..."
        messages.removeWhere((msg) => msg['isTyping'] == 'true');

        // Tambahkan balasan bot ke daftar pesan
        messages.add({'sender': 'bot', 'message': botReply});
      } catch (e) {
        // Hapus pesan "typing..." jika ada error
        messages.removeWhere((msg) => msg['isTyping'] == 'true');
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
        update();
      }
    }
  }
}
