import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/product.dart';
import 'app.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<MyAppState>(
        builder: (context, myAppState, _) {
          return ListView.builder(
            itemCount: myAppState.favorites.length,
            itemBuilder: (context, index) {
              final product = myAppState.favorites[index];
              return ListTile(
                title: Text(product.name),
              );
            },
          );
        },
      ),
    );
  }
}
