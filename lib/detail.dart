import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ukk_hotel/components/navbar.dart';
import 'package:ukk_hotel/formPemesanan.dart';
import 'package:ukk_hotel/models/room_type.dart';

class DetailPage extends StatelessWidget {
  final RoomType roomType;

  DetailPage({
    Key? key,
    required this.roomType,
  }) : super(key: key);

  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 241, 255),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, left: 18, right: 18, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 14, 63, 169),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 14, 63, 169),
                          ),
                        )),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const navbar()));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Detail Kamar",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text(
                        "Tipe kamar Dwiku",
                        style: TextStyle(
                            color: Color.fromARGB(255, 147, 147, 147)),
                      )
                    ],
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 214, 227, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 214, 227, 255),
                          ),
                        )),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 14, 63, 169),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
                items: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(roomType.foto),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 14, 63, 169),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.23))),
                            child: const Text(
                              "20% OFF",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                )),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomType.nama_tipe_kamar,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Tipe Kamar Dwiku",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 147, 147, 147)),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: Color.fromARGB(255, 14, 63, 169),
                                size: 18.0,
                              ),
                              Text(
                                roomType.rating.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 14, 63, 169),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(currencyFormatter.format(roomType.harga),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(18),
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, bottom: 18, top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Layanan Kamar",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                    color: const Color.fromARGB(
                                        255, 214, 227, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.23))),
                                child: const Text(
                                  "+layanan kebersihan",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 14, 63, 169),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 214, 227, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.23))),
                                child: const Text(
                                  "+sarapan pagi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 14, 63, 169),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 214, 227, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.23))),
                                child: const Text(
                                  "+garansi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 14, 63, 169),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 18, right: 18, top: 18, bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tentang Hotel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          roomType.deskripsi,
                          style: TextStyle(
                              color: Color.fromARGB(255, 147, 147, 147),
                              fontSize: 12),
                        )
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.all(18),
                  width: double.infinity,
                  height: 265,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.only(left: 18, right: 18, top: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Waktu Check in / Check out",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "+50.000 Check in/Check out terlambat",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 147, 147, 147)),
                              ),
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 18, bottom: 4, left: 18, right: 18),
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18, right: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Color.fromARGB(255, 14, 63, 169),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 12, right: 8, left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Check in",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      255, 147, 147, 147)),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "14.00 WIB - 22.00 WIB",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(18),
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18, right: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Color.fromARGB(255, 14, 63, 169),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 12, right: 8, left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Check out",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromARGB(
                                                      255, 147, 147, 147)),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "14.00 WIB - 22.00 WIB",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 14, 63, 169),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProgressForm(roomType: roomType)));
          },
          child: const Text(
            "Cari Kamar",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
