import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/features/cart/views/widgets/cart_tab.dart';
import '../../../app/views/widgets/app_custom_header.dart';
import '../widgets/order_history_tab.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const AppCustomHeader(),
              TabBar(
                tabs: [
                  Tab(text: context.l10n.cart),
                  Tab(text: context.l10n.history),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  children: [
                    const CartTab(),
                    OrderHistoryTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
