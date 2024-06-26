import 'package:flutter/material.dart';
import 'package:shrine/signup.dart';
import 'home.dart';
import 'login.dart';
import 'search.dart';
import 'favorite.dart';
import 'mypage.dart';
import 'detail.dart';
import 'model/product.dart';
import 'package:provider/provider.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Shrine',
        initialRoute: '/login',
        onGenerateRoute: (settings) {
          if (settings.name == '/detail') {
            // '/detail' 라우트일 경우, product 데이터를 전달
            final Product product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => DetailPage(product: product),
            );
          }
        },
        routes: {
          '/': (BuildContext context) => const HomePage(),
          '/login': (BuildContext context) => const LoginPage(),
          '/login/signup': (BuildContext context) => const SignUpPage(),
          '/search': (BuildContext context) => const SearchPage(),
          '/favorite': (BuildContext context) => const FavoritePage(),
          '/mypage': (BuildContext context) => const MyPage(),
        },
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var favorites = <Product>[];

  void toggleFavorite(Product hotel) {
    if (favorites.contains(hotel)) {
      favorites.remove(hotel);
    } else {
      favorites.add(hotel);
    }
    notifyListeners();
  }

  void removeFavorite(Product hotel) {
    favorites.remove(hotel);
    notifyListeners();
  }
}
