import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'model/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.product}) : super(key: key);

  final Product product; // 제품 정보를 받아올 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: GestureDetector(
        child: Center(
          child: Image.asset(
            product.assetName,
            package: product.assetPackage,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
