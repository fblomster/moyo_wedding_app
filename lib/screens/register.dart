import 'package:flutter/material.dart';
import 'package:moyo/components/moyo_button.dart';
import 'package:moyo/components/moyo_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage ({super.key,
    required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  }

  class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  void signUp() {}

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height: 50
                  ),
                  Icon(
                    Icons.star_border,
                    size: 80,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(
                      height: 25
                  ),
                  const Text("Bröllopsappen moyo",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  ),
                  const SizedBox(
                      height: 50
                  ),
                  const Text("Välkommen att skapa ett konto!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                      height: 25
                  ),
                  MoyoTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                  ),
                  const SizedBox(
                      height: 10
                  ),
                  MoyoTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                      height: 10
                  ),
                  MoyoTextField(
                    controller: confirmedPasswordController,
                    hintText: 'Confirm password',
                    obscureText: true,
                  ),
                  const SizedBox(
                      height: 25
                  ),
                  MoyoButton(onTap: signUp, text: 'Registrera dig'),
                  const SizedBox(
                      height: 50
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Har du redan ett konto?"),
                      const SizedBox(
                          width: 4
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                      child: const Text("Logga in här!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),)
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
        )

      )
    );
  }
  }