import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'app.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.read<MyAppState>();

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
            Consumer<MyAppState>(
              builder: (context, myAppState, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: myAppState.favorites.length,
                  itemBuilder: (context, index) {
                    final product = myAppState.favorites[index];
                    return Center(
                      child: Card(
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Stack(
                            children: [
                              Image.asset(
                                product.assetName,
                                package: product.assetPackage,
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 16.0,
                                left: 16.0,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  // color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(product.address,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
