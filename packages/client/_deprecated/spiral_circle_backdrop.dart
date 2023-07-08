// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:primala/app/core/p2p_scheduling/constants/interaction_type.dart';
// import 'package:primala/app/core/p2p_scheduling/presentation/widgets/widgets.dart';
// import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';

// class SpiralCircleBackdrop extends StatelessWidget {
//   const SpiralCircleBackdrop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // print(SpiralColors.ordererColors.length);
//     return StreamBuilder<Object>(
//       stream: null,
//       builder: (context, snapshot) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.25),
//                 offset: const Offset(-20, 4),
//                 blurRadius: 2,
//               ),
//             ],
//             gradient: SweepGradient(
//               center: FractionalOffset.center,
//               startAngle: 3,
//               endAngle: 2 * 3.14,
//               colors: [
//                 const Color(0xFF4BCF68),
//                 const Color(0xFFFFF680).withOpacity(0.762727),
//                 const Color(0xFF4BCF68),
//               ],
//               stops: const [0.104163, 0.500149, 0.88107],
//             ),
//           ),
//           child: PlatformScaffold(
//             backgroundColor: Colors.transparent,
//             body: const Center(
//               child: SpiralCircle(
//                 reverseOrderedTimes: [
//                   '08:30',
//                   '09:00',
//                   '09:30',
//                   '10:00',
//                   '10:30',
//                   '11:00',
//                   '11:30',
//                   '12:00',
//                   '12:30',
//                   '13:00',
//                   '13:30',
//                   '14:00',
//                   '14:30',
//                   '15:00',
//                   '15:30',
//                   '16:00',
//                   '16:30',
//                   '17:00',
//                   '17:30',
//                   '18:00',
//                   '18:30',
//                   '19:00',
//                   '19:30',
//                   '20:00',
//                   '20:30',
//                   '21:00',
//                   '21:30',
//                   '22:00',
//                   '22:30',
//                   '23:00',
//                   '23:30',
//                   '00:00',
//                   '00:30',
//                   '01:00',
//                   '01:30',
//                   '02:00',
//                   '02:30',
//                   '03:00',
//                   '03:30',
//                   '04:00',
//                   '04:30',
//                   '05:00',
//                   '05:30',
//                   '06:00',
//                   '06:30',
//                   '07:00',
//                   '07:30',
//                   '08:00',
//                   '08:30',
//                 ],
//                 interactionType: InteractionType.range,
//                 selectedState:
//                     Left([IndividualTimeRange(startTime: '', endTime: '')]),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
