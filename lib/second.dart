import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/2.png"),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 40),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    "LET US KNOW IF YOU ARE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.amberAccent),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: 200,
                      height: 30,
                      child: const Text(
                        "I am a member",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amberAccent),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: 200,
                    height: 30,
                    child: const Text(
                      "I am new here",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
