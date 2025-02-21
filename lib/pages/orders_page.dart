import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import '../components/order_widget.dart';
import '../models/order_list.dart';
import '../utils/custom_app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Meus pedidos',
        fontColor: Colors.white,
        fontSize: 20,
        viewDrawerIcon: true,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.error != null) {
            return Center(
              child: Text('Ocorreu um erro!'),
            );
          }
          return Consumer<OrderList>(
            builder: (ctx, orders, child) => ListView.builder(
              itemCount: orders.itemsCount,
              itemBuilder: (ctx, index) =>
                  OrderWidget(order: orders.items[index]),
            ),
          );
        },
      ),
    );
  }
}
