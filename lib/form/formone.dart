import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukk_hotel/utils/dio.dart';

class classOne extends StatefulWidget {
  final Function(bool) onFormValidityChanged;
  //mengecek perubahan form apakah valid atau tidak untuk lanjut ke next step

  final Function(Map<String, dynamic>) onValueChanged;
  //menampung perubahan value

  const classOne(
      {super.key,
      required this.onFormValidityChanged,
      required this.onValueChanged});

  @override
  State<classOne> createState() => _classOneState();
}

class _classOneState extends State<classOne> {
  bool firstValue = false;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessageNama;
  String? _errorMessageEmail;
  String? _errorMessageNomor;

  Future<void> validateOne() async {
    bool isValid = true;
    final Map<String, dynamic> values = {};
    if (_namaController.text.isEmpty) {
      setState(() {
        _errorMessageNama = "Nama harus diisi!";
        isValid = false;
      });
    }

    if (_emailController.text.isEmpty) {
      setState(() {
        _errorMessageEmail = "Email harus diisi!";
        isValid = false;
      });
    }
    if (_nomorController.text.isEmpty) {
      setState(() {
        _errorMessageNomor = "Nomo Telepon harus diisi";
        isValid = false;
      });
    }

    if (isValid == true) {
      print('iyh');
      widget.onFormValidityChanged(isValid);
      values['nama_pemesan'] = _namaController.text;
      values['email_pemesan'] = _emailController.text;
      values['nomor_telepon'] = _nomorController.text;
    }

    print('apa kek: ${_namaController.text}');
    print(_emailController.text);
    print(_nomorController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 63, 169),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 227, 255),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.23))),
                    child: Text(
                      "Data Pemesan",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 14, 63, 169),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Data Pesan Kamar',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '*Mohon isi data dengan benar dan teliti*',
                    style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 85,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.23),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.23))),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18, right: 18, top: 18, bottom: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                        width: 1.0, color: Colors.white)),
                                value: firstValue,
                                onChanged: (value) {
                                  setState(() {
                                    firstValue = value ?? false;
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Color.fromARGB(255, 14, 63, 169),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Menyetujui Segala Kebijakan Berlaku',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Baca pedoman lebih lanjut',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nama',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _namaController,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _errorMessageNama = null;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Nama",
                      filled: true,
                      hintStyle: TextStyle(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 14, 63, 169),
                          )),
                    ),
                  ),
                  if (_errorMessageNama != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        _errorMessageNama!,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Email",
                      filled: true,
                      hintStyle: TextStyle(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
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
                            fontSize: 12,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Telepon',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _nomorController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "No Telepon",
                      filled: true,
                      hintStyle: TextStyle(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 14, 63, 169),
                          )),
                    ),
                  ),
                  if (_errorMessageNomor != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        _errorMessageNomor!,
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 248, 248, 248)),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
