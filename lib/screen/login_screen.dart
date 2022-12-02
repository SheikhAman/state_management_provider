import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statepract_1/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: authProvider.obsecure,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: InkWell(
                    onTap: () {
                      authProvider.setObsecure(!authProvider.obsecure);
                    },
                    child: Icon(authProvider.obsecure
                        ? Icons.visibility_off
                        : Icons.visibility)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                authProvider.login(
                    emailController.text, passwordController.text);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authProvider.loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
