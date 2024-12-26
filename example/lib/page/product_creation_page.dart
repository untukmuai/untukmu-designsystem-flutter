import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

part 'widgets/first_widget.dart';
part 'widgets/fourth_widget.dart';
part 'widgets/second_widget.dart';
part 'widgets/third_widget.dart';

class ProductCreationPage extends StatefulWidget {
  const ProductCreationPage({super.key});

  @override
  State<ProductCreationPage> createState() => _ProductCreationPageState();
}

class _ProductCreationPageState extends State<ProductCreationPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(
        backgroundColor: DLSColors.bgWhite0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(
            'svg/untukmu-logo.svg',
          ),
        ),
        titleSpacing: screenWidth / 4,
        title: CustomTextInputWidget(
          controller: _searchController,
          prefixWidget: const Icon(Iconsax.search_normal),
          hintText: 'Search Product',
        ),
        shape: const Border(
          bottom: BorderSide(color: DLSColors.bgSoft200),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DLSSizing.s3xSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FirstWidget(screenWidth: screenWidth),
            const SizedBox(height: DLSSizing.small),
            SecondWidget(screenWidth: screenWidth, screenHeight: screenHeight),
            const SizedBox(height: DLSSizing.small),
            ThirdWidget(screenWidth: screenWidth),
            const SizedBox(height: DLSSizing.small),
            FourthWidget(screenWidth: screenWidth),
          ],
        ),
      ),
    );
  }
}
