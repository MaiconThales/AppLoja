import 'package:app_loja/models/auth.dart';
import 'package:app_loja/models/order_list.dart';
import 'package:app_loja/models/product_list.dart';
import 'package:app_loja/pages/auth_or_home_page.dart';
import 'package:app_loja/pages/cart_page.dart';
import 'package:app_loja/pages/orders_page.dart';
import 'package:app_loja/pages/product_detail_page.dart';
import 'package:app_loja/pages/product_form_page.dart';
import 'package:app_loja/pages/products_page.dart';
import 'package:app_loja/utils/app_routes.dart';
import 'package:app_loja/utils/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? "",
              auth.userId ?? "",
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previous) {
            return OrderList(
              auth.token ?? "",
              auth.userId ?? "",
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
          ),
          useMaterial3: true,
          fontFamily: 'Lato',
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionsBuilder(),
              TargetPlatform.iOS: CustomPageTransitionsBuilder(),
            },
          ),
        ),
        //home: ProductsOverviewPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.authOrHome: (ctx) => AuthOrHomePage(),
          AppRoutes.productDetail: (ctx) => ProductDetailPage(),
          AppRoutes.cart: (ctx) => CartPage(),
          AppRoutes.orders: (ctx) => OrdersPage(),
          AppRoutes.products: (ctx) => ProductsPage(),
          AppRoutes.productForm: (ctx) => ProductFormPage(),
        },
      ),
    );
  }
}
