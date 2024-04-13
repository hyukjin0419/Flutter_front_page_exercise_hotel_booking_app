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
      body: Column(
        children: <Widget>[
          Hero(
            tag:
                'product_${product.id}', // 고유한 태그를 지정합니다. 여기서는 product의 id를 사용합니다.
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                // TODO: Align labels to the bottom and center (103)
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO: Change innermost Column (103)
                children: <Widget>[
                  Row(
                    children: List.generate(
                      product.stars,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 10.0,
                      ),
                    ),
                  ),
                  Text(
                    product.name,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      Text(
                        product.address,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      Text(
                        product.phoneNumber,
                      )
                    ],
                  ),
                  Divider(height: 1.0, color: Colors.blue),
                  Text(product.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
