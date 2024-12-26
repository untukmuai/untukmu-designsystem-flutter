part of '../product_creation_page.dart';

class FourthWidget extends StatelessWidget {
  const FourthWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.5,
          decoration: BoxDecoration(
            color: DLSColors.bgWeak100,
            borderRadius: DLSRadius.radius40,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: DLSSizing.medium),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Produk Lain Dari',
                            style: DLSTextStyle.titleH4,
                          ),
                          const SizedBox(width: DLSSizing.xSmall),
                          const CustomProductTagWidget(
                            text: 'Fresh',
                            tagColor: CustomProductTagColor.grey,
                            backgroundColor: DLSColors.bgStrong900,
                            textColor: DLSColors.textWhite0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: DLSSizing.xSmall,
                        bottom: DLSSizing.medium,
                        right: DLSSizing.s3xSmall,
                      ),
                      child: Row(
                        children: [
                          CustomButtonWidget(
                            onPressed: () {},
                            type: CustomButtonType.neutral,
                            style: CustomButtonStyle.stroke,
                            isIconMode: true,
                            icon: IconsaxPlusLinear.arrow_left_2,
                          ),
                          CustomButtonWidget(
                            onPressed: () {},
                            type: CustomButtonType.neutral,
                            style: CustomButtonStyle.stroke,
                            isIconMode: true,
                            icon: IconsaxPlusLinear.arrow_right_3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(DLSSizing.s3xSmall),
                margin: const EdgeInsets.fromLTRB(
                    DLSSizing.xSmall, 0, DLSSizing.xSmall, DLSSizing.xSmall),
                decoration: BoxDecoration(
                  color: DLSColors.bgWhite0,
                  borderRadius: DLSRadius.radius40,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.5 * 0.2),
                            decoration: BoxDecoration(
                              borderRadius: DLSRadius.radius24,
                              color: DLSColors.bgSoft200,
                            ),
                            child: Image.asset('images/face.png'),
                          ),
                          Text(
                            'Lotus AHA Gentle Resurfacing Serum',
                            style: DLSTextStyle.labelLarge
                                .copyWith(color: DLSColors.textSub500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp 90.000',
                                style: DLSTextStyle.titleH3,
                              ),
                              const SizedBox(height: DLSSizing.s3xSmall),
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: DLSSizing.s3xSmall),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.5 * 0.2),
                            decoration: BoxDecoration(
                              borderRadius: DLSRadius.radius24,
                              color: DLSColors.bgSoft200,
                            ),
                            child: Image.asset('images/face.png'),
                          ),
                          Text(
                            'Lotus AHA Gentle Resurfacing Serum',
                            style: DLSTextStyle.labelLarge
                                .copyWith(color: DLSColors.textSub500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp 90.000',
                                style: DLSTextStyle.titleH3,
                              ),
                              const SizedBox(height: DLSSizing.s3xSmall),
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: DLSSizing.s3xSmall),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.5 * 0.2),
                            decoration: BoxDecoration(
                              borderRadius: DLSRadius.radius24,
                              color: DLSColors.bgSoft200,
                            ),
                            child: Image.asset('images/face.png'),
                          ),
                          Text(
                            'Lotus AHA Gentle Resurfacing Serum',
                            style: DLSTextStyle.labelLarge
                                .copyWith(color: DLSColors.textSub500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp 90.000',
                                style: DLSTextStyle.titleH3,
                              ),
                              const SizedBox(height: DLSSizing.s3xSmall),
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: DLSSizing.s3xSmall),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.5 * 0.2),
                            decoration: BoxDecoration(
                              borderRadius: DLSRadius.radius24,
                              color: DLSColors.bgSoft200,
                            ),
                            child: Image.asset('images/face.png'),
                          ),
                          Text(
                            'Lotus AHA Gentle Resurfacing Serum',
                            style: DLSTextStyle.labelLarge
                                .copyWith(color: DLSColors.textSub500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp 90.000',
                                style: DLSTextStyle.titleH3,
                              ),
                              const SizedBox(height: DLSSizing.s3xSmall),
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
