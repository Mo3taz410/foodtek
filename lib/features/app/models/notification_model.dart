import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'notification_list.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: .3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  context.l10n.notifications,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TabBar(
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: .6),
                  tabs: [
                    Tab(text: context.l10n.all),
                    Tab(text: context.l10n.unread),
                    Tab(text: context.l10n.read),
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
          ),
        );
      },
    );
  }
}
