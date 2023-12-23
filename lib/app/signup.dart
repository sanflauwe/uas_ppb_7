import 'package:flutter/material.dart';
import 'package:uas_ppb_7/app/mainmenu.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //text controller
  final newNamadata = TextEditingController();
  final newEmaildata = TextEditingController();
  final newPassworddata = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/images/3.png"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Form Nama
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: TextFormField(
                    controller: newNamadata,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Nama Lengkap',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //form Email
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: TextFormField(
                    controller: newEmaildata,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //form password
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: TextFormField(
                    controller: newPassworddata,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //tombol submit
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.amberAccent),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainMenu(),
                        ),
                      );
                    },
                    child: const SizedBox(
                      width: 200,
                      height: 30,
                      child: Text(
                        "SUBMIT",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
