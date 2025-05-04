import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/responsive.dart';

class NotificationList extends StatelessWidget {
  final ScrollController controller;
  const NotificationList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Delayed Order',
        'message': 'Order is late. ETA: 10:30 PM',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Promotional Offer',
        'message': '🍔 Get 20% off your next order!',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Delayed Order',
        'message': 'Order is late. ETA: 10:30 PM',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Promotional Offer',
        'message': '🍔 Get 20% off your next order!',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Delayed Order',
        'message': 'Order is late. ETA: 10:30 PM',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Promotional Offer',
        'message': '🍔 Get 20% off your next order!',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Delayed Order',
        'message': 'Order is late. ETA: 10:30 PM',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Promotional Offer',
        'message': '🍔 Get 20% off your next order!',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Delayed Order',
        'message': 'Order is late. ETA: 10:30 PM',
        'time': 'Last Wednesday at 9:42 AM',
      },
      {
        'title': 'Promotional Offer',
        'message': '🍔 Get 20% off your next order!',
        'time': 'Last Wednesday at 9:42 AM',
      },
    ];

    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Column(
          spacing: responsiveHeight(context, 4),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title']!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              item['message']!,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              item['time']!,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        );
      },
    );
  }
}
