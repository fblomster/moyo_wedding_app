import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/moyo_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent. Check your email.'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context,
          builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Forgot password',
          style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black87,
        //elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Enter your email and we will send you your reset link.',
                textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: MoyoTextField(
                  controller: _emailController,
    hintText: 'Email',
    obscureText: false,
    ),
    ),
              const SizedBox(height: 10,),
              MaterialButton(onPressed: passwordReset,
                  color: Colors.greenAccent,
              child: const Text('Reset password'),
              ),
    ]),
    ),
    );
  }
}