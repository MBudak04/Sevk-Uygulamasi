import 'package:flutter/material.dart';
import 'package:neden_sevk_application/core/models/sevk_bekleyen_cuvallar_model.dart';
import 'package:neden_sevk_application/core/services/http_services.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/themes/fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class YapilmisSevkler extends StatefulWidget {
  const YapilmisSevkler({super.key});

  @override
  State<YapilmisSevkler> createState() => _YapilmisSevklerState();
}

class _YapilmisSevklerState extends State<YapilmisSevkler> {
  final ApiServices apiServices = ApiServices();

   @override
  void initState() {
    super.initState();
    ApiServices().sevkBekleyenCuvallarService(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: NedenColors.lacivert,
          centerTitle: true,
          title: Text(
            "YAPILMIŞ SEVKLER",
            style: NedenFonts.baslikBeyaz,
          ),
        ),
        body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            apiServices.sevkBekleyenCuvallarService(context);
          });
          return apiServices.sevkBekleyenCuvallarService(context);
        },
        child: FutureBuilder<List<SevkBekleyenCuvallarModel>>(
            future: apiServices.sevkBekleyenCuvallarService(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Hata: ${snapshot.error}"),
                );
              } else {
                List<SevkBekleyenCuvallarModel> cuvallarListesi =
                    snapshot.data!;
                return ListView.builder(
                  itemCount:
                      cuvallarListesi.length, // Tek bir öğe olduğunu varsayalım
                  itemBuilder: (context, index) {
                    SevkBekleyenCuvallarModel cuval = cuvallarListesi[index];
                    return Card(
                      child: ExpansionTile(
                        title: Text(cuval.artikel!),
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.network(cuval.fotografUrl!)),
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("ÇUVAL ID:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 50.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.cuvalId.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "RENK ID:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 50.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.renkId.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("TALEP ID:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 55.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.talepId.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "MODEL:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 10.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.model!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text("RENK:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 10.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.renkAdi!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "BEDEN:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 50.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.beden!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text("ADET:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 105.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.urunAdet.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "KG:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 60.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.kg!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.0,
                                        top: 12,
                                        bottom: 12,
                                        right: 12),
                                    child: Text("ATANAN FİRMA:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 105.0,
                                          top: 12.0,
                                          bottom: 12),
                                      child: Text(
                                        cuval.atananFirma!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
      ),
        );
        
  }
}