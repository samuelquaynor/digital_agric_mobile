import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/data/constants.dart';
import '../../../../../core/presentation/pages/loading.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/shop_bloc.dart';
import '../../widgets/rounded_icon_btn.dart';
import 'cart_page.dart';

/// Details Screen
class DetailsScreen extends StatefulWidget {
  /// Constructor
  const DetailsScreen({super.key, required this.product});

  /// Product model
  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  /// shop bloc
  final bloc = sl<ShopBloc>();

  List<Cart?> updatedCart = [];

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart?>>(
        initialData: const [],
        future: bloc.retrieveCartBloc(),
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  leading: const BackButton(color: Colors.black),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push<void>(MaterialPageRoute(
                              builder: (context) => const CartPage()));
                        },
                        icon: const Icon(FontAwesomeIcons.cartShopping))
                  ]),
              bottomSheet: Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          updatedCart = snapshot.requireData;
                          if (updatedCart.isNotEmpty &&
                              updatedCart
                                  .where((element) =>
                                      element?.product?.id == widget.product.id)
                                  .isNotEmpty) {
                            final newCart = updatedCart.firstWhere((element) =>
                                element?.product?.id == widget.product.id);

                            final cartIndex = updatedCart.indexOf(newCart);

                            updatedCart[cartIndex] = Cart.initial().copyWith(
                                product: widget.product,
                                quantity:
                                    updatedCart[cartIndex]!.quantity + quantity,
                                initialPrice: widget.product.price,
                                totalPrice: updatedCart[cartIndex]!.totalPrice +
                                    widget.product.price * quantity);
                          } else {
                            updatedCart.add(Cart.initial().copyWith(
                                product: widget.product,
                                quantity: quantity,
                                initialPrice: widget.product.price,
                                totalPrice: widget.product.price * quantity));
                          }
                        });
                        return showDialog(
                            context: context,
                            builder: (context) => LoadingPage(
                                errorText: bloc.saveCartBloc(updatedCart),
                                callback: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Item has been added to cart')))));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor, shape: const StadiumBorder()),
                      child: const Text('Add to Cart'))),
              body: Column(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: FadeInImage(
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/images/rice.png',
                                fit: BoxFit.cover),
                        fit: BoxFit.cover,
                        placeholder: const AssetImage('assets/images/rice.png'),
                        image: NetworkImage(widget.product.photoUrl))),
                const SizedBox(height: defaultPadding * 1.5),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(defaultPadding,
                            defaultPadding * 2, defaultPadding, defaultPadding),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(defaultBorderRadius * 3),
                                topRight:
                                    Radius.circular(defaultBorderRadius * 3))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(
                                    child: Text(widget.product.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6)),
                                const SizedBox(width: defaultPadding),
                                Text('¢${widget.product.price}',
                                    style:
                                        Theme.of(context).textTheme.headline6)
                              ]),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: defaultPadding),
                                  child: Text(widget.product.description)),
                              const SizedBox(height: defaultPadding * 2)
                            ]))),
                Container(
                    width: double.infinity,
                    height: 55,
                    margin:
                        const EdgeInsets.only(bottom: 60, left: 20, right: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedIconBtn(
                              icon: Icons.remove,
                              showShadow: true,
                              press: () {
                                setState(() {
                                  if (quantity >= 2) {
                                    quantity--;
                                  }
                                });
                              }),
                          Text('$quantity',
                              style: Theme.of(context).textTheme.headline5),
                          RoundedIconBtn(
                              icon: Icons.add,
                              showShadow: true,
                              press: () {
                                setState(() {
                                  quantity++;
                                });
                              })
                        ]))
              ]));
        });
  }
}
