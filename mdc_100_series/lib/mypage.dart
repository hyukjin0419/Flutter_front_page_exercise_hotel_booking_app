import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shrine/app.dart';
import 'package:provider/provider.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // 배경색 설정
              ),
              child: Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                    ),
                  ),
                ),
              ),
            ),
            const Column(
              children: [
                Text('Hyukjin Choi'),
                Text('21900771'),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: _buildListCards(context),
            )
          ],
        ),
      ),
    );
  }

  List<Card> _buildListCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return products.map((product) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title'),
              Text('descript'),
            ],
          ),
        ),
      );
    }).toList();
  }
}
