import 'package:flutter/material.dart';

/// order success page
class OrderSuccess extends StatelessWidget {
  /// Constructor
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
          flex: 3,
          child:
              Container(child: Image.asset('assets/images/wallet_illu.png'))),
      Expanded(
          flex: 2,
          child: Container(
              child: Column(children: [
            Text('Order Successful',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                    'Thank you for the order Your order will be prepared and shipped by courier within 1-2 days',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontSize: 14)))
          ]))),
      Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context).push<void>(MaterialPageRoute(
                        builder: (context) => const OrderSuccess()));
                  },
                  child: const Text('Continue Shopping'))))
    ])));
  }
}
