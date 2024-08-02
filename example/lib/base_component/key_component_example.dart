import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class KeyComponentExample extends StatelessWidget {
  const KeyComponentExample({super.key});

  Widget badge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: DLSColors.pacificBlueLight,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'new',
            textAlign: TextAlign.center,
            style: DLSTextStyle.paragraphSmall
                .copyWith(height: 0.14, color: DLSColors.textSub500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DLSColors.bgWhite0,
        appBar: AppBar(title: const Text('Key Component')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              label(),
              const Divider(),
              contentLabel(),
              const Divider(),
              contentCard(),
              const Divider(),
              keyIcons(),
              const Divider(),
              paymenIcons()
            ],
          ),
        ));
  }

  Widget label() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Label",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "A simple method for displaying important text, enhanced with various accompanying elements.",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Row(
                children: [
                  Label(label: "Label"),
                  SizedBox(width: 8),
                  Label(label: "Mandatory", labelType: LabelType.mandatory),
                  SizedBox(width: 8),
                  Label(label: "Optional", labelType: LabelType.optional),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Label(label: "Label", isDisabled: true),
                  SizedBox(width: 8),
                  Label(
                      label: "Mandatory",
                      labelType: LabelType.mandatory,
                      isDisabled: true),
                  SizedBox(width: 8),
                  Label(
                      label: "Optional",
                      labelType: LabelType.optional,
                      isDisabled: true),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget contentLabel() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Content Label",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "An effective way to display text and descriptions with the options of adding an icon, avatar, and more.",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ContentLabel(
                label: 'Label',
                description: 'Insert description right here',
              ),
              const SizedBox(height: 16),
              ContentLabel(
                label: 'Label',
                description: 'Insert description right here',
                leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
              ),
              const SizedBox(height: 16),
              const ContentLabel(
                label: 'Label',
                description: 'Insert description right here',
                leadingWidget: KeyIcons(icon: Icon((Iconsax.user))),
              ),
              const SizedBox(height: 16),
            ],
          ),
        )
      ],
    );
  }

  Widget contentCard() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Content Card",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "An effective way to display text and descriptions within a card, with the option to add an icon, avatar, and more.",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ContentCard(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                leadingWidget: const KeyIcons(icon: Icon((Iconsax.user))),
                trailingWidget: const Icon(
                  Iconsax.close_square,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              ContentCard(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                trailingWidget: const Icon(
                  Iconsax.close_square,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              ContentCard(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                leadingWidget: SvgPicture.asset('assets/svg/ic_mastercard.svg'),
                trailingWidget: const Icon(
                  Iconsax.close_square,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              ContentCard(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
                trailingWidget: const Icon(
                  Iconsax.close_square,
                  size: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget keyIcons() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Key Icons",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "Icons designed for versatile use, offering options for styles, colors, and sizes in various situations.",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: [
                    KeyIcons(icon: Icon((Iconsax.user))),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user),
                            color: DLSColors.pacificBlueBase)),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user),
                            color: DLSColors.sunsetYellowBase)),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user), color: DLSColors.redBase)),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user), color: DLSColors.greenDark)),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon:
                            Icon((Iconsax.user), color: DLSColors.orangeBase)),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user),
                            color: DLSColors.flamingoPinkBase)),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user), color: DLSColors.tealBase))
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    KeyIcons(icon: Icon((Iconsax.user))),
                    SizedBox(width: 8),
                    KeyIcons(
                      icon: Icon((Iconsax.user),
                          color: DLSColors.pacificBlueDark),
                      backgroundColor: DLSColors.pacificBlueLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIcons(
                      icon: Icon((Iconsax.user),
                          color: DLSColors.sunsetYellowDark),
                      backgroundColor: DLSColors.sunsetYellowLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIcons(
                      icon: Icon((Iconsax.user), color: DLSColors.redDark),
                      backgroundColor: DLSColors.redLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIcons(
                      icon: Icon((Iconsax.user), color: DLSColors.greenDark),
                      backgroundColor: DLSColors.greenLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIcons(
                      icon: Icon((Iconsax.user), color: DLSColors.orangeDark),
                      backgroundColor: DLSColors.orangeLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIcons(
                      icon: Icon((Iconsax.user),
                          color: DLSColors.flamingoPinkDark),
                      backgroundColor: DLSColors.flamingoPinkLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIcons(
                        icon: Icon((Iconsax.user), color: DLSColors.tealBase))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget paymenIcons() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Icons",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "Icons specifically designed for displaying payment-related information.",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.water,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.gas,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.electricity,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.donation,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.internet,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.phone,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.rent,
                ),
                SizedBox(width: 8),
                PaymentIcons(
                  paymentIconsType: PaymentIconsType.tax,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
