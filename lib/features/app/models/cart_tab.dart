import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';

import '../../../core/utils/app_colors.dart';
import 'cart_item.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Chicken Burger',
      restaurant: 'Burger Factory LTD',
      price: 20,
      image: AppImageStrings.cheeseBurger,
    ),
    CartItem(
      name: 'Onion Pizza',
      restaurant: 'Pizza Palace',
      price: 15,
      image: AppImageStrings.onionPizza,
    ),
    CartItem(
      name: 'Spicy Shawarma',
      restaurant: 'Hot Cool Spot',
      price: 15,
      image: AppImageStrings.shawarma,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return _buildEmptyState(
        context,
        title: 'Cart Empty',
        subtitle: 'You don’t have add any foods in cart at this time',
      );
    }

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(bottom: 200),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return Dismissible(
              key: Key(item.name),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 20)),
                margin: EdgeInsets.all(responsiveHeight(context, 20)),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) {
                setState(() {
                  cartItems.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} removed from cart')),
                );
              },
              child: _buildCartItem(item),
            );
          },
        ),
        _buildBottomSummary(),
      ],
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(responsiveHeight(context, 20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 22)),
        child: Row(
          children: [
            Image.asset(
              item.image,
              width: responsiveWidth(context, 62),
              height: responsiveHeight(context, 62),
              fit: BoxFit.cover,
            ),
            SizedBox(width: responsiveWidth(context, 20)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(item.restaurant,
                      style: const TextStyle(color: Colors.grey)),
                  Text('\$${item.price}',
                      style: const TextStyle(
                          color: AppColors.tertiary,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: AppColors.secondary),
                  onPressed: () {
                    setState(() {
                      item.quantity =
                          (item.quantity > 1) ? item.quantity - 1 : 1;
                    });
                  },
                ),
                Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add, color: AppColors.secondary),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSummary() {
    final subtotal = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.price * item.quantity,
    );
    const delivery = 10.0;
    const discount = 10.0;
    final total = subtotal + delivery - discount;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSummaryRow('Sub-Total', '\$${subtotal.toStringAsFixed(0)}'),
            _buildSummaryRow(
                'Delivery Charge', '\$${delivery.toStringAsFixed(0)}'),
            _buildSummaryRow('Discount', '-\$${discount.toStringAsFixed(0)}'),
            const Divider(color: Colors.white),
            _buildSummaryRow('Total:', '\$${total.toStringAsFixed(0)}',
                bold: true),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.octonary,
                foregroundColor: AppColors.tertiary,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text("Place My Order"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context,
      {required String title, required String subtitle}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImageStrings.emptyCart,
              height: responsiveHeight(context, 200),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
