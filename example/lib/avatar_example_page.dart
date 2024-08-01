import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class AvatarExamplePage extends StatefulWidget {
  const AvatarExamplePage({super.key});

  @override
  State<AvatarExamplePage> createState() => _AvatarExamplePageState();
}

class _AvatarExamplePageState extends State<AvatarExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgStrong900,
      appBar: AppBar(title: const Text('Avatar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Size 80 - 20',
                style:
                    DLSTextStyle.titleH3.copyWith(color: DLSColors.bgWhite0)),
            const SizedBox(height: 16),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size80,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size80,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size72,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size72,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size64,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size64,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size56,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size56,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size48,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size48,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size40,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size40,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size32,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size32,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size24,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size24,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CustomCircularAvatar(
                  name: 'FP',
                  avatarSize: AvatarSize.size20,
                ),
                SizedBox(width: 8),
                CustomCircularAvatar(
                  url: 'https://picsum.photos/100',
                  avatarSize: AvatarSize.size20,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Avatar Group 80 - 20',
                style:
                    DLSTextStyle.titleH3.copyWith(color: DLSColors.bgWhite0)),
            const SizedBox(height: 16),
            AvatarGroup(
              size: AvatarSize.size80,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size72,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size64,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size56,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size48,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size40,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size32,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size24,
              items: items,
            ),
            const SizedBox(height: 8),
            AvatarGroup(
              size: AvatarSize.size20,
              items: items,
            ),
            const SizedBox(height: 16),
            Text('Compact Avatar Group 80 - 20',
                style:
                    DLSTextStyle.titleH3.copyWith(color: DLSColors.bgWhite0)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CompactAvatarGroup(
                    size: AvatarSize.size80,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size72,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size64,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size56,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size48,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size40,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size32,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size24,
                    items: items,
                  ),
                  const SizedBox(width: 8),
                  CompactAvatarGroup(
                    size: AvatarSize.size20,
                    items: items,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<AvatarGroupItemModel> items = [
    AvatarGroupItemModel(url: 'https://picsum.photos/100'),
    AvatarGroupItemModel(name: 'FP'),
    AvatarGroupItemModel(url: 'https://picsum.photos/100'),
    AvatarGroupItemModel(name: 'WP'),
    AvatarGroupItemModel(url: 'https://picsum.photos/100'),
  ];
}
