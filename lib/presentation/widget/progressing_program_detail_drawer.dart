// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:routine_manager/model/program.dart';
// import 'package:routine_manager/model/session.dart';
// import 'package:routine_manager/model/session_extension.dart';
// import 'package:routine_manager/presentation/constant/app_color.dart';
// import 'package:shimmer/shimmer.dart';

// class ProgramDetailDrawer extends ConsumerWidget {
//   const ProgramDetailDrawer({
//     super.key,
//     required this.selectedSessionUid,
//   });

//   final Program program;
//   final String? selectedSessionUid;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedProgram = ref.watch(selectedProgramProvider);

//     if (selectedProgram == null) {
//       return const SizedBox.shrink();
//     }

//     return Drawer(
//       backgroundColor: AppColor.primaryMain,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   program.programTitle,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   '총 ${program.programTimeInSeconds ~/ 3600}시간 ${(program.programTimeInSeconds % 3600) ~/ 60}분',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ...program.programSessions.map(
//                     (session) => _SessionProgressTile(
//                       session: session,
//                       isSelected: session.sessionUid == selectedSessionUid,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SessionProgressTile extends StatefulWidget {
//   const _SessionProgressTile({
//     required this.session,
//     required this.isSelected,
//   });

//   final Session session;
//   final bool isSelected;

//   @override
//   State<_SessionProgressTile> createState() => _SessionProgressTileState();
// }

// class _SessionProgressTileState extends State<_SessionProgressTile> {
//   bool isHovering = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: AppColor.sessionColor(widget.session.sessionPriority),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           // Progress overlay
//           IgnorePointer(
//             ignoring: true,
//             child: Container(
//               width: MediaQuery.of(context).size.width *
//                   widget.session.progressedSessionTimeInSeconds /
//                   widget.session.sessionTimeInSeconds,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//           ),
//           // Session info
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.session.sessionTitle,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   '${widget.session.sessionRemainingTime ~/ 60}분 남음',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[300],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Selected session indicator
//           if (widget.isSelected)
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppColor.accentPink,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: widget.isSelected
//                   ? const Shimmer(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.transparent,
//                           Colors.transparent,
//                           Colors.white10,
//                           Colors.white24,
//                           Colors.white10,
//                           Colors.transparent,
//                           Colors.transparent,
//                         ],
//                       ),
//                       child: SizedBox.expand(),
//                     )
//                   : null,
//             ),
//         ],
//       ),
//     );
//   }
// }
