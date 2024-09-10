part of '../product_creation_page.dart';

class SecondWidget extends StatelessWidget {
  const SecondWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.25,
          decoration: BoxDecoration(
            color: DLSColors.bgWeak100,
            borderRadius: DLSRadius.radius40,
          ),
          padding: const EdgeInsets.fromLTRB(DLSSizing.xLarge,
              DLSSizing.s3xLarge, DLSSizing.xLarge, DLSSizing.large),
          child: Column(
            children: [
              // Description Section
              SizedBox(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        CustomBadgeWidget(
                          title: 'Deskripsi Produk',
                          size: CustomBadgeSize.medium,
                          prefixIcon: Icon(
                            Iconsax.flash,
                            color: DLSColors.bgWhite0,
                            size: 14,
                          ),
                          backgroundColor: DLSColors.sunsetYellowBase,
                        ),
                      ],
                    ),
                    const SizedBox(height: DLSSizing.xSmall),
                    Text(
                      'Krim malam yang menenangkan yang membantu memulihkan dan mengurangi '
                      'tanda-tanda kelelahan sambil menghaluskan garis halus dan meningkatkan '
                      'kecerahan kulit.',
                      style: DLSTextStyle.titleH3,
                    ),
                    const SizedBox(height: DLSSizing.large),
                    CustomDividerWidget(
                      centerWidget: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: DLSSizing.s2xSmall),
                        padding: const EdgeInsets.all(DLSSizing.s3xSmall),
                        decoration: BoxDecoration(
                            borderRadius: DLSRadius.radiusFull,
                            border: Border.all(color: DLSColors.strokeSoft200)),
                        child: Text(
                          'Read More',
                          style: DLSTextStyle.labelSmall
                              .copyWith(color: DLSColors.textSub500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.medium),
              // Action Section
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(DLSSizing.xSmall),
                            decoration: BoxDecoration(
                              color: DLSColors.bgWhite0,
                              borderRadius: DLSRadius.radius24,
                            ),
                            height: 230,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bahan Baku',
                                  style: DLSTextStyle.labelLarge,
                                ),
                                const SizedBox(height: DLSSizing.medium),
                                const Wrap(
                                  spacing: DLSSizing.s4xSmall,
                                  runSpacing: DLSSizing.s4xSmall,
                                  children: [
                                    CustomTagWidget(label: 'Glycerin'),
                                    CustomTagWidget(label: 'Shea Butter'),
                                    CustomTagWidget(
                                        label: 'Tocopheryl Acetate'),
                                    CustomTagWidget(
                                        label:
                                            'Nelumbo Nucifera (Lotus) Extract'),
                                    CustomBadgeWidget(
                                      title: '34+',
                                      size: CustomBadgeSize.medium,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: DLSSizing.s3xSmall),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(DLSSizing.xSmall),
                            decoration: BoxDecoration(
                              color: DLSColors.bgWhite0,
                              borderRadius: DLSRadius.radius24,
                            ),
                            height: 230,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cara Pakai',
                                  style: DLSTextStyle.labelLarge,
                                ),
                                const SizedBox(height: DLSSizing.medium),
                                Row(
                                  children: [
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: DLSSizing.s3xLarge,
                                        maxHeight: DLSSizing.s3xLarge,
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: DLSSizing.s3xSmall),
                                      decoration: BoxDecoration(
                                        borderRadius: DLSRadius.radiusFull,
                                        border: Border.all(
                                            color: DLSColors.strokeSoft200),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: DLSTextStyle.display2,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Apply to clean skin before bed',
                                        style: DLSTextStyle.paragraphSmall
                                            .copyWith(
                                          color: DLSColors.textSoft400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: DLSSizing.xSmall),
                                CustomDividerWidget(
                                  centerWidget: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: DLSSizing.s2xSmall),
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: DLSColors.strokeSoft200,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(
                                              DLSSizing.s4xSmall),
                                          decoration: const BoxDecoration(
                                            color: DLSColors.bgWhite0,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              bottomLeft: Radius.circular(6),
                                            ),
                                          ),
                                          child: const Icon(
                                            Iconsax.arrow_left,
                                            size: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 1),
                                        Container(
                                          padding: const EdgeInsets.all(
                                              DLSSizing.s4xSmall),
                                          decoration: const BoxDecoration(
                                            color: DLSColors.bgWhite0,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(6),
                                              bottomRight: Radius.circular(6),
                                            ),
                                          ),
                                          child: const Icon(
                                            Iconsax.arrow_right_1,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.s3xSmall),
              Container(
                padding: const EdgeInsets.fromLTRB(DLSSizing.s3xSmall,
                    DLSSizing.medium, DLSSizing.s3xSmall, DLSSizing.s3xSmall),
                decoration: BoxDecoration(
                  color: DLSColors.bgWhite0,
                  borderRadius: DLSRadius.radius24,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: DLSSizing.xSmall),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomBadgeWidget(
                              title: 'Gift Set',
                              backgroundColor: DLSColors.orchidPurpleBase,
                              size: CustomBadgeSize.medium,
                            ),
                            const SizedBox(height: DLSSizing.xSmall),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Smooth, Radiant Skin Ritual',
                                  style: DLSTextStyle.labelLarge
                                      .copyWith(color: DLSColors.textSub500),
                                ),
                                const SizedBox(height: DLSSizing.xSmall),
                                Text(
                                  'Rp 1.764.000',
                                  style: DLSTextStyle.titleH4,
                                ),
                                const SizedBox(height: DLSSizing.s3xSmall),
                                CustomTagWidget(
                                  label: 'Value of Rp 2.520.000',
                                  textStyle: DLSTextStyle.labelXSmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: DLSSizing.xSmall),
                    Image.asset('images/lotus-gift.png'),
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.medium),
              const CustomAccordionWidget(
                disableHover: true,
                prefixIcon: Iconsax.add,
                title: 'Spesifikasi Produk',
                content:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Aliquam consequat nulla ac sem efficitur, viverra suscipit nibh convallis. '
                    'Maecenas tincidunt congue ligula, sit amet scelerisque lectus maximus eu. Nam et justo sem.',
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth * 0.25,
          decoration: BoxDecoration(borderRadius: DLSRadius.radius40),
          padding: const EdgeInsets.fromLTRB(
              DLSSizing.s3xSmall, 0, DLSSizing.s3xSmall, DLSSizing.s3xSmall),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.25,
                height: screenWidth * 0.25,
                decoration: BoxDecoration(
                    borderRadius: DLSRadius.radius32,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/face.png'))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CustomCircularAvatarWidget(
                      backgroundColor: DLSColors.bgSoft200,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            (screenWidth * 0.25) * 0.1,
                            DLSSizing.xSmall,
                            DLSSizing.xSmall,
                            DLSSizing.xSmall),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Fresh',
                                  style: DLSTextStyle.titleH3
                                      .copyWith(color: DLSColors.textWhite0),
                                ),
                                const SizedBox(width: DLSSizing.s4xSmall),
                                const CustomCircularAvatarWidget(
                                  backgroundColor: DLSColors.verifiedBase,
                                  icon: Icon(
                                    Iconsax.verify5,
                                    color: DLSColors.bgWhite0,
                                    size: 12,
                                  ),
                                  avatarSize: AvatarSize.size20,
                                ),
                              ],
                            ),
                            const SizedBox(height: DLSSizing.s3xSmall),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                const Flexible(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Icon(Iconsax.location5),
                                      SizedBox(height: DLSSizing.s3xSmall),
                                      Text('Jakarta Selatan'),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: CustomButtonWidget(
                                    onPressed: () {},
                                    style: CustomButtonStyle.filled,
                                    prefixIcon: Iconsax.add_circle,
                                    label: 'Ikuti',
                                    filledColor: DLSColors.bgSurface700,
                                  ),
                                ),
                                const SizedBox(width: DLSSizing.s3xSmall),
                                CustomButtonWidget(
                                  onPressed: () {},
                                  style: CustomButtonStyle.filled,
                                  isIconMode: true,
                                  icon: Iconsax.messages_2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: DLSSizing.small),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: DLSSizing.s3xSmall),
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
                        height: screenHeight * 0.14,
                        child: Column(
                          children: [
                            Text(
                              '4.5K',
                              style: DLSTextStyle.titleH1,
                            ),
                            const SizedBox(height: DLSSizing.xSmall),
                            Text(
                              'Pengikut',
                              style: DLSTextStyle.labelSmall
                                  .copyWith(color: DLSColors.textSoft400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: screenHeight * 0.14,
                      margin: const EdgeInsets.symmetric(
                          horizontal: DLSSizing.s3xSmall),
                      color: DLSColors.strokeSub300,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DLSSizing.s3xSmall,
                          vertical: DLSSizing.xSmall,
                        ),
                        height: screenHeight * 0.14,
                        child: Column(
                          children: [
                            Text(
                              '98%',
                              style: DLSTextStyle.titleH1,
                            ),
                            const SizedBox(height: DLSSizing.xSmall),
                            Text(
                              'Tingkat Kepuasan',
                              style: DLSTextStyle.labelSmall
                                  .copyWith(color: DLSColors.textSoft400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: DLSSizing.s3xSmall),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DLSSizing.s3xSmall,
                          vertical: DLSSizing.xSmall,
                        ),
                        height: screenHeight * 0.14,
                        decoration: BoxDecoration(
                          borderRadius: DLSRadius.radius24,
                          color: DLSColors.bgSurface700,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '4.5',
                              style: DLSTextStyle.titleH1
                                  .copyWith(color: DLSColors.textWhite0),
                            ),
                            const SizedBox(height: DLSSizing.xSmall),
                            Text(
                              'Rata-Rata Ulasan',
                              style: DLSTextStyle.labelSmall
                                  .copyWith(color: DLSColors.textWhite0),
                            ),
                            const SizedBox(height: DLSSizing.s4xSmall),
                            Text(
                              '234 Reviews',
                              style: DLSTextStyle.labelXSmall
                                  .copyWith(color: DLSColors.textDisabled300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: DLSSizing.small),
                padding: const EdgeInsets.fromLTRB(DLSSizing.s3xSmall,
                    DLSSizing.xSmall, DLSSizing.s3xSmall, DLSSizing.s3xSmall),
                decoration: BoxDecoration(
                    borderRadius: DLSRadius.radius16,
                    border: Border.all(color: DLSColors.strokeSoft200)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Pengiriman',
                            style: DLSTextStyle.labelLarge,
                          ),
                        ),
                        const LinkButtonWidget(
                          label: 'Lihat Pilihan Kurir',
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: DLSSizing.xSmall),
                      padding: const EdgeInsets.all(DLSSizing.s3xSmall),
                      decoration: BoxDecoration(
                          borderRadius: DLSRadius.radius8,
                          color: DLSColors.bgWeak100),
                      child: Row(
                        children: [
                          const Flexible(
                            flex: 1,
                            child: CustomDropdownWidget(
                              label: 'Dikirim ke',
                              hintText: 'Pilih Alamat',
                              items: [
                                'Rumah Feriyal',
                                'Kantor',
                              ],
                            ),
                          ),
                          const SizedBox(width: DLSSizing.medium),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.clock,
                                      size: 16,
                                      color: DLSColors.iconSoft400,
                                    ),
                                    const SizedBox(width: DLSSizing.s3xSmall),
                                    Text(
                                      'Tiba Besok',
                                      style: DLSTextStyle.labelMedium.copyWith(
                                          color: DLSColors.textSub500),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: DLSSizing.s3xSmall),
                                  height: 1,
                                  color: DLSColors.strokeSoft200,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.truck_fast,
                                      size: 16,
                                      color: DLSColors.iconSoft400,
                                    ),
                                    const SizedBox(width: DLSSizing.s3xSmall),
                                    Text(
                                      'Rp 8.000',
                                      style: DLSTextStyle.labelMedium.copyWith(
                                          color: DLSColors.textSub500),
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
          ),
        ),
      ],
    );
  }
}
