import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/category.dart';
import '../../bloc/shop_bloc.dart';
import '../../widgets/categories.dart';
import '../../widgets/new_arrival_products.dart';
import '../../widgets/popular_products.dart';
import '../../widgets/search_form.dart';
import 'cart_page.dart';

/// Shop HomeScreen
class ShopHomeScreen extends StatelessWidget {
  /// Constructor
  ShopHomeScreen({super.key});

  /// Inject shop bloc
  final bloc = sl<ShopBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.green.shade900)),
            // title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   SvgPicture.asset('assets/images/Location.svg'),
            //   const SizedBox(width: 20),
            // Text('Location', style: Theme.of(context).textTheme.bodyText1)
            // ]),

            actions: [
              IconButton(
                  icon: const Icon(FontAwesomeIcons.cartShopping),
                  onPressed: () {
                    Navigator.of(context).push<void>(MaterialPageRoute(
                        builder: (context) =>  CartPage()));
                  })
            ]),
        floatingActionButton: SizedBox(
            width: 100,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Sell Here!'))),
        body: Center(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.all(16),
              child: FutureBuilder<List<Category?>>(
                  future: bloc.getCategoriesBloc(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator.adaptive();
                    } else {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Explore',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                            const Text(
                              'Find Fresh Grocery Products here.',
                              style: TextStyle(fontSize: 18),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: SearchForm(),
                            ),
                            Categories(categories: snapshot.requireData),
                            NewArrivalProducts(
                                products: snapshot.requireData
                                        .firstWhere((element) =>
                                            element?.title == 'Fruits')
                                        ?.products ??
                                    []),
                            PopularProducts(
                                products: snapshot.requireData
                                        .firstWhere((element) =>
                                            element?.title == 'Vegetables')
                                        ?.products ??
                                    [])
                          ]);
                    }
                  })),
        ));
  }
}
