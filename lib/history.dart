import 'package:flutter/material.dart';
import 'package:ukk_hotel/struk.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isMenungguSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 241, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 32, left: 18, right: 18, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 14, 63, 169),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Color.fromARGB(255, 14, 63, 169),
                          ),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "History",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "Daftar pesananmu",
                          style: TextStyle(
                              color: Color.fromARGB(255, 147, 147, 147)),
                        )
                      ],
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 214, 227, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Color.fromARGB(255, 214, 227, 255),
                          ),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 14, 63, 169),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMenungguSelected = true;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 58, vertical: 12),
                        decoration: BoxDecoration(
                          color: isMenungguSelected
                              ? Color.fromARGB(255, 14, 63, 169)
                              : Color.fromARGB(255, 214, 227, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Menunggu",
                          style: TextStyle(
                            color: isMenungguSelected
                                ? Colors.white
                                : Color.fromARGB(255, 14, 63, 169),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMenungguSelected = false;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                        decoration: BoxDecoration(
                          color: !isMenungguSelected
                              ? Color.fromARGB(255, 14, 63, 169)
                              : Color.fromARGB(255, 214, 227, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Selesai",
                          style: TextStyle(
                            color: !isMenungguSelected
                                ? Colors.white
                                : Color.fromARGB(255, 14, 63, 169),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              if (isMenungguSelected)
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => struk()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 18, right: 18),
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              'https://q-xx.bstatic.com/xdata/images/hotel/max500/421589158.jpg?k=04d561ad7ad1506ba97e385b7f234c7a4e78121ca9c107238b41cdd138c28d34&o=',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Single bed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Memiliki 1 kasur",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 147, 147, 147)),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 214, 227, 255),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.23)),
                                      ),
                                      child: Text(
                                        "+layanan kebersihan",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 14, 63, 169),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 214, 227, 255),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.23)),
                                      ),
                                      child: Text(
                                        "+Sarapan pagi",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 14, 63, 169),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("20% OFF",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 14, 63, 169),
                                        fontSize: 12)),
                                Text("Rp90.000",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              else
                const Center(
                  child: Text("Belum ada pesanan yang selesai"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
