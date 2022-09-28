import 'package:flutter/material.dart';

import '../../../../../core/presentation/pages/loading.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/entities/order_entity.dart';
import '../../bloc/shop_bloc.dart';
import '../../widgets/destination_card.dart';
import '../../widgets/payment_card.dart';
import '../../widgets/price_breakdown.dart';
import '../../widgets/tab_title.dart';
import 'order_success.dart';

/// Shop check out page
class ShopCheckOut extends StatefulWidget {
  /// Constructor
  const ShopCheckOut(
      {super.key, required this.totalPrice, required this.carts});

  /// Total price of items in cart
  final double totalPrice;

  /// List of carts
  final List<Cart?> carts;

  @override
  State<ShopCheckOut> createState() => _ShopCheckOutState();
}

class _ShopCheckOutState extends State<ShopCheckOut> {
  /// shop bloc
  final bloc = sl<ShopBloc>();

  /// Create order entity
  final OrderEntity order = OrderEntity.initial();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const BackButton(color: Colors.black),
            title: const Text('Checkout')),
        body: SafeArea(
            child: Column(children: [
          Expanded(
              child: Column(children: [
            TabTitle(title: 'Destination', actionText: 'Change', seeAll: () {}),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DestinationCard(),
                      const Divider(height: 48),
                      Text('Payment Method',
                          style: Theme.of(context).textTheme.titleMedium),
                      const PaymentCard(title: 'Cash on delivery'),
                      const Divider(height: 30),
                      PriceBreakdown(
                          title: 'Sub total Price',
                          price: '¢${widget.totalPrice}'),
                      PriceBreakdown(
                          title: 'Delivery Fee',
                          price: '¢${widget.totalPrice / 20}'),
                      PriceBreakdown(
                          title: 'Total price',
                          price:
                              '¢${widget.totalPrice + (widget.totalPrice / 20)}')
                    ]))
          ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () async {
                        await showDialog<void>(
                            context: context,
                            builder: (context) => LoadingPage(
                                errorText: bloc.createOrderBloc(order.copyWith(
                                    carts: widget.carts,
                                    deliveryPrice: widget.totalPrice / 20,
                                    totalPrice: widget.totalPrice +
                                        (widget.totalPrice / 20))),
                                callback: () async {
                                  await Navigator.of(context).push<void>(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderSuccess()));
                                }));
                      },
                      child: const Text('Order Now'))))
        ])));
  }
}
