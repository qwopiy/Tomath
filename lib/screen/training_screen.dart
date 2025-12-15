import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/materi.dart';
import '../widget/plank_info.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  Widget _TrainingSubBab(BuildContext context, int bab, int subBab) {
    return InkWell(
      onTap: () {
        print("Bab $bab diklik");
        GoRouter.of(context).push('/traininggame${bab + 1}${subBab + 1}');
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
              Materi.subBab[bab][subBab],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _TrainingBab(BuildContext context, int bab) {
    return Column(
      children: [
        Text(
          Materi.bab[bab],
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        _TrainingSubBab(context, bab, 0),
        _TrainingSubBab(context, bab, 1),
        _TrainingSubBab(context, bab, 2),
      ],
    );
  }

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
                                        itemCount: 6,
                                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                                        itemBuilder: (context, index) {
                                          return _TrainingBab(context, index);
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
