import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_manager/presentation/provider/progressing_program_collection.dart';

import '../constant/app_color.dart';
import '../screen/brief_board_screen.dart';

class ProgressBriefBadge extends ConsumerStatefulWidget {
  const ProgressBriefBadge({super.key});

  @override
  @override
  ConsumerState<ProgressBriefBadge> createState() => _ProgressBriefBadgeState();
}

class _ProgressBriefBadgeState extends ConsumerState<ProgressBriefBadge> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final progressingProgramCollection =
        ref.watch(progressingProgramCollectionProvider);
    if (progressingProgramCollection.isEmpty) {
      return const SizedBox.shrink();
    }
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        tooltip: '${progressingProgramCollection.length} 개 프로그램 진행중',
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const BriefBoardScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
            (route) => false,
          );
        },
        icon: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: _isHovering ? AppColor.primaryMainDark : AppColor.accentPink,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              progressingProgramCollection.length.toString(),
              style: TextStyle(
                color: _isHovering ? AppColor.accentPink : Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
