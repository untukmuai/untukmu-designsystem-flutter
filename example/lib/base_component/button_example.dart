import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class ButtonExamplePage extends StatefulWidget {
  const ButtonExamplePage({super.key});

  @override
  State<ButtonExamplePage> createState() => _ButtonExamplePageState();
}

class _ButtonExamplePageState extends State<ButtonExamplePage> {
  CustomButtonSize? selectedButtonSize = CustomButtonSize.medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(title: const Text('Button')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<CustomButtonSize>(
                value: selectedButtonSize,
                items: sizes
                    .map((size) =>
                        DropdownMenuItem(value: size, child: Text(size.name)))
                    .toList(),
                onChanged: (value) => setState(() {
                      selectedButtonSize = value;
                    })),
            noIconButton(),
            const Divider(),
            onlyIconButton(),
            const Divider(),
            withIconButton(),
            const Divider(),
            linkButtons(),
            const Divider(),
            socialButtons(),
            const Divider(),
            fancyButtons(),
            const Divider(),
            compactButtons(),
          ],
        ),
      ),
    );
  }

  Widget noIconButton() {
    return Column(
      children: [
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.filled,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.lighter,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.stroke,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.ghost,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.filled,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.lighter,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.stroke,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.ghost,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.filled,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.lighter,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.stroke,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.ghost,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.filled,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.lighter,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.stroke,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.ghost,
            ),
          ],
        ),
      ],
    );
  }

  Widget onlyIconButton() {
    return Column(
      children: [
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.stroke,
            ),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.filled,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.lighter,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.stroke,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.primary,
              style: CustomButtonStyle.ghost,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.filled,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.lighter,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.stroke,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.neutral,
              style: CustomButtonStyle.ghost,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.filled,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.lighter,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.stroke,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.ghost,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.filled,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.lighter,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.stroke,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
            const SizedBox(width: 8),
            CustomButtonWidget(
              size: selectedButtonSize,
              disabled: true,
              onPressed: () {},
              type: CustomButtonType.error,
              style: CustomButtonStyle.ghost,
              isIconMode: true,
              icon: Iconsax.copy,
            ),
          ],
        ),
      ],
    );
  }

  Widget withIconButton() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.primary,
                style: CustomButtonStyle.filled,
                prefixIcon: Iconsax.arrow_left1,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.primary,
                style: CustomButtonStyle.lighter,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.primary,
                style: CustomButtonStyle.stroke,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.primary,
                style: CustomButtonStyle.ghost,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.neutral,
                style: CustomButtonStyle.filled,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.neutral,
                style: CustomButtonStyle.lighter,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.neutral,
                style: CustomButtonStyle.stroke,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.neutral,
                style: CustomButtonStyle.ghost,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.filled,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.lighter,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.stroke,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.ghost,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomButtonWidget(
                size: selectedButtonSize,
                disabled: true,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.filled,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                disabled: true,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.lighter,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                disabled: true,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.stroke,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
              const SizedBox(width: 8),
              CustomButtonWidget(
                size: selectedButtonSize,
                disabled: true,
                onPressed: () {},
                type: CustomButtonType.error,
                style: CustomButtonStyle.ghost,
                prefixIcon: Iconsax.arrow_left2,
                suffixIcon: Iconsax.arrow_left1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<CustomButtonSize> sizes = [
    CustomButtonSize.xSmall,
    CustomButtonSize.small,
    CustomButtonSize.medium,
  ];

  Widget linkButtons() {
    return const Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              LinkButtonWidget(),
              LinkButtonWidget(style: LinkButtonStyle.black),
              LinkButtonWidget(style: LinkButtonStyle.gray),
              LinkButtonWidget(style: LinkButtonStyle.error),
              LinkButtonWidget(disabled: true),
            ],
          ),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              LinkButtonWidget(size: LinkButtonSize.small),
              LinkButtonWidget(
                  size: LinkButtonSize.small, style: LinkButtonStyle.black),
              LinkButtonWidget(
                  size: LinkButtonSize.small, style: LinkButtonStyle.gray),
              LinkButtonWidget(
                  size: LinkButtonSize.small, style: LinkButtonStyle.error),
              LinkButtonWidget(size: LinkButtonSize.small, disabled: true),
            ],
          ),
        )
      ],
    );
  }

  Widget fancyButtons() {
    return Column(
      children: [
        Row(
          children: [
            FancyButtonWidget(
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.primary,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.neutral,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.error,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            FancyButtonWidget(
              disabled: true,
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.primary,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              disabled: true,
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.neutral,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              disabled: true,
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.error,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            FancyButtonWidget(
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.primary,
              prefixIcon: Iconsax.arrow_left2,
              suffixIcon: Iconsax.arrow_left1,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.neutral,
              prefixIcon: Iconsax.arrow_left2,
              suffixIcon: Iconsax.arrow_left1,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.error,
              prefixIcon: Iconsax.arrow_left2,
              suffixIcon: Iconsax.arrow_left1,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            FancyButtonWidget(
              disabled: true,
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.primary,
              prefixIcon: Iconsax.arrow_left2,
              suffixIcon: Iconsax.arrow_left1,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              disabled: true,
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.neutral,
              prefixIcon: Iconsax.arrow_left2,
              suffixIcon: Iconsax.arrow_left1,
            ),
            const SizedBox(width: 8),
            FancyButtonWidget(
              disabled: true,
              onPressed: () {},
              size: selectedButtonSize,
              type: CustomButtonType.error,
              prefixIcon: Iconsax.arrow_left2,
              suffixIcon: Iconsax.arrow_left1,
            ),
          ],
        ),
      ],
    );
  }

  Widget compactButtons() {
    return Column(
      children: [
        Row(
          children: [
            CompactButtonWidget(
              onTap: () {},
              icon: Icons.close,
            ),
            const SizedBox(width: 8),
            CompactButtonWidget(
              onTap: () {},
              icon: Icons.close,
              type: CompactButtonType.ghost,
            ),
            const SizedBox(width: 8),
            CompactButtonWidget(
              onTap: () {},
              icon: Icons.close,
              type: CompactButtonType.white,
            ),
            const SizedBox(width: 8),
            CompactButtonWidget(
              disabled: true,
              onTap: () {},
              icon: Icons.close,
              type: CompactButtonType.white,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CompactButtonWidget(
              onTap: () {},
              icon: Icons.close,
              isCircle: true,
            ),
            const SizedBox(width: 8),
            CompactButtonWidget(
              onTap: () {},
              icon: Icons.close,
              type: CompactButtonType.ghost,
              isCircle: true,
            ),
            const SizedBox(width: 8),
            CompactButtonWidget(
              onTap: () {},
              icon: Icons.close,
              type: CompactButtonType.white,
              isCircle: true,
            ),
            const SizedBox(width: 8),
            CompactButtonWidget(
              disabled: true,
              onTap: () {},
              icon: Icons.close,
              type: CompactButtonType.white,
              isCircle: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget socialButtons() {
    return const Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SocialButtonWidget(
                icon: Iconsax.activity,
                label: 'Sign in with Apple',
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.icon,
                icon: Iconsax.activity,
                label: 'Sign in with Apple',
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.stroke,
                icon: Iconsax.activity,
                label: 'Sign in with Apple',
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.strokeIcon,
                icon: Iconsax.activity,
                label: 'Sign in with Apple',
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SocialButtonWidget(
                icon: Iconsax.activity,
                label: 'Sign in with Twitter',
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.icon,
                icon: Iconsax.activity,
                label: 'Sign in with Twitter',
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.stroke,
                icon: Iconsax.activity,
                label: 'Sign in with Twitter',
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.strokeIcon,
                icon: Iconsax.activity,
                label: 'Sign in with Twitter',
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SocialButtonWidget(
                icon: Iconsax.activity,
                label: 'Sign in with Google',
                color: DLSColors.redBase,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.icon,
                icon: Iconsax.activity,
                label: 'Sign in with Google',
                color: DLSColors.redBase,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.stroke,
                icon: Iconsax.activity,
                label: 'Sign in with Google',
                color: DLSColors.redBase,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.strokeIcon,
                icon: Iconsax.activity,
                label: 'Sign in with Google',
                color: DLSColors.redBase,
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SocialButtonWidget(
                icon: Iconsax.activity,
                label: 'Sign in with Facebook',
                color: DLSColors.pacificBlueBase,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.icon,
                icon: Iconsax.activity,
                label: 'Sign in with Facebook',
                color: DLSColors.pacificBlueBase,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.stroke,
                icon: Iconsax.activity,
                label: 'Sign in with Facebook',
                color: DLSColors.pacificBlueBase,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.strokeIcon,
                icon: Iconsax.activity,
                label: 'Sign in with Facebook',
                color: DLSColors.pacificBlueBase,
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SocialButtonWidget(
                icon: Iconsax.activity,
                label: 'Sign in with LinkedIn',
                color: DLSColors.pacificBlueDark,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.icon,
                icon: Iconsax.activity,
                label: 'Sign in with LinkedIn',
                color: DLSColors.pacificBlueDark,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.stroke,
                icon: Iconsax.activity,
                label: 'Sign in with LinkedIn',
                color: DLSColors.pacificBlueDark,
              ),
              SizedBox(width: 8),
              SocialButtonWidget(
                type: SocialButtonType.strokeIcon,
                icon: Iconsax.activity,
                label: 'Sign in with LinkedIn',
                color: DLSColors.pacificBlueDark,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
