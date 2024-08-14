import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class NotificationExamplePage extends StatefulWidget {
  const NotificationExamplePage({super.key});

  @override
  State<NotificationExamplePage> createState() =>
      _NotificationExamplePageState();
}

class _NotificationExamplePageState extends State<NotificationExamplePage> {
  NotificationColor notificationColor = NotificationColor.filled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(title: const Text('Notification')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: notificationColor,
              items: modes
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  notificationColor = value!;
                });
              },
            ),
            Text('X Small Notification', style: DLSTextStyle.labelLarge),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.xsmall,
              type: NotificationType.error,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.xsmall,
              type: NotificationType.warning,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.xsmall,
              type: NotificationType.success,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.xsmall,
              type: NotificationType.info,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.xsmall,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.small),
            Text('Small Notification', style: DLSTextStyle.labelLarge),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.small,
              type: NotificationType.error,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.small,
              type: NotificationType.warning,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.small,
              type: NotificationType.success,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.small,
              type: NotificationType.info,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.small,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.small),
            Text('Large Notification', style: DLSTextStyle.labelLarge),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.large,
              type: NotificationType.error,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.large,
              type: NotificationType.warning,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.large,
              type: NotificationType.success,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.large,
              type: NotificationType.info,
              color: notificationColor,
            ),
            const SizedBox(height: DLSSizing.xSmall),
            CustomNotificationWidget(
              size: NotificationSize.large,
              color: notificationColor,
            ),
          ],
        ),
      ),
    );
  }

  List<NotificationColor> modes = [
    NotificationColor.filled,
    NotificationColor.light,
    NotificationColor.lighter,
    NotificationColor.stroke,
  ];
}
