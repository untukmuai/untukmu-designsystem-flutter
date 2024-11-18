import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:example/implementation/controller/photos_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotosTab extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final String interest;

  const PhotosTab({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.interest,
  }) : super(key: key);

  @override
  State<PhotosTab> createState() => _PhotosTabState();
}

class _PhotosTabState extends State<PhotosTab> {
  final PhotosController controller = Get.put(PhotosController());

  @override
  void initState() {
    super.initState();
    controller.fetchPhotos(widget.interest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: Colors.grey.shade300,
                height: 200,
                width: double.infinity,
              ),
            ),
          );
        } else if (controller.photos.isEmpty) {
          return const Center(child: Text("No photos available"));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.builder(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: controller.photos.length,
              itemBuilder: (context, index) {
                final photo = controller.photos[index];
                return GestureDetector(
                  onTap: () {
                    // Tambahkan fungsi jika ingin membuka tampilan detail
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: photo.src["medium"] ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder: (context, _) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                color: Colors.grey.shade300,
                                height: 200, // Tinggi placeholder
                              ),
                            );
                          },
                          errorWidget: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Text(
                                  'Image failed to load',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        photo.alt ?? 'No description',
                        style: DLSTextStyle.labelMedium
                            .copyWith(color: DLSColors.textMain900),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
