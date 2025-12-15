import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/plank_info.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/TrainingBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(flex: 4,
              child: SizedBox.shrink(),
            ),
            Flexible(flex: 4,
              child: PlankInfo(
                  backgroundImage: 'assets/ui/Mading_medium.png',

                  showLeftButton: false,
                  showRightButton: false,

                  child: Row(
                      children: [
                        Expanded(flex:1,
                          child: Container(
                            // color: Colors.red,
                          ),
                        ),
                        Expanded(flex:3,
                            child: Column(
                                children: [
                                  Expanded(flex: 1,
                                    child: Container(
                                      // color: Colors.white,
                                    )
                                  ),
                                  Expanded(flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      child: ListView.separated(
                                          itemCount: 5,
                                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                print("Item $index diklik");
                                                GoRouter.of(context).push('/traininggame$index');
                                              },
                                              child: Stack(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  Image.asset(
                                                    'assets/ui/kertasPipih.png',
                                                    width: double.infinity,
                                                    height: 50,
                                                    fit: BoxFit.cover,
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 25), // jarak dari kiri
                                                    child: Text(
                                                      'Nama Item $index',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                      )
                                      // color: Colors.red,
                                    )
                                  ),
                                  Expanded(flex: 1,
                                    child: Container(
                                        // color: Colors.green,
                                    )
                                  ),
                                ]
                            )
                        ),
                        Expanded(flex:2,
                          child: Container(
                            // color: Colors.blue,
                          ),
                        ),
                      ]
                  )
              ),
            ),
            Flexible(flex: 2,
              child: Container(
                // color: Colors.red,
              ),
            ),
          ],
        ),
      )
    );
  }
}
