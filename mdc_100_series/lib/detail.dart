import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'model/product.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

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
                tag: 'product_${widget.product.id}',
                child: GestureDetector(
                  child: Material(
                    child: InkWell(
                      onDoubleTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        // addToFavorites();
                      },
                      child: Center(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              widget.product.assetName,
                              package: widget.product.assetPackage,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16.0,
                right: 16.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      // addToFavorites();
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.red,
                    size: 32.0,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: List.generate(
                      widget.product.stars,
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
                        widget.product.name,
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
                        widget.product.address,
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
                        widget.product.phoneNumber,
                      )
                    ],
                  ),
                  Divider(height: 1.0, color: Colors.blue),
                  Text(widget.product.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
