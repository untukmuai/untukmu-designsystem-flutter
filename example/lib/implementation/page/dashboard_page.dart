import 'package:example/implementation/model/gemini_response.dart';
import 'package:example/implementation/page/interest_input_page.dart';
import 'package:example/implementation/page/news_tab.dart';
import 'package:example/implementation/page/photos_tab.dart';
import 'package:example/implementation/page/video_tab.dart';
import 'package:example/implementation/page/product_list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardExamplePage extends StatefulWidget {
  final String interest;
  final GeminiResponseData geminiResponseData;

  const DashboardExamplePage(
      {super.key, required this.interest, required this.geminiResponseData});

  @override
  _DashboardExamplePageState createState() => _DashboardExamplePageState();
}

class _DashboardExamplePageState extends State<DashboardExamplePage> {
  TextEditingController searchController = TextEditingController();
  RxBool isImageLoading = true.obs;

  int _selectedIndex = 0; // Added to keep track of the selected tab

  Color hexToColor(String hexString) {
    hexString = hexString.replaceAll("#", "");
    if (hexString.length == 6) {
      hexString = "FF$hexString";
    }
    return Color(int.parse("0x$hexString"));
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'https://image.pollinations.ai/prompt/${widget.interest}';
    Color themeBackgroundColor =
        hexToColor(widget.geminiResponseData.themeColor.backgroundColor);
    Color secondaryThemeBackgroundColor = hexToColor(
        widget.geminiResponseData.themeColor.secondaryBackgroundColor);
    Color textColor =
        hexToColor(widget.geminiResponseData.themeColor.textColor);

    return Scaffold(
      appBar: AppBar(
        title: Text(capitalizeFirst(widget.interest),
            style: TextStyle(color: textColor)),
        backgroundColor: themeBackgroundColor,
        actionsIconTheme: IconThemeData(color: textColor),
        foregroundColor: textColor,
      ),
      backgroundColor: Colors.white,
      body: _getBodyContent(themeBackgroundColor, textColor),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: themeBackgroundColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.note_text),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.image),
            label: 'Images',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.video),
            label: 'Video',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getBodyContent(Color backgroundColor, Color textColor) {
    switch (_selectedIndex) {
      case 0:
        return _buildShopTab();
      case 1:
        return NewsTab(
          interest: widget.interest,
          backgroundColor: backgroundColor,
          textColor: textColor,
        );
      case 2:
        return PhotosTab(
          interest: widget.interest,
          backgroundColor: backgroundColor,
          textColor: textColor,
        );
      case 3:
        return VideoTab(
          interest: widget.interest,
          backgroundColor: backgroundColor,
        );
      default:
        return _buildShopTab();
    }
  }

  Widget _buildShopTab() {
    String imageUrl = 'https://image.pollinations.ai/prompt/${widget.interest}';
    Color backgroundColor =
        hexToColor(widget.geminiResponseData.themeColor.backgroundColor);
    Color textColor =
        hexToColor(widget.geminiResponseData.themeColor.textColor);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Background Image with Shimmer
          SizedBox(
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    color: Colors.grey.shade300,
                  ),
                ),
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  loadingBuilder: (context, child, loadingProgress) {
                    debugPrint("loading progress: $loadingProgress");
                    if (loadingProgress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: Colors.grey.shade300,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Text(
                          'Background image failed to load',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Search Bar and Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextInputWidget(
                        controller: searchController,
                        hintText: widget.geminiResponseData.searchProductHint,
                        inputMode: InputMode.text,
                        focusedBorderColor: backgroundColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomButtonWidget(
                      isIconMode: true,
                      icon: Icons.search,
                      filledColor: backgroundColor,
                      onPressed: () {
                        debugPrint('Search term: ${searchController.text}');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          widget.geminiResponseData.categories.isNotEmpty
              ? Column(
                  children: widget.geminiResponseData.categories
                      .map((category) => Column(
                            children: [
                              ProductList(
                                  title: category.name,
                                  interest: widget.interest,
                                  subCategory: category.sub,
                                  buttonColor: backgroundColor,
                                  textColor: textColor),
                              const SizedBox(height: 30),
                            ],
                          ))
                      .toList(),
                )
              : const Center(
                  child: Text('No categories found'),
                ),
        ],
      ),
    );
  }

  String capitalizeFirst(String s) => s[0].toUpperCase() + s.substring(1);
}
