import 'package:flutter/material.dart';

class PlankInfo extends StatelessWidget {
  final Widget? child;
  final double? height;

  const PlankInfo({
    super.key,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = height ?? MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight,
      child: Column(
        children: [
          const Expanded(flex: 3, child: SizedBox.shrink()),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/ui/PapanKayuShort.png'),
                ),
              ),
              child: Column(
                children: [
                  const Expanded(flex: 1,
                      child: SizedBox.shrink()
                  ),
                  Expanded(
                    flex: 4,
                    child: child ?? const SizedBox.shrink(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          const Expanded(flex: 4,
                              child: SizedBox.shrink()
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/ui/NavbarKayu.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(flex: 2,
                              child: SizedBox.shrink()
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(flex: 1,
              child: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
// class PlankInfo extends StatelessWidget {
//   const PlankInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       width: double.infinity,
//       height: screenHeight,
//       child: Column(
//         children: [
//           Expanded(flex: 3,
//               child: SizedBox.shrink(),),
//           Expanded(
//             flex: 2,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: AssetImage('assets/ui/PapanKayuShort.png'),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Expanded(flex: 1, child: SizedBox.shrink()),
//                   Expanded(flex: 4,
//                       child: child(
//                         // child content
//                         // color: Colors.red,
//                       ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       alignment: Alignment.topRight,
//                       child: Row(
//                         children: [
//                           Expanded(flex: 4,
//                               child: SizedBox.shrink(),
//                           ),
//                           Expanded(
//                             flex: 4,
//                             child: Container(
//                               alignment: Alignment.topRight,
//                               child: InkWell(
//                                 onTap: () {},
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   width: 150,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage('assets/ui/NavbarKayu.png'),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Edit',
//                                     style: TextStyle(fontSize: 17, color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(flex: 2, child: SizedBox.shrink()),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(flex: 1, child: SizedBox.shrink()),
//         ],
//       ),
//     );
//   }
// }