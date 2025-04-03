import 'package:flutter/material.dart';

import 'notification_list.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8, // الارتفاع (80% من الشاشة)
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Notifications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Unread'),
                  Tab(text: 'Read'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    NotificationList(controller: scrollController),
                    NotificationList(controller: scrollController),
                    NotificationList(controller: scrollController),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
