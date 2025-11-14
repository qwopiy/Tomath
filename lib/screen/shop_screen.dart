import 'package:flutter/material.dart';
import 'package:tomath/widget/plank_info.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/ShopBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: PlankInfo(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/ui/kertasPipih.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/background/ShopBG.png',
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(height: 2),

                            // Bagian harga: Rp (sebagai gambar) + angka (teks)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ui/currency.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '10.000',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/ui/kertasPipih.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/background/TrainingBG.png',
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/ui/currency.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '10.000',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),


        //   child: Column(
      //   children: [
      //     Expanded(
      //       flex:3,
      //       child: SizedBox.shrink(),
      //     ),
      //     Expanded(
      //       flex: 3,
      //       child: Container(
      //
      //           width : MediaQuery.of(context).size.width,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 fit: BoxFit.fill,
      //                 image: AssetImage('assets/ui/PapanKayuShort.png'),
      //               )
      //           ),
      //           child: Column(
      //               children: [
      //                 Expanded(
      //                   flex: 5,
      //                   child: Container(),
      //                 ),
      //                 Expanded(
      //                   flex: 2,
      //                   child: Container(
      //                     alignment: Alignment.topRight,
      //                     // padding: EdgeInsets.only(right: 50),
      //                     child: Row(
      //                       children: [
      //                         Expanded(
      //                           flex: 4,
      //                           child: SizedBox.shrink(),
      //                         ),
      //                         Expanded(
      //                             flex: 4,
      //                             child: Container(
      //                               alignment: Alignment.topRight,
      //                               child:InkWell(
      //                                 onTap: () {
      //                                 },
      //                                 child: Container(
      //                                   alignment: AlignmentGeometry.center,
      //                                   width: 150,
      //                                   height: 50,
      //                                   decoration: BoxDecoration(
      //                                     image: DecorationImage(
      //                                       image: AssetImage('assets/ui/NavbarKayu.png'),
      //                                       fit: BoxFit.fill,
      //                                     ),
      //                                   ),
      //                                   child: Text('Edit', style: TextStyle(fontSize: 17, color: Colors.white),),
      //                                 ),
      //                               ),
      //                             )
      //                         ),
      //                         Expanded(
      //                           flex: 2,
      //                           child: Container(
      //                             alignment: Alignment.topLeft,
      //                             child: SizedBox.shrink(
      //
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //
      //                     ),
      //
      //                   ),
      //
      //                 ),
      //
      //               ]
      //           )
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: SizedBox.shrink(),
      //     ),
      //   ],
      // ),
      ),
    );
  }
}