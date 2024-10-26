// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ukk_hotel/components/navbar.dart';
import 'package:ukk_hotel/detail.dart';
import 'package:ukk_hotel/utils/dio.dart';
import 'package:dio/dio.dart';
import 'package:ukk_hotel/models/room_type.dart';
import 'package:ukk_hotel/components/roomTypeCard.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final TextEditingController _startdatepicker = TextEditingController();
  final TextEditingController _enddatepicker = TextEditingController();
  DateTime? _selectedStartdate;
  DateTime? _selectedEnddate;
  List<RoomType> _roomTypes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final dio = DioClient().dio;
      final response = await dio.get('/tipe-kamar');

      print(response.data['data']);
      final List<dynamic> fetchedRoomTypes = (response.data['data'] as List)
          .map((json) => RoomType.fromJson(json))
          .toList();

      setState(() {
        _roomTypes = fetchedRoomTypes as List<RoomType>;
      });
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      _isLoading = false;
    });
  }

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
      backgroundColor: const Color.fromARGB(255, 14, 63, 169),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 18, right: 18, bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Selamat datang",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Pilihan Kamar\nTerbaik Untukmu",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.23),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.23))),
                                  child: const Text(
                                    "No 1 di Malang",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.23),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.23))),
                                  child: const Text(
                                    "Pelayanan Bintang 4",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Ink(
                              decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.23),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                        color: Colors.white.withOpacity(0.23)),
                                  )),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Ink(
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                        color: Colors.white.withOpacity(0.23)),
                                  )),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 14, 63, 169),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 300),
                        height: MediaQuery.of(context).size.height * 1.2,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 237, 241, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 18, right: 18, top: 180, bottom: 32),
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 165,
                                  child: TextField(
                                    onTap: () => _pickStartDate(context),
                                    controller: _startdatepicker,
                                    decoration: InputDecoration(
                                        fillColor: const Color.fromARGB(
                                            255, 240, 240, 240),
                                        hintText: "Check in",
                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            191,
                                            191,
                                            191,
                                          ),
                                        ),
                                        filled: true,
                                        prefixIcon:
                                            const Icon(Icons.calendar_month),
                                        prefixIconColor: const Color.fromARGB(
                                            255, 191, 191, 191),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                255,
                                                14,
                                                63,
                                                169,
                                              ),
                                            ))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                SizedBox(
                                  width: 165,
                                  child: TextField(
                                    onTap: () => _pickEnddate(context),
                                    controller: _enddatepicker,
                                    decoration: InputDecoration(
                                        fillColor: const Color.fromARGB(
                                            255, 240, 240, 240),
                                        hintText: "Check out",
                                        hintStyle: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 191, 191, 191)),
                                        filled: true,
                                        prefixIcon:
                                            const Icon(Icons.calendar_month),
                                        prefixIconColor: const Color.fromARGB(
                                            255, 191, 191, 191),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 14, 63, 169),
                                            ))),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 240, 240, 240),
                                hintText: "Jumlah tamu",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 191, 191, 191)),
                                filled: true,
                                prefixIcon: const Icon(Icons.person),
                                prefixIconColor:
                                    const Color.fromARGB(255, 178, 178, 178),
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
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: 500,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    14,
                                    63,
                                    169,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Cari Kamar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tipe Kamar",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Pelayanan bintang 5",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 147, 147, 147)),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 214, 227, 255),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.23))),
                              child: Text(
                                "${_roomTypes.length} Tipe kamar",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 14, 63, 169),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Inkwellboss
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.99,
                                  width:
                                      MediaQuery.of(context).size.width * 0.99,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    primary: false,
                                    itemCount: _roomTypes.length,
                                    itemBuilder: (context, index) {
                                      final roomType = _roomTypes[index];
                                      return RoomTypeCard(roomType: roomType);
                                    },
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
