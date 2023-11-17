import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SevkIslemlerBaslik extends StatelessWidget {
  final String baslik;
  const SevkIslemlerBaslik({super.key, required this.baslik});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 80.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: NedenColors.lacivert,
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        baslik,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                );
  }
}