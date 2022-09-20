import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/presentation/pages/loading.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/cart.dart';
import '../../bloc/shop_bloc.dart';
import '../../widgets/cart_card.dart';
import '../../widgets/check_out_card.dart';

/// CartPage
class CartPage extends StatefulWidget {
  /// Constructor
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  /// shop bloc
  final bloc = sl<ShopBloc>();

  List<Cart?> updatedCart = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart?>>(
        initialData: const [],
        future: bloc.retrieveCartBloc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator.adaptive()));
          } else {
            return Scaffold(
                appBar: AppBar(
                    leading: const BackButton(color: Colors.black),
                    centerTitle: true,
                    title: Column(children: [
                      const Text('Your Cart',
                          style: TextStyle(color: Colors.black)),
                      Text('${snapshot.data?.length} items',
                          style: Theme.of(context).textTheme.caption)
                    ])),
                bottomNavigationBar: CheckoutCard(carts: snapshot.requireData),
                body: Builder(builder: (context) {
                  if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Dismissible(
                                    key: const ValueKey(0),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) async {
                                      setState(() {
                                        updatedCart = snapshot.requireData;
                                        updatedCart.removeAt(index);
                                      });
                                      return showDialog(
                                          context: context,
                                          builder: (context) => LoadingPage(
                                              errorText: bloc
                                                  .saveCartBloc(updatedCart),
                                              callback: () => ScaffoldMessenger
                                                      .of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Item has been removed from cart')))));
                                    },
                                    background: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFE6E6),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(children: [
                                          const Spacer(),
                                          SvgPicture.asset(
                                              'assets/svg/Trash.svg')
                                        ])),
                                    child: CartCard(
                                      cart: snapshot.data?[index],
                                      onDecreaseCart: () async {
                                        setState(() {
                                          updatedCart = snapshot.requireData;

                                          updatedCart[index] = Cart.initial()
                                              .copyWith(
                                                  product: snapshot
                                                      .data?[index]?.product,
                                                  quantity: updatedCart[index]!
                                                          .quantity -
                                                      1,
                                                  initialPrice: snapshot
                                                          .data?[index]
                                                          ?.product
                                                          ?.price ??
                                                      0,
                                                  totalPrice:
                                                      updatedCart[index]!
                                                              .totalPrice -
                                                          updatedCart[index]!
                                                              .initialPrice);
                                        });
                                        return showDialog(
                                            context: context,
                                            builder: (context) => LoadingPage(
                                                errorText: bloc
                                                    .saveCartBloc(updatedCart),
                                                callback: () => ScaffoldMessenger
                                                        .of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Cart item has been reduced')))));
                                      },
                                      onIncreaseCart: () async {
                                        setState(() {
                                          updatedCart = snapshot.requireData;

                                          updatedCart[index] = Cart.initial()
                                              .copyWith(
                                                  product: snapshot
                                                      .data?[index]?.product,
                                                  quantity: updatedCart[index]!
                                                          .quantity +
                                                      1,
                                                  initialPrice: snapshot
                                                          .data?[index]
                                                          ?.product
                                                          ?.price ??
                                                      0,
                                                  totalPrice:
                                                      updatedCart[index]!
                                                              .totalPrice +
                                                          updatedCart[index]!
                                                              .initialPrice);
                                        });
                                        return showDialog(
                                            context: context,
                                            builder: (context) => LoadingPage(
                                                errorText: bloc
                                                    .saveCartBloc(updatedCart),
                                                callback: () => ScaffoldMessenger
                                                        .of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Cart item has been increased')))));
                                      },
                                    )))));
                  } else {
                    return const Center(child: Text('Cart is Empty'));
                  }
                }));
          }
        });
  }
}
