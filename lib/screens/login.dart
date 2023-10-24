import 'package:flutter/material.dart';
import 'package:moyo/components/moyo_button.dart';
import 'package:moyo/components/moyo_text_field.dart';
import 'package:moyo/screens/accommodation.dart';
import 'package:moyo/screens/register.dart';
import 'package:moyo/services/auth_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage ({super.key,
  required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text,
          passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:
        Text(
          e.toString(),
        ),
        ),
      );
    }
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
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
                    height: 50
                ),
                const Text("Välkommen till bröllopsappen moyo",
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
                    height: 25
                ),
                MoyoButton(onTap: signIn,
                    text: 'Logga in'),
                const SizedBox(
                    height: 50
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Inte registrerad än?"),
                    const SizedBox(
                        width: 4
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text("Registrera dig nu!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                )
              ],
            ),
          )
        )

      )
    );
  }
  }