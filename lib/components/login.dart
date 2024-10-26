import 'package:flutter/material.dart';
import 'package:ukk_hotel/components/navbar.dart';
import 'package:dio/dio.dart';
import 'package:ukk_hotel/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessageEmail;
  String? _errorMessagePassword;

  Future<String> _login() async {
    if (_emailController.text == "") {
      setState(() {
        _errorMessageEmail = "Email harus diisi!";
      });
      if (_passwordController.text == "") {
        setState(() {
          _errorMessagePassword = "Password harus diisi!";
        });
        return "";
      }
      return "";
    }

    try {
      final dio = DioClient().dio;

      Map<String, dynamic> data = {
        'email': _emailController.text,
        'password': _passwordController.text
      };
      final response = await dio.post('/auth/login', data: data);

      if (response.data != null) {
        // Extract token from response (assuming the token is in response.data['token'])
        String token = response.data['token'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        print('Token saved: $token');
        return token;
      } else {
        setState(() {
          _errorMessageEmail = 'Email atau password salah';
          _errorMessagePassword = 'Email atau password salah';
        });
        print('Failed with status code: ${response.statusCode}');
        return "";
      }
    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 63, 169),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.23),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.23))),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Selamat datang kembali",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Nikmati liburanmu\nbersama Dwiku",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 237, 241, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 18, right: 18, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 14, 63, 169),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Email",
                                filled: true,
                                hintStyle: const TextStyle(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 14, 63, 169),
                                    )),
                              ),
                            ),
                            if (_errorMessageEmail != null)
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  _errorMessageEmail!,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.red),
                                ),
                              ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 14, 63, 169),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Password",
                                filled: true,
                                hintStyle: const TextStyle(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 14, 63, 169),
                                  ),
                                ),
                              ),
                            ),
                            if (_errorMessagePassword != null)
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  _errorMessagePassword!,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.red),
                                ),
                              ),
                            const SizedBox(
                              height: 32,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 14, 63, 169),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                onPressed: () async {
                                  // Show loading indicator
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  try {
                                    // Await the login process
                                    String token = await _login();

                                    // Navigate to the next screen if login succeeds
                                    if (context.mounted && token != "") {
                                      // To ensure the context is still valid
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const navbar()), // Replace 'navbar' with 'Navbar' for class name consistency
                                      );
                                    }
                                  } catch (e) {
                                    // Handle login error (e.g., show a snackbar or dialog)
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Login failed: $e')),
                                    );
                                  } finally {
                                    // Hide loading indicator
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
