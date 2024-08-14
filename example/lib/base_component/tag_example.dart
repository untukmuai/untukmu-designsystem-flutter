import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class TagExamplePage extends StatefulWidget {
  const TagExamplePage({super.key});

  @override
  State<TagExamplePage> createState() => _TagExamplePageState();
}

class _TagExamplePageState extends State<TagExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(title: const Text('Tag Example')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTag(),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(prefixIcon: Iconsax.clock),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      prefixIcon: Iconsax.clock,
                      suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                    badge: CustomBadge(),
                    prefixIcon: Iconsax.clock,
                    suffixIcon: Iconsax.close_circle,
                  ),
                ],
              ),
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTag(disabled: true),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(disabled: true, prefixIcon: Iconsax.clock),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(disabled: true, suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      disabled: true,
                      prefixIcon: Iconsax.clock,
                      suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                    disabled: true,
                    badge: CustomBadge(),
                    prefixIcon: Iconsax.clock,
                    suffixIcon: Iconsax.close_circle,
                  ),
                ],
              ),
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTag(
                    filledColor: DLSColors.textMain900,
                    textColor: DLSColors.textWhite0,
                  ),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      filledColor: DLSColors.textMain900,
                      textColor: DLSColors.textWhite0,
                      prefixIcon: Iconsax.clock),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      filledColor: DLSColors.textMain900,
                      textColor: DLSColors.textWhite0,
                      suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      filledColor: DLSColors.textMain900,
                      textColor: DLSColors.textWhite0,
                      prefixIcon: Iconsax.clock,
                      suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                    badge: CustomBadge(),
                    filledColor: DLSColors.textMain900,
                    textColor: DLSColors.textWhite0,
                    prefixIcon: Iconsax.clock,
                    suffixIcon: Iconsax.close_circle,
                  ),
                ],
              ),
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTag(
                    disabled: true,
                    filledColor: DLSColors.textMain900,
                    textColor: DLSColors.textWhite0,
                  ),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      disabled: true,
                      filledColor: DLSColors.textMain900,
                      textColor: DLSColors.textWhite0,
                      prefixIcon: Iconsax.clock),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      disabled: true,
                      filledColor: DLSColors.textMain900,
                      textColor: DLSColors.textWhite0,
                      suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                      disabled: true,
                      filledColor: DLSColors.textMain900,
                      textColor: DLSColors.textWhite0,
                      prefixIcon: Iconsax.clock,
                      suffixIcon: Iconsax.close_circle),
                  SizedBox(width: DLSSizing.s3xSmall),
                  CustomTag(
                    disabled: true,
                    badge: CustomBadge(),
                    filledColor: DLSColors.textMain900,
                    textColor: DLSColors.textWhite0,
                    prefixIcon: Iconsax.clock,
                    suffixIcon: Iconsax.close_circle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
