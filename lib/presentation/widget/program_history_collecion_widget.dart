import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:routine_manager/presentation/constant/app_color.dart';

import '../constant/window_size.dart';
import '../provider/fetched_program_history_collection.dart';
import '../provider/selected_program.dart';
import 'history_tile.dart';

// #todo
// 현재 모든 히스토리를 한 번에 가져오도록 구현하고 있음.
// 필요하면 업데이트시 구현할 것 -> db가 어디 가는건 아니니까... 태스크드래거에 추가시에만 구현하면 될 듯

class ProgramHistoryCollectionWidget extends ConsumerWidget {
  const ProgramHistoryCollectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgram = ref.watch(selectedProgramProvider);
    final programHistoryCollection = ref.watch(
        fetchedProgramHistoryCollectionProvider(
            programUid: selectedProgram?.programUid ?? ''));

    return Container(
      width: WindowSize.sideScreenWidth,
      decoration: BoxDecoration(
        color: AppColor.primaryMainDark2,
      ),
      child: programHistoryCollection.when(
        data: (data) {
          final programHistoryList = data.reversed.toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('프로그램 기록'),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: programHistoryList.length,
                  itemBuilder: (context, index) {
                    return HistoryTile(
                      program: selectedProgram!,
                      history: programHistoryList[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
