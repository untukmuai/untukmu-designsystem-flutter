import 'package:example/implementation/controller/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsTab extends StatefulWidget {
  final String interest;
  final Color backgroundColor;
  final Color textColor;

  const NewsTab({
    super.key,
    required this.interest,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  NewsTabState createState() => NewsTabState();
}

class NewsTabState extends State<NewsTab> {
  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    // Fetch news when the NewsTab is initialized
    newsController.fetchNews(widget.interest);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (newsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: widget.backgroundColor),
        );
      } else if (newsController.articles.isEmpty) {
        return const Center(
          child: Text('No news articles found'),
        );
      } else {
        final articles = newsController.articles;

        // Top 3 articles for the carousel
        final topArticles = articles.take(3).toList();
        // Remaining articles for the list
        final remainingArticles = articles.skip(3).toList();

        return SingleChildScrollView(
          child: Column(
            children: [
              // Carousel Slider for top 3 articles
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: topArticles.map((article) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          _launchURL(article.url);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                imageUrl: article.imageUrl,
                                fit: BoxFit.cover,
                                errorWidget: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey.shade200,
                                    child: const Center(
                                      child: Text(
                                        'Image not available',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black54,
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  article.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              // ListView for remaining articles
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: remainingArticles.length,
                itemBuilder: (context, index) {
                  final article = remainingArticles[index];
                  return ListTile(
                    leading: article.imageUrl.isNotEmpty
                        ? Image.network(
                            article.imageUrl,
                            width: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                color: Colors.grey.shade200,
                                child: const Center(
                                  child: Text(
                                    'No Image',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            width: 100,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Text(
                                'No Image',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                    title: Text(
                      article.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: DLSTextStyle.labelLarge
                          .copyWith(color: DLSColors.textMain900),
                    ),
                    subtitle: Text(
                      article.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: DLSTextStyle.labelSmall
                          .copyWith(color: DLSColors.textSoft400),
                    ),
                    onTap: () {
                      _launchURL(article.url);
                    },
                  );
                },
              ),
            ],
          ),
        );
      }
    });
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('Error', 'Could not launch $url');
    }
  }
}
