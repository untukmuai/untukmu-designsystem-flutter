part of '../product_creation_page.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth * 0.25,
          child: Image.asset('images/fresh-lotus.png'),
        ),
        const SizedBox(width: DLSSizing.s3xSmall),
        Container(
          width: screenWidth * 0.25,
          decoration: BoxDecoration(
            color: DLSColors.bgWeak100,
            borderRadius: DLSRadius.radius40,
          ),
          padding: const EdgeInsets.fromLTRB(DLSSizing.s3xSmall,
              DLSSizing.medium, DLSSizing.s3xSmall, DLSSizing.s3xSmall),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title Section
              SizedBox(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fresh',
                          style: DLSTextStyle.titleH4
                              .copyWith(color: DLSColors.textSoft400),
                        ),
                        const SizedBox(width: DLSSizing.s4xSmall),
                        const CustomCircularAvatarWidget(
                          backgroundColor: DLSColors.verifiedBase,
                          icon: Icon(
                            IconsaxPlusLinear.verify,
                            color: DLSColors.bgWhite0,
                            size: 16,
                          ),
                          avatarSize: AvatarSize.size24,
                        ),
                      ],
                    ),
                    Text(
                      'Lotus Youth Preserve Dream Cream',
                      style: DLSTextStyle.titleH4
                          .copyWith(color: DLSColors.textMain900),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.s3xSmall),
              // Variant Section
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: DLSSizing.s3xSmall),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Variant:',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textMain900),
                        ),
                        const SizedBox(width: DLSSizing.s3xSmall),
                        Text(
                          '2 Ukuran',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textSoft400),
                        ),
                      ],
                    ),
                    const SizedBox(height: DLSSizing.s2xSmall),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomProductTagWidget(
                            text: 'Full Size - 30 ml', selected: true),
                        SizedBox(width: DLSSizing.s3xSmall),
                        CustomProductTagWidget(text: 'Travel  Size - 15 ml'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.s3xSmall),
              // Price Section
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: DLSSizing.small, vertical: DLSSizing.s2xSmall),
                decoration: BoxDecoration(
                  color: DLSColors.bgWhite0,
                  borderRadius: DLSRadius.radius16,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Rp 90.000',
                      style: DLSTextStyle.titleH3,
                    ),
                    const SizedBox(height: DLSSizing.s3xSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rp 100.000',
                              style: DLSTextStyle.labelSmall
                                  .copyWith(color: DLSColors.textSoft400),
                            ),
                            const SizedBox(width: DLSSizing.s4xSmall),
                            const CustomBadgeWidget(
                              title: '10%',
                              size: CustomBadgeSize.medium,
                            )
                          ],
                        ),
                        const CustomBadgeWidget(
                          title: 'Dapatkan cashback Rp50.000',
                          size: CustomBadgeSize.medium,
                          prefixIcon: Icon(
                            IconsaxPlusLinear.money,
                            color: DLSColors.iconSoft400,
                            size: 18,
                          ),
                          style: CustomBadgeStyle.stroke,
                          textColor: DLSColors.textSub500,
                          strokeColor: DLSColors.strokeSoft200,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.s3xSmall),
              // Action Button Section
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: DLSSizing.small, vertical: DLSSizing.s2xSmall),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    CustomButtonWidget(
                      onPressed: () {},
                      icon: IconsaxPlusLinear.heart_add,
                      isIconMode: true,
                      style: CustomButtonStyle.stroke,
                      type: CustomButtonType.neutral,
                      strokeColor: DLSColors.strokeSoft200,
                    ),
                    const SizedBox(width: DLSSizing.s3xSmall),
                    Flexible(
                      flex: 1,
                      child: CustomButtonWidget(
                        onPressed: () {},
                        style: CustomButtonStyle.stroke,
                        label: 'Masukan Keranjang',
                        prefixIcon: IconsaxPlusLinear.bag,
                        prefixPadding: DLSSizing.xSmall,
                      ),
                    ),
                    const SizedBox(width: DLSSizing.s3xSmall),
                    Flexible(
                      flex: 1,
                      child: CustomButtonWidget(
                        onPressed: () {},
                        style: CustomButtonStyle.filled,
                        label: 'Beli Sekarang',
                        filledColor: DLSColors.bgSurface700,
                      ),
                    ),
                  ],
                ),
              ),
              // Smart Summary Section
              Container(
                padding: const EdgeInsets.fromLTRB(DLSSizing.xSmall,
                    DLSSizing.xSmall, DLSSizing.xSmall, DLSSizing.medium),
                decoration: BoxDecoration(
                  borderRadius: DLSRadius.radius32,
                  color: DLSColors.bgWhite0,
                ),
                child: Column(
                  children: [
                    // Main Properties Section
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DLSSizing.s3xSmall,
                        vertical: DLSSizing.xSmall,
                      ),
                      decoration: BoxDecoration(
                        color: DLSColors.bgWeak100,
                        borderRadius: DLSRadius.radius24,
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(DLSSizing.s3xSmall),
                              child: Column(
                                children: [
                                  const CustomCircularAvatarWidget(
                                    avatarSize: AvatarSize.size40,
                                    backgroundColor: DLSColors.bgSoft200,
                                  ),
                                  const SizedBox(height: DLSSizing.s2xSmall),
                                  Text(
                                    'Jenis Kulit',
                                    style: DLSTextStyle.labelSmall,
                                  ),
                                  const SizedBox(height: DLSSizing.s4xSmall),
                                  Text(
                                    'Semua Jenis Kulit',
                                    style: DLSTextStyle.paragraphSmall
                                        .copyWith(color: DLSColors.textSoft400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 90,
                            color: DLSColors.strokeSoft200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: DLSSizing.s3xSmall),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(DLSSizing.s3xSmall),
                              child: Column(
                                children: [
                                  const CustomCircularAvatarWidget(
                                    avatarSize: AvatarSize.size40,
                                    backgroundColor: DLSColors.bgSoft200,
                                  ),
                                  const SizedBox(height: DLSSizing.s2xSmall),
                                  Text(
                                    'Fungsi',
                                    style: DLSTextStyle.labelSmall,
                                  ),
                                  const SizedBox(height: DLSSizing.s4xSmall),
                                  Text(
                                    'Krim Malam',
                                    style: DLSTextStyle.paragraphSmall
                                        .copyWith(color: DLSColors.textSoft400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 90,
                            color: DLSColors.strokeSoft200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: DLSSizing.s3xSmall),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(DLSSizing.s3xSmall),
                              child: Column(
                                children: [
                                  const CustomCircularAvatarWidget(
                                    avatarSize: AvatarSize.size40,
                                    backgroundColor: DLSColors.bgSoft200,
                                  ),
                                  const SizedBox(height: DLSSizing.s2xSmall),
                                  Text(
                                    'Pemakaian',
                                    style: DLSTextStyle.labelSmall,
                                  ),
                                  const SizedBox(height: DLSSizing.s4xSmall),
                                  Text(
                                    'Malam',
                                    style: DLSTextStyle.paragraphSmall
                                        .copyWith(color: DLSColors.textSoft400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: DLSSizing.small),
                    // Properties Section
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'Membantu',
                            style: DLSTextStyle.labelLarge,
                          ),
                          const SizedBox(height: DLSSizing.xSmall),
                          const Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            runSpacing: DLSSizing.s4xSmall,
                            spacing: DLSSizing.s4xSmall,
                            children: [
                              CustomProductTagWidget(
                                text: 'Garis Halus',
                                tagSize: CustomProductTagSize.small,
                                tagColor: CustomProductTagColor.grey,
                              ),
                              CustomProductTagWidget(
                                text: 'Mengencangkan',
                                tagSize: CustomProductTagSize.small,
                                tagColor: CustomProductTagColor.grey,
                              ),
                              CustomProductTagWidget(
                                text: 'Mencerahkan',
                                tagSize: CustomProductTagSize.small,
                                tagColor: CustomProductTagColor.grey,
                              ),
                              CustomProductTagWidget(
                                text: 'Melembapkan',
                                tagSize: CustomProductTagSize.small,
                                tagColor: CustomProductTagColor.grey,
                              ),
                              CustomProductTagWidget(
                                text: 'Exfoliasi',
                                tagSize: CustomProductTagSize.small,
                                tagColor: CustomProductTagColor.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const CustomDividerWidget(verticalSpace: DLSSizing.small),
                    // Properties 2 Section
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'Bahan Aktif',
                            style: DLSTextStyle.labelLarge,
                          ),
                          const SizedBox(height: DLSSizing.s3xSmall),
                          SizedBox(
                            child: Column(
                              children: [
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(
                                            DLSSizing.s2xSmall),
                                        color: DLSColors.bgWhite0,
                                        child: Row(
                                          children: [
                                            const CustomCircularAvatarWidget(
                                              avatarSize: AvatarSize.size40,
                                              backgroundColor:
                                                  DLSColors.bgSoft200,
                                            ),
                                            const SizedBox(
                                                width: DLSSizing.s2xSmall),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Super Lotus',
                                                    style: DLSTextStyle
                                                        .labelSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textMain900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Smooths lines, boosts radiance.',
                                                    style: DLSTextStyle
                                                        .labelXSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textSub500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(
                                            DLSSizing.s2xSmall),
                                        color: DLSColors.bgWhite0,
                                        child: Row(
                                          children: [
                                            const CustomCircularAvatarWidget(
                                              avatarSize: AvatarSize.size40,
                                              backgroundColor:
                                                  DLSColors.bgSoft200,
                                            ),
                                            const SizedBox(
                                                width: DLSSizing.s2xSmall),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Super Lotus',
                                                    style: DLSTextStyle
                                                        .labelSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textMain900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Soothe & comfort to help skin recover overnight.',
                                                    style: DLSTextStyle
                                                        .labelXSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textSub500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const CustomDividerWidget(
                                    verticalSpace: DLSSizing.s3xSmall),
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(
                                            DLSSizing.s2xSmall),
                                        color: DLSColors.bgWhite0,
                                        child: Row(
                                          children: [
                                            const CustomCircularAvatarWidget(
                                              avatarSize: AvatarSize.size40,
                                              backgroundColor:
                                                  DLSColors.bgSoft200,
                                            ),
                                            const SizedBox(
                                                width: DLSSizing.s2xSmall),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Vitamin E',
                                                    style: DLSTextStyle
                                                        .labelSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textMain900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Protect, soothe, and soften the skin.',
                                                    style: DLSTextStyle
                                                        .labelXSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textSub500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(
                                            DLSSizing.s2xSmall),
                                        color: DLSColors.bgWhite0,
                                        child: Row(
                                          children: [
                                            const CustomCircularAvatarWidget(
                                              avatarSize: AvatarSize.size40,
                                              backgroundColor:
                                                  DLSColors.bgSoft200,
                                            ),
                                            const SizedBox(
                                                width: DLSSizing.s2xSmall),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Polyglutamic acid',
                                                    style: DLSTextStyle
                                                        .labelSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textMain900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Moisture skin’s surface, comfort your skin.',
                                                    style: DLSTextStyle
                                                        .labelXSmall
                                                        .copyWith(
                                                      color:
                                                          DLSColors.textSub500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const CustomDividerWidget(verticalSpace: DLSSizing.small),
                    // Properties 3 Section
                    const Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      runSpacing: DLSSizing.s4xSmall,
                      spacing: DLSSizing.s4xSmall,
                      children: [
                        CustomProductTagWidget(
                          text: 'Bebas Gluten',
                          tagSize: CustomProductTagSize.small,
                          tagColor: CustomProductTagColor.grey,
                        ),
                        CustomProductTagWidget(
                          text: 'Bebas Paraben',
                          tagSize: CustomProductTagSize.small,
                          tagColor: CustomProductTagColor.grey,
                        ),
                        CustomProductTagWidget(
                          text: 'Bebas Sulfat',
                          tagSize: CustomProductTagSize.small,
                          tagColor: CustomProductTagColor.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
