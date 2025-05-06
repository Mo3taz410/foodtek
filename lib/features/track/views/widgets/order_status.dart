import 'package:flutter/material.dart';

import '../../../chat/views/screen/chat_screen.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/driver.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Your delivery hero",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      "Waseem",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(
                      "4.9",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.message,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatScreen()),
                  );
                }),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(width: 5),
            Expanded(
              child: Text(
                "Your Location ",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: Colors.green,
            ),
            SizedBox(width: 2),
            Expanded(
              child: Text(
                "Ahmad alAwazem Street, Yasmeen, Amman, Jordan",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
