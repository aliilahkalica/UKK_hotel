import 'package:flutter/material.dart';
import 'package:ukk_hotel/detail.dart';
import 'package:ukk_hotel/models/room_type.dart';
import 'package:intl/intl.dart';

class RoomTypeCard extends StatelessWidget {
  final RoomType roomType;

  const RoomTypeCard({
    Key? key,
    required this.roomType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(roomType: roomType),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 18, right: 18),
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      roomType.foto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          roomType.nama_tipe_kamar,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              Text(
                                roomType.deskripsi,
                                softWrap: false,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(
                                    255,
                                    147,
                                    147,
                                    147,
                                  ),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
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
                                  color:
                                      const Color.fromARGB(255, 214, 227, 255),
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
                            const SizedBox(
                              width: 8,
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
                              child: const Text(
                                "+Sarapan pagi",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 14, 63, 169),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "20% OFF",
                          style: TextStyle(
                            color: Color.fromARGB(
                              255,
                              14,
                              63,
                              169,
                            ),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          currencyFormatter.format(roomType.harga),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
