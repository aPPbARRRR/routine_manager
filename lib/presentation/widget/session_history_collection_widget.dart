import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:routine_manager/presentation/provider/fetched_session_history_collection.dart';
import 'package:routine_manager/presentation/widget/app_icon_button.dart';
import 'package:routine_manager/presentation/widget/write_text_dialog.dart';

import '../../model/program.dart';
import '../../model/session.dart';
import '../../model/session_history.dart';
import '../constant/app_color.dart';
import '../constant/window_size.dart';

class SessionHistoryCollectionWidget extends ConsumerWidget {
  const SessionHistoryCollectionWidget({
    super.key,
    required this.programHistoryUid,
    required this.program,
  });

  final String programHistoryUid;
  final Program program;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionHistories =
        ref.watch(fetchedSessionHistoryCollectionProvider(programHistoryUid));

    return sessionHistories.when(
      data: (data) {
        final histories = data;
        return Column(
          children: histories.map((history) {
            return _SessionHistoryTile(
              history: history,
              session: program.programSessions.firstWhere(
                  (session) => session.sessionUid == history.sessionUid),
            );
          }).toList(),
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class _SessionHistoryTile extends StatefulWidget {
  const _SessionHistoryTile({
    super.key,
    required this.history,
    required this.session,
  });

  final SessionHistory history;
  final Session session;

  @override
  State<_SessionHistoryTile> createState() => _SessionHistoryTileState();
}

class _SessionHistoryTileState extends State<_SessionHistoryTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: AppColor.sessionColor(widget.session.sessionPriority),
              ),
            ),
            // 진행률을 나타내는 반투명 오버레이
            IgnorePointer(
              ignoring: true,
              child: Container(
                width: MediaQuery.of(context).size.width *
                    widget.history.progressedTimeInSeconds /
                    widget.session.sessionTimeInSeconds,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.session.sessionTitle,
                    style: TextStyle(fontSize: 12),
                  ),
                  if (widget.history.sessionMemo != null &&
                      widget.history.sessionMemo != '')
                    AppIconButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => WriteTextDialog(
                          isReadOnly: true,
                          fontSize: 12,
                          textFieldHeight:
                              (WindowSize.currentSize.height - 128).toInt(),
                          initialText: widget.history.sessionMemo,
                        ),
                      ),
                      icon: Symbols.article,
                      tooltip: '메모 보기',
                    ),
                  Text(
                    '${(widget.history.progressedTimeInSeconds ~/ 3600).toString().padLeft(2, '0')}:${((widget.history.progressedTimeInSeconds % 3600) ~/ 60).toString().padLeft(2, '0')} / '
                    '${(widget.session.sessionTimeInSeconds ~/ 3600).toString().padLeft(2, '0')}:${((widget.session.sessionTimeInSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.gray0,
                    ),
                  ),
                ],
              ),
            ),

            // 호버링 시 테두리
            if (isHovering)
              IgnorePointer(
                ignoring: true,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.gray0, width: 2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
