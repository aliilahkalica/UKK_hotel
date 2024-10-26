import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageTwo extends StatefulWidget {
  final Function(bool) onFormValidityChanged;
  final Function(Map<String, dynamic>) onValueChanged;

  const PageTwo(
      {super.key,
      required this.onFormValidityChanged,
      required this.onValueChanged});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  bool firstValue = false;
  final TextEditingController _namatamuController = TextEditingController();
  final TextEditingController _jumlahkamarController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessageNamaTamu;
  String? _errorMessageJumlahKamar;

  Future<void> _PageTwo() async {
    bool isValid = false;
    final Map<String, dynamic> values = {};
    if (_namatamuController.text.isEmpty) {
      setState(() {
        _errorMessageNamaTamu = "Nama tamu harus diisi!";
        isValid = false;
      });
    }
    if (_jumlahkamarController.text.isEmpty) {
      setState(() {
        _errorMessageJumlahKamar = "Jumlah kamar harus diisi!";
        isValid = false;
      });
    }
    if (isValid) {
      widget.onFormValidityChanged(isValid);
      values['nama_tamu'] = _namatamuController;
      values['jumlah_kamar'] = _jumlahkamarController;
    }
  }

  final TextEditingController _startdatepicker = TextEditingController();
  final TextEditingController _enddatepicker = TextEditingController();
  DateTime? _selectedStartdate;
  DateTime? _selectedEnddate;

  Future<void> _pickStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedStartdate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        _startdatepicker.text = formattedDate;
        _selectedStartdate = pickedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  Future<void> _pickEnddate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedEnddate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        _enddatepicker.text = formattedDate;
        _selectedEnddate = pickedDate;
      });
    } else {
      print("Date is not selected");
    }
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
                  Text(
                    'Nama Tamu',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _namatamuController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Nama Tamu",
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Jumlah Kamar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _namatamuController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Jumlah Kamar",
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Tanggal Masuk',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      onTap: () => _pickStartDate(context),
                      controller: _startdatepicker,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintText: "Check in",
                          hintStyle: const TextStyle(),
                          filled: true,
                          prefixIcon: const Icon(Icons.calendar_month),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 14, 63, 169),
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Tanggal Keluar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      onTap: () => _pickEnddate(context),
                      controller: _enddatepicker,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintText: "Check out",
                          hintStyle: const TextStyle(),
                          filled: true,
                          prefixIcon: const Icon(Icons.calendar_month),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 14, 63, 169),
                              ))),
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
