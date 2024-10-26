import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:ukk_hotel/components/showAlert.dart';
import 'package:ukk_hotel/detail.dart';
import 'package:ukk_hotel/form/formone.dart';
import 'package:ukk_hotel/form/formthree.dart';
import 'package:ukk_hotel/form/formtwo.dart';
import 'package:ukk_hotel/models/room_type.dart';
import 'package:ukk_hotel/struk.dart';
import 'package:ukk_hotel/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class ProgressForm extends StatefulWidget {
  final RoomType roomType;

  const ProgressForm({
    Key? key,
    required this.roomType,
  }) : super(key: key);

  @override
  State<ProgressForm> createState() => _ProgressFormState();
}

class _ProgressFormState extends State<ProgressForm> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _totalSteps = 3;
  bool _isFormValid = false;

  final Map<String, dynamic> storedform = {
    'nama_pemesan': '',
    'email_pemesan': '',
    'nomor_telepon': '',
    'nama_tamu': '',
    'jumlah_kamar': 0,
    'tanggal_check_in': null,
    'tanggal_check_out': null,
    'pembayaran': '',
  };

  void _handleFormValues(Map<String, dynamic> values) {
    setState(() {
      storedform.addAll(values);
    });
  }

  void _updateValidity(bool isValid) {
    print('hallo');
    setState(() {
      _isFormValid = isValid;
    });
  }

  Future<String> _submit() async {
    final dio = DioClient().dio;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString("auth_token");

      final response = await dio.post("/pesanan",
          data: {
            "nomor_telepon",
            "nama_pemesan",
            "email_pemesan",
            "tgl_check_in",
            "tgl_check_out",
            "nama_tamu",
            "jumlah_kamar",
            "pembayaran",
            "tipeKamarId",
            "status",
          },
          options: Options(headers: {"authorization": token}));
      if (response.data != null) {}

      return "";
    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengakses roomType dari ProgressForm
    final roomType = widget.roomType;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 63, 169),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(roomType: roomType),
                            ));
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 12, 53, 140),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                      child: StepProgressIndicator(
                          totalSteps: _totalSteps,
                          currentStep: _currentPage + 1,
                          padding: 4,
                          selectedColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          unselectedColor:
                              const Color.fromARGB(255, 12, 53, 140),
                          roundedEdges: const Radius.circular(20))),
                ],
              )),
          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              classOne(
                  onFormValidityChanged: _updateValidity,
                  onValueChanged: _handleFormValues),
              PageTwo(
                  onFormValidityChanged: _updateValidity,
                  onValueChanged: _handleFormValues),
              pageThree(
                onFormValidityChanged: _updateValidity,
                onValueChanged: _handleFormValues,
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: () {
                        if (_currentPage > 0) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: const Text(
                        "Sebelumnya",
                        style: TextStyle(
                            color: Color.fromARGB(255, 14, 63, 169),
                            fontSize: 16),
                      )),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {
                      print(
                          'Current page: $_currentPage, Total steps: $_totalSteps, Form valid: $_isFormValid');
                      if (_isFormValid) {
                        if (_currentPage < _totalSteps - 1 && _isFormValid) {
                          print('Ahsan cina: $_isFormValid');
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else if (_currentPage == _totalSteps) {
                          print('Ahsan cina: $_isFormValid');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const struk()));
                        }
                      } else {
                        print('Ahsan cina: $_isFormValid');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const ShowAlert(message: "Bayu hitam");
                            });
                      }
                    },
                    child: const Text(
                      "Selanjutnya",
                      style: TextStyle(
                          color: Color.fromARGB(255, 14, 63, 169),
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
