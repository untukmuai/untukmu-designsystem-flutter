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
              Container(
                padding: EdgeInsets.all(8),
                child: Text("Content Card"),
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ContentCard(
                      label: 'Label 1',
                      subLabel: '@username',
                      description: 'Description for checkbox 1',
                      isHovered: false,
                      isDisabled: false,
                      badge: badge(),
                      leadingWidget:
                          SvgPicture.asset('assets/svg/ic_mastercard.svg'),
                      trailingWidget: const Icon(
                        Iconsax.close_square,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    ContentCard(
                      label: 'Label 1',
                      subLabel: '@username',
                      description: 'Description for checkbox 1',
                      isHovered: false,
                      isDisabled: false,
                      badge: badge(),
                      leadingWidget:
                          SvgPicture.asset('assets/svg/ic_spotify.svg'),
                      trailingWidget: const Icon(
                        Iconsax.close_square,
                        size: 20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
