import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/features/cart/views/widgets/cart_tab.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_custom_header.dart';
import '../widgets/order_history_tab.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String currentPlaceName = "Set your location";

  Future<void> _goToLocationPicker(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/locationPicker');
    if (result is Map && result['placeName'] != null) {
      setState(() {
        currentPlaceName = result['placeName'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppCustomHeader(
                placeName: currentPlaceName,
                onTap: () => _goToLocationPicker(context),
              ),
              TabBar(
                labelColor: AppColors.secondary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.secondary,
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
