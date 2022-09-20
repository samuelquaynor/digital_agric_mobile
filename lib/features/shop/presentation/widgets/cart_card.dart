import 'package:flutter/material.dart';

import '../../domain/entities/cart.dart';

/// Cart Card Widget
class CartCard extends StatefulWidget {
  /// Constructor
  const CartCard(
      {super.key,
      required this.cart,
      required this.onIncreaseCart,
      required this.onDecreaseCart});

  /// Cart model
  final Cart? cart;

  /// Calls when cart quanity increases
  final VoidCallback onIncreaseCart;

  /// Calls when cart quanity decreasess
  final VoidCallback onDecreaseCart;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        SizedBox(
            width: 88,
            child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(widget.cart?.product?.photoUrl ?? ''),
                ))),
        const SizedBox(width: 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.cart?.product?.name ?? '',
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2),
          const SizedBox(height: 10),
          Text.rich(TextSpan(
              text: '¢${widget.cart?.product?.price}',
              style: const TextStyle(fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                    text: ' x${widget.cart?.quantity}',
                    style: Theme.of(context).textTheme.headline6)
              ]))
        ])
      ]),
      Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: widget.onIncreaseCart,
                    child: const Icon(Icons.arrow_drop_up)),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                InkWell(
                    onTap: widget.onDecreaseCart,
                    child: const Icon(Icons.arrow_drop_down))
              ]))
    ]);
  }
}
