import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID and time
            Row(
              children: const [
                Icon(Icons.shopping_bag_outlined,
                    size: 40, color: Colors.orange),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order ID",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    Text(
                      "#6579-6432",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text("25m", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Status timeline
            _buildStep(context, true, Icons.check, "Order received"),
            _buildStep(context, true, Icons.restaurant, "Cooking your order"),
            _buildStep(context, true, Icons.delivery_dining,
                "Courier is picking up order"),
            _buildStep(context, false, Icons.home_outlined, "Order delivered"),

            const SizedBox(height: 32),

            // Driver info
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/driver.png'),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Delivery Hero",
                        style: TextStyle(color: Colors.grey)),
                    Row(
                      children: [
                        Text(
                          "Aleksandr V.",
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        SizedBox(width: 4),
                        Text("4.9", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.call, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.orange),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text("your location", style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "123 Al-Madina Street, Abdali, Amman, Jordan",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Live track button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.pop(context); // or navigate to tracking map
                },
                child: const Text("Live Track", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(
      BuildContext context, bool done, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 16),
      child: Row(
        children: [
          Column(
            children: [
              Icon(icon, color: done ? Colors.green : Colors.grey),
              if (label != "Order delivered")
                Container(
                  width: 2,
                  height: 40,
                  color: done ? Colors.green : Colors.grey.shade300,
                ),
            ],
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: done ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
