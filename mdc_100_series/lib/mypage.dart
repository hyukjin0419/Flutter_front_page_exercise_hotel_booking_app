import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      body: ListView(
        children: [
          // Load a Lottie file from a remote url
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
          const Column()
        ],
      ),
    );
  }
}
