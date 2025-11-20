import 'package:flutter/material.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEED7A1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Column membagi layar jadi 2 kolom (atas dan bawah)
        child: Column(
          children: [
            // atas: gambar player, musuh, soal
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
                // layar atas dibagi 2 juga
                // atas: soal
                // bawah: gambar player dan musuh
                child: Column(
                  children: [
                    // atas: soal
                    Expanded(
                      // flex: 6,
                      child: Container(
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: Text(
                          'Soal muncul di sini',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // bawah: gambar player dan musuh
                    Expanded(
                      // flex: 4,
                      child: Container(
                        color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // gambar player
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 80,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Player',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            // gambar musuh
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 80,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Musuh',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
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
            ),
            // bawah: pilihan jawaban
            // TODO: betulin bentuk pilihan jawaban
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.green,
                // wrap dari kiri ke kanan, overflow ke bawah
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  direction: Axis.horizontal,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('Pilihan 1 ditekan');
                      },
                      child: Text(
                        'Pilihan 1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('Pilihan 2 ditekan');
                      },
                      child: Text(
                        'Pilihan 2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('Pilihan 3 ditekan');
                      },
                      child: Text(
                        'Pilihan 3',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('Pilihan 4 ditekan');
                      },
                      child: Text(
                        'Pilihan 4',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}