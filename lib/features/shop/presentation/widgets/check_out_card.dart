import 'package:flutter/material.dart';

import '../../domain/entities/cart.dart';
import '../pages/buy/check_out.dart';

/// Checkout button card
class CheckoutCard extends StatelessWidget {
  /// Constructor
  const CheckoutCard({super.key, required this.carts});

  /// List of carts
  final List<Cart?> carts;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, -15),
                  blurRadius: 20,
                  color: const Color(0xFFDADADA).withOpacity(0.15))
            ]),
        child: SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text.rich(TextSpan(text: 'Total:\n', children: [
                  TextSpan(
                      text:
                          '¢${carts.isNotEmpty ? carts.map<double?>((cart) => cart?.totalPrice ?? 0).reduce((a, b) => a! + b!) : 0}',
                      style: const TextStyle(fontSize: 22, color: Colors.black))
                ])),
                SizedBox(
                    width: 190,
                    child: ElevatedButton(
                        child: const Text('Check Out'),
                        onPressed: () {
                          if (carts.isNotEmpty) {
                            Navigator.of(context).push<void>(MaterialPageRoute(
                                builder: (context) => ShopCheckOut(
                                    totalPrice: carts.isNotEmpty
                                        ? carts
                                            .map<double?>(
                                                (cart) => cart?.totalPrice ?? 0)
                                            .reduce((a, b) => a! + b!)!
                                        : 0,
                                    carts: carts)));
                          }
                        }))
              ])
            ])));
  }
}
