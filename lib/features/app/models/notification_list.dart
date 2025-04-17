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
    ];

    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      separatorBuilder: (_, __) =>
          Divider(color: Theme.of(context).colorScheme.outline),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title']!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              item['message']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              item['time']!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: .6),
                  ),
            ),
          ],
        );
      },
    );
  }
}
