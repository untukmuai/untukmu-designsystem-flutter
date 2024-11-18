import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/implementation/controller/chatbot_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // Import paket flutter_markdown

class ChatbotTab extends StatefulWidget {
  final String character;
  final Color backgroundColor;
  final Color textColor;

  const ChatbotTab({
    Key? key,
    required this.character,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  _ChatbotTabState createState() => _ChatbotTabState();
}

class _ChatbotTabState extends State<ChatbotTab> {
  late ChatbotController chatbotController;
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatbotController = Get.find();
  }

  void scrollChatToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          curve: Curves.easeOut, duration: const Duration(milliseconds: 2000));
    });
  }

  @override
  Widget build(BuildContext context) {
    // URL gambar avatar; menggantinya dengan URL gambar karakter yang sesuai
    String avatarUrl =
        'https://image.pollinations.ai/prompt/${widget.character}';

    return Obx(() {
      scrollChatToBottom();
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatbotController.messages.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                final message = chatbotController.messages[index];
                bool isUser = message['sender'] == 'user';
                bool isTyping = message['isTyping'] == 'true';

                if (isUser) {
                  // Pesan dari pengguna
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        message['message'] ?? '',
                        style: TextStyle(color: widget.textColor),
                      ),
                    ),
                  );
                } else {
                  // Pesan dari bot dengan avatar
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Gambar avatar
                      Container(
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: avatarUrl,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(Icons.person,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                      ),
                      isTyping
                          ? Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.fromLTRB(0, 4, 70, 4),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'typing...',
                                  style: TextStyle(
                                      color: DLSColors.textDisabled300,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            )
                          :
                          // Bubble pesan
                          Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.fromLTRB(0, 4, 70, 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                child: isTyping
                                    ? const Text(
                                        'typing...',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    : MarkdownBody(
                                        data: message['message'] ?? '',
                                        styleSheet: MarkdownStyleSheet(
                                          p: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onTapLink: (text, href, title) {
                                          // if (href != null) {
                                          //   _launchURL(href);
                                          // }
                                        },
                                      ),
                              ),
                            ),
                    ],
                  );
                }
              },
            ),
          ),
          // Input pesan dan tombol
          Container(
            color: DLSColors.fadedLighter,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextInputWidget(
                    controller: messageController,
                    hintText: 'Ask me anything about ${widget.character} ...',
                    inputMode: InputMode.text,
                    focusedBorderColor: widget.backgroundColor,
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                IconButton(
                  icon: Icon(Iconsax.send_1, color: widget.backgroundColor),
                  onPressed: () {
                    if (messageController.text.trim().isNotEmpty) {
                      chatbotController
                          .sendMessage(messageController.text.trim());
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  // void _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     Get.snackbar('Error', 'Could not launch $url');
  //   }
  // }
}
