import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/features/cart/views/widgets/cart_tab.dart';
import '../../../../core/theme/app_colors/app_light_colors.dart';
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
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              AppCustomHeader(),
              TabBar(
                labelColor: AppLightColors.secondary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppLightColors.secondary,
                tabs: [
                  Tab(
                    text: context.l10n.cart,
                  ),
                  Tab(text: context.l10n.history),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CartTab(),
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
