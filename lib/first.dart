import 'package:flutter/material.dart';
import 'package:uas_ppb_7/second.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/1.png"),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 450),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(
                        data: '...',
                      ),
                    ),
                  );
                },
                child: const Text(
                  '. . .',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
