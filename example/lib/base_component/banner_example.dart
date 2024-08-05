import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum UIType { small, medium, large }

class BannerExample extends StatefulWidget {
  const BannerExample({super.key});

  @override
  State<BannerExample> createState() => _BannerExampleState();
}

class _BannerExampleState extends State<BannerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Example'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomBanner(
              type: CustomBannerType.error,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.warning,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.success,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.information,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.feature,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            CustomDivider(
              verticalSpace: DLSSizing.xSmall,
            ),
            CustomBanner(
              type: CustomBannerType.error,
              style: CustomBannerStyle.light,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.warning,
              style: CustomBannerStyle.light,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.success,
              style: CustomBannerStyle.light,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.information,
              style: CustomBannerStyle.light,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.feature,
              style: CustomBannerStyle.light,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            CustomDivider(
              verticalSpace: DLSSizing.xSmall,
            ),
            CustomBanner(
              type: CustomBannerType.error,
              style: CustomBannerStyle.lighter,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.warning,
              style: CustomBannerStyle.lighter,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.success,
              style: CustomBannerStyle.lighter,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.information,
              style: CustomBannerStyle.lighter,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.feature,
              style: CustomBannerStyle.lighter,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            CustomDivider(
              verticalSpace: DLSSizing.xSmall,
            ),
            CustomBanner(
              type: CustomBannerType.error,
              style: CustomBannerStyle.stroke,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.warning,
              style: CustomBannerStyle.stroke,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.success,
              style: CustomBannerStyle.stroke,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.information,
              style: CustomBannerStyle.stroke,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomBanner(
              type: CustomBannerType.feature,
              style: CustomBannerStyle.stroke,
              title: 'Promos Available!',
              content: 'Kemerdekaan Indonesia 2024',
              subtitle: 'Pelajari Lebih Lanjut',
            ),
          ],
        ),
      ),
    );
  }
}
