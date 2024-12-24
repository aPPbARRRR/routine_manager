// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:routine_manager/model/program_history.dart';
// import 'package:routine_manager/presentation/constant/window_size.dart';
// import 'package:routine_manager/presentation/widget/history_tile.dart';

// void main() {
//   group('HistoryTile Widget Tests', () {
//     testWidgets('renders different date ranges without overflow',
//         (tester) async {
//       // 테스트할 다양한 날짜 케이스들
//       final testCases = [
//         // 같은 날 케이스
//         ProgramHistory(
//           historyUid: '1',
//           programUid: '1',
//           totalProgressedTimeInSeconds: 100,
//           startedAt: DateTime(2024, 3, 15, 9, 30),
//           endedAt: DateTime(2024, 3, 15, 18, 45),
//         ),
//         // 다음날 케이스
//         ProgramHistory(
//           historyUid: '2',
//           programUid: '2',
//           totalProgressedTimeInSeconds: 100,
//           startedAt: DateTime(2024, 3, 15, 23, 30),
//           endedAt: DateTime(2024, 3, 16, 1, 45),
//         ),
//         // 다른 월 케이스
//         ProgramHistory(
//           historyUid: '3',
//           programUid: '3',
//           totalProgressedTimeInSeconds: 100,
//           startedAt: DateTime(2024, 3, 31, 9, 30),
//           endedAt: DateTime(2024, 4, 2, 18, 45),
//         ),
//         // 다른 년도 케이스 (가장 긴 텍스트)
//         ProgramHistory(
//           historyUid: '4',
//           programUid: '4',
//           totalProgressedTimeInSeconds: 100,
//           startedAt: DateTime(2023, 12, 31, 23, 30),
//           endedAt: DateTime(2024, 1, 1, 1, 45),
//         ),
//       ];

//       for (final testCase in testCases) {
//         await tester.pumpWidget(MaterialApp(
//           home: Scaffold(
//             body: Container(
//                 width: WindowSize.sideScreenWidth,
//                 child: ListView(
//                   children: [
//                     HistoryTile(history: testCase),
//                   ],
//                 )),
//           ),
//         ));

//         // 오버플로우 발생 여부 확인
//         expect(tester.takeException(), null);

//         // 선택적: 실제 렌더링된 내용 확인
//         expect(find.byType(HistoryTile), findsOneWidget);
//       }
//     });
//   });
// }
