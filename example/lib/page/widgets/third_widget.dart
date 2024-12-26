part of '../product_creation_page.dart';

class ThirdWidget extends StatelessWidget {
  const ThirdWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.25,
          decoration: BoxDecoration(
            color: DLSColors.bgSurface700,
            borderRadius: DLSRadius.radius40,
          ),
          padding: const EdgeInsets.fromLTRB(DLSSizing.xLarge,
              DLSSizing.s3xLarge, DLSSizing.xLarge, DLSSizing.large),
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        CustomBadgeWidget(
                          title: 'Rekapan Review',
                          size: CustomBadgeSize.medium,
                          prefixIcon: Icon(
                            IconsaxPlusLinear.flash,
                            color: DLSColors.bgWhite0,
                            size: 14,
                          ),
                          backgroundColor: DLSColors.sunsetYellowBase,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: DLSSizing.xSmall, bottom: DLSSizing.medium),
                      child: Text(
                        'Banyak yang memuji kemampuannya dalam memberikan perbaikan yang nyata pada tekstur dan hidrasi kulit. '
                        'Formula produk yang lembut dan rasa mewahnya telah menjadikannya sebagai pilihan utama dalam rutinitas '
                        'perawatan kulit malam hari bagi banyak orang.',
                        style: DLSTextStyle.titleH3
                            .copyWith(color: DLSColors.textWhite0),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: DLSColors.strokeSoft200,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: DLSSizing.medium),
                      padding: const EdgeInsets.symmetric(
                          vertical: DLSSizing.s3xSmall),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: DLSSizing.s3xSmall,
                                vertical: DLSSizing.xSmall,
                              ),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Image.asset(
                                    'images/gift.png',
                                    width: 48,
                                  ),
                                  const SizedBox(width: DLSSizing.xSmall),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '99%',
                                          style: DLSTextStyle.titleH1.copyWith(
                                              color: DLSColors.textWhite0),
                                        ),
                                        const SizedBox(
                                            height: DLSSizing.s3xSmall),
                                        Text(
                                          'Orang Rekomen Hadiah',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                  color: DLSColors.textSoft400),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: DLSSizing.s3xSmall,
                                vertical: DLSSizing.xSmall,
                              ),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Image.asset(
                                    'images/money.png',
                                    width: 48,
                                  ),
                                  const SizedBox(width: DLSSizing.xSmall),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '98%',
                                          style: DLSTextStyle.titleH1.copyWith(
                                              color: DLSColors.textWhite0),
                                        ),
                                        const SizedBox(
                                            height: DLSSizing.s3xSmall),
                                        Text(
                                          'Orang Mau Beli Lagi',
                                          style: DLSTextStyle.labelSmall
                                              .copyWith(
                                                  color: DLSColors.textSoft400),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth * 0.25,
          padding: const EdgeInsets.fromLTRB(DLSSizing.xLarge,
              DLSSizing.s3xLarge, DLSSizing.xLarge, DLSSizing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '4.7',
                style: DLSTextStyle.display0,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 24),
                            blurRadius: 32,
                            spreadRadius: 0,
                            color: const Color(0xFF000000).withOpacity(0.25),
                          )
                        ]),
                        child: Image.asset(
                          'images/star.png',
                          width: 40,
                        ),
                      ),
                      if (index != 4) const SizedBox(width: DLSSizing.s3xSmall),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: DLSSizing.medium),
              const SizedBox(height: DLSSizing.medium),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const CustomBadgeWidget(
                          title: '3/5',
                          backgroundColor: DLSColors.orchidPurpleLight,
                          textColor: DLSColors.textMain900,
                          size: CustomBadgeSize.medium,
                        ),
                        const SizedBox(height: DLSSizing.s3xSmall),
                        Text(
                          'Efektivitas',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textSoft400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: DLSSizing.s3xSmall),
                    height: 48,
                    width: 1,
                    color: DLSColors.strokeSoft200,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const CustomBadgeWidget(
                          title: '3/5',
                          backgroundColor: DLSColors.orchidPurpleLight,
                          textColor: DLSColors.textMain900,
                          size: CustomBadgeSize.medium,
                        ),
                        const SizedBox(height: DLSSizing.s3xSmall),
                        Text(
                          'Efektivitas',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textSoft400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: DLSSizing.s3xSmall),
                    height: 48,
                    width: 1,
                    color: DLSColors.strokeSoft200,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const CustomBadgeWidget(
                          title: '3/5',
                          backgroundColor: DLSColors.orchidPurpleLight,
                          textColor: DLSColors.textMain900,
                          size: CustomBadgeSize.medium,
                        ),
                        const SizedBox(height: DLSSizing.s3xSmall),
                        Text(
                          'Efektivitas',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textSoft400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: DLSSizing.s3xSmall),
                    height: 48,
                    width: 1,
                    color: DLSColors.strokeSoft200,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const CustomBadgeWidget(
                          title: '3/5',
                          backgroundColor: DLSColors.orchidPurpleLight,
                          textColor: DLSColors.textMain900,
                          size: CustomBadgeSize.medium,
                        ),
                        const SizedBox(height: DLSSizing.s3xSmall),
                        Text(
                          'Efektivitas',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textSoft400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DLSSizing.large),
              Row(
                children: [
                  AvatarGroupWidget(
                    size: AvatarSize.size40,
                    items: [
                      AvatarGroupItemModel(name: 'F'),
                      AvatarGroupItemModel(name: 'W'),
                      AvatarGroupItemModel(name: 'D'),
                      AvatarGroupItemModel(name: 'B'),
                    ],
                  ),
                  const SizedBox(width: DLSSizing.xSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '9,2K+',
                        style: DLSTextStyle.titleH4,
                      ),
                      const SizedBox(height: DLSSizing.s4xSmall),
                      Text(
                        'Review user',
                        style: DLSTextStyle.labelXSmall
                            .copyWith(color: DLSColors.textSoft400),
                      ),
                    ],
                  ),
                  const SizedBox(width: DLSSizing.xSmall),
                  Expanded(
                    child: CustomButtonWidget(
                      onPressed: () {},
                      label: 'Baca Semua',
                      suffixIcon: IconsaxPlusLinear.arrow_right_3,
                      type: CustomButtonType.neutral,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
