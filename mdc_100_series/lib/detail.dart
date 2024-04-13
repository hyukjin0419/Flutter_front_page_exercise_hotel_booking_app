import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'model/product.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: 'product_${product.id}',
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
                  onTap: () {},
                ),
              ),
              Positioned(
                top: 16.0,
                right: 16.0,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 32.0,
                ),
              ),
            ],
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
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        product.name,
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 2000),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 50),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
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
