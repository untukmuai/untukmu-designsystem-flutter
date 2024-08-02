import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum PaymentIconsType {
  water,
  gas,
  electricity,
  donation,
  internet,
  phone,
  rent,
  tax
}

class PaymentIcons extends StatefulWidget {
  final PaymentIconsType paymentIconsType;
  const PaymentIcons({super.key, required this.paymentIconsType});

  @override
  State<PaymentIcons> createState() => _PaymentIconsState();
}

class _PaymentIconsState extends State<PaymentIcons> {
  late Color iconColor;
  late Color backgroundColor;
  late String icon;

  void changeIconAndBackgroundColor(PaymentIconsType paymentIconType) {
    switch (paymentIconType) {
      case PaymentIconsType.water:
        iconColor = DLSColors.tealDarker;
        backgroundColor = DLSColors.tealLight;
        icon = "drop.svg";
        break;
      case PaymentIconsType.gas:
        iconColor = DLSColors.redDarker;
        backgroundColor = DLSColors.redLight;
        icon = "fire-fill.svg";
        break;
      case PaymentIconsType.electricity:
        iconColor = DLSColors.orangeDarker;
        backgroundColor = DLSColors.orangeLight;
        icon = "lamp-charge.svg";
        break;
      case PaymentIconsType.donation:
        iconColor = DLSColors.flamingoPinkDarker;
        backgroundColor = DLSColors.flamingoPinkLight;
        icon = "heart-circle.svg";
        break;
      case PaymentIconsType.internet:
        iconColor = DLSColors.pacificBlueDarker;
        backgroundColor = DLSColors.pacificBlueLight;
        icon = "wifi.svg";
        break;
      case PaymentIconsType.phone:
        iconColor = DLSColors.sunsetYellowDarker;
        backgroundColor = DLSColors.sunsetYellowLight;
        icon = "mobile.svg";
        break;
      case PaymentIconsType.rent:
        iconColor = DLSColors.greenDarker;
        backgroundColor = DLSColors.greenLight;
        icon = "home.svg";
        break;
      case PaymentIconsType.tax:
        iconColor = DLSColors.orchidPurpleDarker;
        backgroundColor = DLSColors.orchidPurpleLight;
        icon = "document-text.svg";
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    changeIconAndBackgroundColor(widget.paymentIconsType);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(96)),
      ),
      child: SvgPicture.asset(
          "packages/untukmu_flutter_design_system/assets/icons/$icon"),
    );
  }
}
