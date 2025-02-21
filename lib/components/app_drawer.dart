import 'package:app_loja/pages/orders_page.dart';
import 'package:app_loja/utils/app_routes.dart';
import 'package:app_loja/utils/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../utils/custom_app_bar.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          CustomAppBar(
            title: 'Bem vindo usuário!',
            fontColor: Colors.white,
            fontSize: 20,
            viewDrawerIcon: false,
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.authOrHome);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pedidos'),
            onTap: () {
              // Navigator.of(context).pushReplacement(CustomRoute(
              //   builder: (ctx) => OrdersPage(),
              // ));
              Navigator.of(context).pushReplacementNamed(AppRoutes.orders);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerenciar produtos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.products);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();
              Navigator.of(context).pushReplacementNamed(AppRoutes.authOrHome);
            },
          ),
        ],
      ),
    );
  }
}
