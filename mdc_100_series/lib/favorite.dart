import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              return Dismissible(
                key: Key(product.id),
                onDismissed: (direction) {
                  // 아이템을 삭제하는 함수 호출
                  myAppState.removeFavorite(product);
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                ),
                child: ListTile(
                  title: Text(product.name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
