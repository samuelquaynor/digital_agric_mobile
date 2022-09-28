import 'package:flutter/material.dart';

/// order success page
class OrderSuccess extends StatefulWidget {
  /// Constructor
  const OrderSuccess({super.key});

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
          flex: 3,
          child:
              // ignore: avoid_unnecessary_containers
              Container(child: Image.asset('assets/images/wallet_illu.png'))),
      Expanded(
          flex: 2,
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
          ])),
      Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).popUntil((route) {
                      return count++ == 3;
                    });
                  },
                  child: const Text('Continue Shopping'))))
    ])));
  }
}
