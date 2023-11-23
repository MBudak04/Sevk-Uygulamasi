import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neden_sevk_application/core/models/firmalar_model.dart';
import 'package:neden_sevk_application/core/services/http_services.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SevkIslemlerRadioFirmalar extends StatefulWidget {

  const SevkIslemlerRadioFirmalar({super.key});

  @override
  State<SevkIslemlerRadioFirmalar> createState() => _SevkIslemlerRadioState();
}
class _SevkIslemlerRadioState extends State<SevkIslemlerRadioFirmalar> {
  String selectedIndex ="";
  List<String> list = [];
  List<String> searchList = [];
  
  TextEditingController controllerSear = TextEditingController();
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    
    // ignore: no_leading_underscores_for_local_identifiers
    void _focusDispose() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    }

    return GestureDetector(
      onTap: () => _focusDispose(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 80.w,
            height: Adaptive.h(38),
            decoration: BoxDecoration(
                color: NedenColors.beyaz,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: 4.h,
                    width: 70.w,
                    child: SearchBar(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.7)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.black)),
                      hintStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.black)),
                      controller: controllerSear,
                      hintText: "Ara...",
                      trailing: const [Icon(Icons.search)],
                      onChanged: (value) {
                            Timer(const Duration(milliseconds: 1200), () {
                          setState(() {});
                          searchList = list
                              .where(
                                (element) => element
                                    .toLowerCase()
                                    .contains(value.toLowerCase()),
                              )
                              .toList();
                          list.clear();
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 70.w,
                    height: 22.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: FutureBuilder<List<FirmalarModel>>(
                            future: apiServices.sevkFirmalarService(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text("HATA: ${snapshot.error}"),
                                );
                              } else {
                                List<FirmalarModel> firmalarListesi =
                                    snapshot.data!;
                                for (var firmalar in firmalarListesi) {
                                  if (!list
                                      // ignore: unrelated_type_equality_checks
                                      .any((element) => element == firmalar)) {
                                    list.add(firmalar.firmaAdi!);
                                  }
                                }
                                return ListView.builder(
                                    itemCount: searchList.isEmpty
                                        ? firmalarListesi.length
                                        : searchList.length,
                                    itemBuilder: (context, index) {
                                      // FirmalarModel firma = firmalarListesi[index];
                                      return InkWell(
                                        onTap: () {
                                          selectedIndex = searchList.isEmpty
                                              ? list[index]
                                              : searchList[index];

                                          setState(() {});
                                        },
                                        child: ListTile(
                                          title: Text(searchList.isEmpty
                                              ? list[index]
                                              : searchList[index]),
                                        ),
                                      );
                                    });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: Container(
                    width: 70.w,
                    height: Adaptive.h(5),
                    decoration: BoxDecoration(
                      color: NedenColors.lacivert,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      selectedIndex == "" ? "SEÇİM YAPILMADI" : selectedIndex,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
