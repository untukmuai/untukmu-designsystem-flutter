import 'package:example/implementation/model/gemini_response.dart';
import 'package:example/implementation/model/product_response.dart';
import 'package:example/implementation/page/order_whatsapp_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:example/implementation/controller/product_controller.dart';

class ProductList extends StatefulWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final List<SubCategory> subCategory;
  final String interest; // Added interest parameter

  const ProductList({
    Key? key,
    required this.title,
    required this.subCategory,
    required this.buttonColor,
    required this.textColor,
    required this.interest,
  }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductController productController = Get.put(ProductController());

  String? selectedSubCategory1;
  String? selectedSubCategory2;
  List<String> subCategory2Items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.subCategory.isNotEmpty) {
      selectedSubCategory1 = widget.subCategory[0].name;
      subCategory2Items = widget.subCategory[0].sub;
      selectedSubCategory2 = subCategory2Items[0];
      fetchProducts(); // Initial fetch
    }
  }

  String cleanUpText(String input) {
    String cleanup = input.replaceAll(RegExp(r'[^\x00-\x7F]+'), '');
    cleanup = cleanup.replaceFirst(RegExp(r'^\s+'), '');
    return cleanup;
  }

  void fetchProducts() {
    setState(() {
      isLoading = true;
    });

    productController
        .fetchProducts(
      interest: cleanUpText(widget.interest),
      mainCategory: cleanUpText(widget.title),
      subCategory: cleanUpText(selectedSubCategory1!),
      subCategory2: cleanUpText(selectedSubCategory2!),
    )
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  void onSubCategory1Selected(String subCategory1Name) {
    setState(() {
      selectedSubCategory1 = subCategory1Name;
      subCategory2Items = widget.subCategory
          .firstWhere((subCat) => subCat.name == subCategory1Name)
          .sub;

      selectedSubCategory2 = subCategory2Items[0];
      fetchProducts();
    });
  }

  Future<void> onSubCategory2Selected(String subCategory2Name) async {
    setState(() {
      selectedSubCategory2 = subCategory2Name;
    });
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product List Header
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 8, 8),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: DLSTextStyle.titleH4.copyWith(color: DLSColors.textMain900),
          ),
        ),

        // SubCategory 1 Tags
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: widget.subCategory.map((subCategory) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => onSubCategory1Selected(subCategory.name),
                  child: CustomTagWidget(
                    label: subCategory.name,
                    filledColor: selectedSubCategory1 == subCategory.name
                        ? widget.buttonColor
                        : DLSColors.neutral100,
                    textColor: selectedSubCategory1 == subCategory.name
                        ? widget.textColor
                        : DLSColors.textSub500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 8),

        // SubCategory 2 Tags
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: subCategory2Items.map((subCategory2) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => onSubCategory2Selected(subCategory2),
                  child: CustomTagWidget(
                    label: subCategory2,
                    borderColor: selectedSubCategory2 == subCategory2
                        ? widget.buttonColor
                        : DLSColors.neutral200,
                    textColor: selectedSubCategory2 == subCategory2
                        ? widget.buttonColor
                        : DLSColors.textSub500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 16),

        // Product List with Shimmer Loading
        SizedBox(
          height: 200,
          child: Obx(() {
            // Check loading state for the specific category key
            if (productController.isLoadingForCategory(
                cleanUpText(widget.title),
                cleanUpText(selectedSubCategory1!),
                cleanUpText(selectedSubCategory2!))) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of shimmer placeholders
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16, bottom: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: DLSColors.neutral300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 16,
                            width: 100,
                            color: DLSColors.neutral200,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 14,
                            width: 60,
                            color: DLSColors.neutral200,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 30,
                            color: DLSColors.neutral200,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              final products =
                  productController.getProductsForSelectedCategories(
                      cleanUpText(widget.title),
                      cleanUpText(selectedSubCategory1!),
                      cleanUpText(selectedSubCategory2!));
              if (products.isEmpty) {
                return const Center(child: Text('No products available'));
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final Product product = products[index];
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return OrderWhatsappDialog(
                              product: product,
                              themeColor: widget.buttonColor,
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 160,
                        margin: const EdgeInsets.only(right: 16, bottom: 4),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          // color: DLSColors.neutral100,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: DLSColors.neutral200,
                            width: 1,
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.shade300,
                          //     blurRadius: 2,
                          //     offset: const Offset(2, 2),
                          //   ),
                          // ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.thumbnail,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.title,
                              style: DLSTextStyle.labelLarge
                                  .copyWith(color: DLSColors.textMain900),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.price,
                              style: DLSTextStyle.labelSmall
                                  .copyWith(color: DLSColors.textSub500),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
          }),
        ),
      ],
    );
  }
}
