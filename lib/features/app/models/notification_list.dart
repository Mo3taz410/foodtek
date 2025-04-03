import 'package:flutter/material.dart';

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
      // ...etc
    ];

    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(item['message']!),
            const SizedBox(height: 4),
            Text(item['time']!,
                style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        );
      },
    );
  }
}
