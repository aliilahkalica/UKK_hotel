import 'package:flutter/material.dart';

class pageThree extends StatefulWidget {
  final Function(bool) onFormValidityChanged;
  final Function(Map<String, dynamic>) onValueChanged;
  const pageThree(
      {super.key,
      required this.onFormValidityChanged,
      required this.onValueChanged});

  @override
  State<pageThree> createState() => _pageThreeState();
}

class _pageThreeState extends State<pageThree> {
  bool isGopay = false;
  bool isBNI = false;
  bool isBayarditempat = false;
  String selectedMethod = '';

  Future<void> _pageThree() async {
    bool isValid = false;
    final Map<String, dynamic> values = {};
    if (selectedMethod != '') {
      isValid = true;
      values['pembayaran'] = selectedMethod;
    }
  }

  void selectPaymentMethod(String method) {
    setState(() {
      if (method == 'gopay') {
        selectedMethod = 'gopay';
      } else if (method == 'bni') {
        selectedMethod = 'bni';
      } else if (method == 'bayar_ditempat') {
        selectedMethod = 'bayar_ditempat';
      }
    });
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
                                value: isGopay,
                                onChanged: (value) {
                                  selectPaymentMethod('gopay');
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
                                    'Gopay',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '086865899790 A/N Dwiku Hotel',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
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
                                value: isBNI,
                                onChanged: (value) {
                                  selectPaymentMethod('bni');
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
                                    'BNI',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '086865899790 A/N Dwiku Hotel',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
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
                                value: isBayarditempat,
                                onChanged: (value) {
                                  selectPaymentMethod('bayar_ditempat');
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
                                    'Bayar ditempat',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Batas waktu hingga check in',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
