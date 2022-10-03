import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const routeName = '/signin';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "SVV ID",
                  icon: Icon(PhosphorIcons.user)
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  icon: Icon(PhosphorIcons.password)
                ),
              ),
              ElevatedButton(
                onPressed: () {}, 
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Sign In")
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}