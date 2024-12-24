import 'package:flutter/material.dart';

import '../../model/program.dart';
import '../../model/program_history.dart';
import '../constant/app_color.dart';
import 'session_history_collection_widget.dart';

class HistoryTile extends StatefulWidget {
  const HistoryTile({
    super.key,
    required this.history,
    required this.program,
  });

  final Program program;
  final ProgramHistory history;

  @override
  State<HistoryTile> createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile> {
  final double _sessionHistoryHeight = 40;

  bool _isHovering = false;
  bool _isHistoryDetailOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isHistoryDetailOpen = !_isHistoryDetailOpen),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: Container(
          height: _isHistoryDetailOpen
              ? 90 +
                  widget.program.programSessions.length * _sessionHistoryHeight
              : 90,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovering
                ? AppColor.white.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.history.startedAt.year}/${widget.history.startedAt.month.toString().padLeft(2, '0')}/${widget.history.startedAt.day.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    _formatTimeRange(
                        startedAt: widget.history.startedAt,
                        endedAt: widget.history.endedAt),
                    style: const TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (_isHistoryDetailOpen)
                SizedBox(
                  height: widget.program.programSessions.length *
                      _sessionHistoryHeight,
                  child: SessionHistoryCollectionWidget(
                    programHistoryUid: widget.history.historyUid,
                    program: widget.program,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimeRange({required DateTime startedAt, DateTime? endedAt}) {
    final start = startedAt;
    final end = endedAt ?? startedAt;

    if (endedAt == null) {
      return '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} ~ ';
    }

    // 같은 날짜인 경우
    if (start.year == end.year &&
        start.month == end.month &&
        start.day == end.day) {
      return '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} ~ '
          '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
    }

    // 1일 차이나는 경우
    final difference = end.difference(start).inDays;
    if (difference == 1) {
      return '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} ~ '
          '익일 ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
    }

    // 년도가 다른 경우
    if (start.year != end.year) {
      return '${start.year}년 ${start.month}월 ${start.day}일 ${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} ~ '
          '${end.year}년 ${end.month}월 ${end.day}일 ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
    }

    // 월이 다른 경우
    if (start.month != end.month) {
      return '${start.month}월 ${start.day}일 ${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} ~ '
          '${end.month}월 ${end.day}일 ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
    }

    // 1일 초과 차이나는 경우
    return '${start.day}일 ${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} ~ '
        '${end.day}일 ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
  }
}
