import 'package:flutter/material.dart';
import 'package:shrine/signup.dart';

import 'home.dart';
import 'login.dart';
import 'search.dart';
import 'favorite.dart';
import 'mypage.dart';
import 'detail.dart';
import 'model/product.dart'; // Product 모델을 가져와야 함

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/login/signup': (BuildContext context) => const SignUpPage(),
        '/search': (BuildContext context) => const SearchPage(),
        '/favorite': (BuildContext context) => const FavoritePage(),
        '/mypage': (BuildContext context) => const MyPage(),
        '/detail': (BuildContext context) => const DetailPage(),
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}

// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
