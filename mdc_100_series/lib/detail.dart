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
      body: Hero(
        tag: 'product_${product.id}', // 고유한 태그를 지정합니다. 여기서는 product의 id를 사용합니다.
        child: GestureDetector(
          child: Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context); // 이미지를 탭하면 이전 페이지로 돌아갑니다.
          },
        ),
      ),
    );
  }
}
