import 'package:example/base_component/password_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
              hintTest(),
              const Divider(),
              keyIcons(),
              const Divider(),
              paymenIcons(),
              const Divider(),
              passwordCheck(),
              const Divider(),
              legends(),
              const Divider(),
              legendsDots(),
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
                  LabelWidget(label: "Label"),
                  SizedBox(width: 8),
                  LabelWidget(
                      label: "Mandatory", labelType: LabelType.mandatory),
                  SizedBox(width: 8),
                  LabelWidget(label: "Optional", labelType: LabelType.optional),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  LabelWidget(label: "Label", isDisabled: true),
                  SizedBox(width: 8),
                  LabelWidget(
                      label: "Mandatory",
                      labelType: LabelType.mandatory,
                      isDisabled: true),
                  SizedBox(width: 8),
                  LabelWidget(
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
              const ContentLabelWidget(
                label: 'Label',
                description: 'Insert description right here',
              ),
              const SizedBox(height: 16),
              ContentLabelWidget(
                label: 'Label',
                description: 'Insert description right here',
                leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
              ),
              const SizedBox(height: 16),
              const ContentLabelWidget(
                label: 'Label',
                description: 'Insert description right here',
                leadingWidget:
                    KeyIconsWidget(icon: Icon((IconsaxPlusLinear.user))),
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
              ContentCardWidget(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                leadingWidget:
                    const KeyIconsWidget(icon: Icon((IconsaxPlusLinear.user))),
                trailingWidget: const Icon(
                  IconsaxPlusLinear.close_square,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              ContentCardWidget(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                trailingWidget: const Icon(
                  IconsaxPlusLinear.close_square,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              ContentCardWidget(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                leadingWidget: SvgPicture.asset('assets/svg/ic_mastercard.svg'),
                trailingWidget: const Icon(
                  IconsaxPlusLinear.close_square,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              ContentCardWidget(
                label: 'Label',
                subLabel: '@username',
                description: 'Insert description right here',
                isHovered: false,
                isDisabled: false,
                badge: badge(),
                leadingWidget: SvgPicture.asset('assets/svg/ic_spotify.svg'),
                trailingWidget: const Icon(
                  IconsaxPlusLinear.close_square,
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
                    KeyIconsWidget(icon: Icon((IconsaxPlusLinear.user))),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.pacificBlueBase)),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.sunsetYellowBase)),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.redBase)),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.greenDark)),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.orangeBase)),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.flamingoPinkBase)),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.tealBase))
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    KeyIconsWidget(icon: Icon((IconsaxPlusLinear.user))),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                      icon: Icon((IconsaxPlusLinear.user),
                          color: DLSColors.pacificBlueDark),
                      backgroundColor: DLSColors.pacificBlueLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                      icon: Icon((IconsaxPlusLinear.user),
                          color: DLSColors.sunsetYellowDark),
                      backgroundColor: DLSColors.sunsetYellowLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                      icon: Icon((IconsaxPlusLinear.user),
                          color: DLSColors.redDark),
                      backgroundColor: DLSColors.redLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                      icon: Icon((IconsaxPlusLinear.user),
                          color: DLSColors.greenDark),
                      backgroundColor: DLSColors.greenLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                      icon: Icon((IconsaxPlusLinear.user),
                          color: DLSColors.orangeDark),
                      backgroundColor: DLSColors.orangeLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                      icon: Icon((IconsaxPlusLinear.user),
                          color: DLSColors.flamingoPinkDark),
                      backgroundColor: DLSColors.flamingoPinkLighter,
                    ),
                    SizedBox(width: 8),
                    KeyIconsWidget(
                        icon: Icon((IconsaxPlusLinear.user),
                            color: DLSColors.tealBase))
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
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.water,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.gas,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.electricity,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.donation,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.internet,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.phone,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.rent,
                ),
                SizedBox(width: 8),
                PaymentIconsWidget(
                  paymentIconsType: PaymentIconsType.tax,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget hintTest() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hint Text",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "The text that supports and is positioned below various components, such as text inputs and dropdowns.",
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
              HintTextWidget(hint: "This is a hint text to help user."),
              SizedBox(height: 8),
              HintTextWidget(
                  hint: "This is a hint text to help user.",
                  hintState: HintState.error),
              SizedBox(height: 8),
              HintTextWidget(
                hint: "This is a hint text to help user.",
                hintState: HintState.disabled,
              ),
              SizedBox(height: 8),
              HintTextWidget(
                hint: "Suggested:",
                suggestions: "london, berlin, tokyo, paris",
              ),
              SizedBox(height: 8),
              HintTextWidget(
                hint: "Suggested:",
                suggestions: "london, berlin, tokyo, paris",
                hintState: HintState.error,
              ),
              SizedBox(height: 8),
              HintTextWidget(
                hint: "Suggested:",
                suggestions: "london, berlin, tokyo, paris",
                hintState: HintState.disabled,
              ),
              SizedBox(height: 8),
            ],
          ),
        )
      ],
    );
  }

  Widget passwordCheck() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password Strength",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "The component that displays the level of password security, positioned below the password input.",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        const PasswordCheckerExample(),
      ],
    );
  }

  Widget legends() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chart Legends",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "Designed to complement charts with distinct colors, providing a visual guide to interpreting data.",
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
                LegendWidget(color: DLSColors.pacificBlueBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(
                    color: DLSColors.sunsetYellowBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(color: DLSColors.orangeBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(color: DLSColors.redBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(color: DLSColors.greenBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(
                    color: DLSColors.orchidPurpleBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(
                    color: DLSColors.flamingoPinkBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(color: DLSColors.tealBase, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(color: DLSColors.iconSub500, label: 'Legend'),
                SizedBox(width: 16),
                LegendWidget(color: DLSColors.iconDisabled300, label: 'Legend'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget legendsDots() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chart Legends Dots",
                style: DLSTextStyle.labelLarge,
              ),
              Text(
                "Available in various colors to complement the chart legends component..",
                style: DLSTextStyle.labelMedium
                    .copyWith(color: DLSColors.textSub500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LegendWidget(color: DLSColors.pacificBlueBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.sunsetYellowBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.orangeBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.redBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.greenBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.orchidPurpleBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.flamingoPinkBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.tealBase),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.iconSub500),
              SizedBox(width: 16),
              LegendWidget(color: DLSColors.iconDisabled300),
            ],
          ),
        ),
      ],
    );
  }
}
