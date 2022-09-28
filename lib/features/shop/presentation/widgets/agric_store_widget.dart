import 'package:flutter/material.dart';

import '../pages/buy/shop_home.dart';

/// AgricStore Page
class AgricStore extends StatelessWidget {
  /// Constructor
  const AgricStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (context) => const ShopHomeScreen())),
        child: Column(children: [
          ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('AgriStore',
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: const Text('Buy and Sell here'),
              trailing: const Icon(Icons.arrow_forward)),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/agric-store1.jpg')),
                  borderRadius: BorderRadius.circular(20)))
        ]));
  }
}
