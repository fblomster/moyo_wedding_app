import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moyo/services/auth/auth.dart';
import 'package:provider/provider.dart';
import '../components/moyo_button.dart';
import '../services/auth/auth_services.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage ({super.key,
    required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState();

  bool showProgress = false;
  bool visible = false;

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool _isObscure = true;
  var role = "guest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        height: 70
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
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
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabled: true,
                        // contentPadding: const EdgeInsets.only(
                        //   left: 14.0, bottom: 8.0, top: 8.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabled: true,
                        //contentPadding: const EdgeInsets.only(
                        //  left: 14.0, bottom: 8.0, top: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please enter valid password min. 6 characters");
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      validator: (value) {
                        if (confirmPasswordController.text !=
                            passwordController.text) {
                          return "Password did not match";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      height: 40,
                      onPressed: () {
                        setState(() {
                          showProgress = true;
                        });
                        signUp(emailController.text,
                            passwordController.text, role);
                      },
                      color: Colors.white,
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    MoyoButton(onTap: signUp2, text: 'Registrera dig'),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp2() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match."),
        ),
      );
      return;
    }

    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void signUp(String email, String password, String role) async {
    const CircularProgressIndicator();
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, role)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'role': role});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginOrRegister()));
  }
}

/*Future<void> signUp() async {
  if (passwordController.text != confirmedPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Passwords do not match."),
      ),
    );
    return;
  }

  //get auth service
  final authService = Provider.of<AuthService>(context, listen: false);

  try {
    await authService.signUpWithEmailandPassword(
      emailController.text,
      passwordController.text,
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
      ),
    );
  }
}*/