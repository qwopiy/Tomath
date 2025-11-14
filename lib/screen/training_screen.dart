import 'package:flutter/material.dart';
import 'package:tomath/widget/plank_info.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/TrainingBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: PlankInfo(
          child: Row(
            children: [
              Expanded(flex:1,
                child: Container(
                // color: Colors.red,
                ),
              ),
              Expanded(flex:3,
                child: Container(
                  alignment: Alignment.topCenter,
                  // color: Colors.green,
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("Item $index diklik");
                        },
                        child: Stack(
                          alignment: Alignment.centerLeft, // TEKS DITEMPATKAN DI KIRI
                          children: [
                            Image.asset(
                              'assets/ui/kertasPipih.png',
                              width: double.infinity,
                              height: 50,
                              fit: BoxFit.cover,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 25), // jarak dari kiri
                              child: Text(
                                'Nama Item $index',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ),
              ),
              Expanded(flex:1,
                child: Container(
                  // color: Colors.blue,
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}