import 'dart:io';

import 'package:example/implementation/model/product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderWhatsappDialog extends StatelessWidget {
  final Product product;
  final Color themeColor;

  OrderWhatsappDialog(
      {Key? key, required this.product, required this.themeColor})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Shipping'),
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: Stack(
        alignment: Alignment.topCenter,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.9),
                    border: Border.all(color: const Color(0xFFF0F0F0)),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 90),
                    Text(
                      "Finding the perfect gift?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: themeColor),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "We can help you get this gift, talk to our sales assistant",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: DLSColors.textSub500),
                    ),
                    const SizedBox(height: 16),
                    CustomButtonWidget(
                      type: CustomButtonType.primary,
                      style: CustomButtonStyle.filled,
                      label: "Contact us on Whatsapp",
                      filledColor: themeColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      onPressed: () async {
                        String message = "Hello, I want to order this product";
                        String separator = " : ";
                        String name = "Name$separator${product.title}";
                        String price = 'Price$separator${product.price} ';
                        // String id =
                        //     "whatsapp_order_id".tr + separator + orderId;
                        String image =
                            "whatsapp_image".tr + separator + product.thumbnail;
                        message = "$message\n\n$name\n$price\n$image";
                        String fixPhone = "6285281638653";
                        var androidUrl =
                            "whatsapp://send?text=$message&phone=$fixPhone";
                        var iosUrl =
                            "https://wa.me/?text=${Uri.encodeFull(message)}&phone=$fixPhone";
                        debugPrint("Send message: $message");
                        if (Platform.isIOS) {
                          await launchUrl(Uri.parse(iosUrl));
                        } else {
                          await launchUrl(Uri.parse(androidUrl));
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Positioned(
                  right: 10,
                  top: 50,
                  child: GestureDetector(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(.5)),
                      child: const Center(
                          child: Icon(Icons.close_rounded, size: 15)),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ))
            ],
          ),
          //image

          SizedBox(
            width: 240,
            child: Stack(
              children: [
                Transform.rotate(
                  angle: -10 * 3.14159265359 / 180,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.thumbnail),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${product.price} ',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () => Navigator.of(context).pop(),
      //     child: const Text('Close'),
      //   ),
      // ],
    );
  }
}
