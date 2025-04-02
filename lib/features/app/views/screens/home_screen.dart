import 'package:flutter/material.dart';

final List<Map<String, String>> categories = [
  {'image': '', 'label': 'All'},
  {'image': 'assets/icons/food/burger.png', 'label': 'Burger'},
  {'image': 'assets/icons/food/pizza.png', 'label': 'Pizza'},
  {'image': 'assets/icons/food/sandwich.png', 'label': 'Sandwich'},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text('3zzz'),
            SizedBox(
              height: 10,
            ),
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Row(
                          children: [
                            if (categories[index]['image']!.isNotEmpty)
                              Image.asset(
                                categories[index]['image']!,
                                width: 50,
                                height: 50,
                              ),
                            if (categories[index]['image']!.isNotEmpty)
                              const SizedBox(width: 6),
                            Text(
                              categories[index]['label']!,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
