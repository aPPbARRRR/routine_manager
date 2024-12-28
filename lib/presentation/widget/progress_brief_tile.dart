import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/program_extension.dart';
import 'package:routine_manager/model/session.dart';
import 'package:routine_manager/model/session_extension.dart';
import 'package:routine_manager/presentation/constant/app_method.dart';
import 'package:routine_manager/presentation/widget/app_popup_menu_button.dart';

import '../constant/app_color.dart';
import '../constant/window_size.dart';
import 'app_dialog_with_two_buttons.dart';
import 'app_icon_button.dart';
import 'brief_tile_expand_button.dart';
import 'progress_time_brief_bar.dart';
import 'write_text_dialog.dart';

class ProgressBriefTile extends StatefulWidget {
  const ProgressBriefTile({
    super.key,
    required this.program,
    required this.selectedSessionUid,
    required this.onSessionTap,
    this.onTileTap,
    this.onSessionMemoSaved,
    this.onProgramStop,
    this.onProgramDescriptionTap,
  });

  final Program program;
  final String? selectedSessionUid;
  final Function(Session?) onSessionTap;
  final Function()? onTileTap;
  final Function(Session, String)? onSessionMemoSaved;
  final Function(Program)? onProgramStop;
  final Function(Program, BuildContext)? onProgramDescriptionTap;

  @override
  State<ProgressBriefTile> createState() => _ProgressBriefTileState();
}

class _ProgressBriefTileState extends State<ProgressBriefTile> {
  bool isHovering = false;
  bool isExpanded = false;
  Session? hoveringSession;

  @override
  Widget build(BuildContext context) {
    final selectedSession = widget.selectedSessionUid != null
        ? widget.program.programSessions.firstWhere(
            (session) => session.sessionUid == widget.selectedSessionUid)
        : null;
    return GestureDetector(
      onTap: () => widget.onTileTap?.call(),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: Container(
          height: isExpanded
              ? 110 +
                  (widget.program.programSessions.length <= 5
                      ? widget.program.programSessions.length * 60
                      : 5 * 60) +
                  5
              : 110,
          decoration: _hoveringBoxDecorationWithGradient(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _programTitleSectionRow(context),
                      ),
                      _terminateProgramButton(context)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _sessionTitleSectionRow(selectedSession),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Center(
                  child: ProgressTimeBriefBar(
                    program: widget.program,
                    selectedSessionUid: widget.selectedSessionUid,
                    onSessionTap: widget.onSessionTap,
                    onSessionHovering: onSessionHovering,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _bottomBarSectionRow(),
                ),
              ),
              // 남은 공간 차지하는 size박스
              const Gap(5),
              if (isExpanded)
                SizedBox(
                  height: widget.program.programSessions.length <= 5
                      ? widget.program.programSessions.length * 60
                      : 5 * 60, // 5개 세션의 높이
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ...widget.program.programSessions.map(
                        (session) => _SessionTile(
                          session: session,
                          onMemoSaved: widget.onSessionMemoSaved,
                          onSessionTileTap: () => widget.onSessionTap(session),
                        ),
                      ),
                    ],
                  ),
                ),
              // Column(
              //   children: [
              //     ...widget.program.programSessions.map(
              //       (session) => _SessionTile(
              //         session: session,
              //         onMemoSaved: widget.onSessionMemoSaved,
              //         onSessionTileTap: () => widget.onSessionTap(session),
              //       ),
              //     ),
              //     const Gap(5),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Row _bottomBarSectionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BriefTileExpandButton(
          onPressed: _toggleExpanded,
          isExpanded: isExpanded,
        ),
        Text(
            '미완료 세션 ${widget.program.programSessions.where((session) => !session.isSessionCompleted).length} 개',
            style: TextStyle(fontSize: 12, color: Colors.grey[300]),
            textAlign: TextAlign.right),
      ],
    );
  }

  BoxDecoration _hoveringBoxDecorationWithGradient() {
    return BoxDecoration(
      // color: isHovering ? AppColor.white.withOpacity(0.7) : null,
      gradient: isHovering
          ? LinearGradient(
              colors: [
                Colors.transparent,
                AppColor.white.withOpacity(0.2),
                AppColor.white.withOpacity(0.5),
              ],
            )
          : null,
    );
  }

  Row _sessionTitleSectionRow(Session? selectedSession) {
    return Row(
      children: [
        Text(
            selectedSession == null
                ? '남은 프로그램 여유 시간 :'
                : selectedSession.sessionTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Gap(10),
        if (selectedSession == null)
          Text(
              '${AppMethod.timeTextWithUnitThreeUnit(timeInSeconds: widget.program.remainingRestTime)}'),
        if (selectedSession != null)
          Text(
              '${AppMethod.timeTextWithUnitThreeUnit(timeInSeconds: selectedSession.sessionRemainingTime)} / ${AppMethod.timeTextWithUnitTwoUnit(timeInSeconds: selectedSession.sessionTimeInSeconds)}'),
      ],
    );
  }

  Row _programTitleSectionRow(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.program.programTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        if (widget.program.programDescription != null &&
            widget.program.programDescription != '')
          AppIconButton(
            onPressed: () =>
                widget.onProgramDescriptionTap?.call(widget.program, context),
            icon: Symbols.article,
            tooltip: '프로그램 설명',
            padding: EdgeInsets.symmetric(vertical: 5),
          )
      ],
    );
  }

  AppIconButton _terminateProgramButton(BuildContext context) {
    return AppIconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AppDialogWithTwoButtons(
          // title: '프로그램 종료',
          content: '실행중인 프로그램이 종료됩니다. 계속하시겠습니까?',
          confirmText: '종료',
          onConfirm: () async {
            // 종료시 화면 크기 조절
            // 프로그램 종료 후 진행중인 프로그램이 없을 경우 90 + 75로.
            final addingHeight = isExpanded
                ? -110 +
                    (widget.program.programSessions.length <= 5
                        ? -(widget.program.programSessions.length * 60)
                        : -(5 * 60)) +
                    5
                : -110;

            bool isLessThanMinimunSize =
                WindowSize.currentSize.height + addingHeight < 90 + 75;

            if (isLessThanMinimunSize) {
              await WindowSize.updateWindowSize(
                size: Size(WindowSize.currentSize.width, 90 + 75),
                onExpanded: () => widget.onProgramStop?.call(widget.program),
              );
            } else {
              await WindowSize.verticalExpand(
                addingHeight:
                    isLessThanMinimunSize ? 90 + 75 : addingHeight.toDouble(),
                onExpanded: () => widget.onProgramStop?.call(widget.program),
              );
            }
          },
        ),
      ),
      icon: Symbols.close,
      tooltip: '프로그램 중단',
      padding: EdgeInsets.symmetric(vertical: 5),
    );
  }

  void onSessionHovering(Session? session) => setState(() {
        hoveringSession = session;
      });

  Future<void> _toggleExpanded() async {
    await WindowSize.verticalExpand(
      addingHeight: isExpanded
          ? -(widget.program.programSessions.length <= 5
                      ? widget.program.programSessions.length * 60
                      : 5 * 60)
                  .toDouble() -
              5
          : (widget.program.programSessions.length <= 5
                      ? widget.program.programSessions.length * 60
                      : 5 * 60)
                  .toDouble() +
              5,
      onExpanded: () => setState(() => isExpanded = !isExpanded),
    );
  }
}

class _SessionTile extends StatefulWidget {
  const _SessionTile({
    required this.session,
    required this.onMemoSaved,
    required this.onSessionTileTap,
  });

  final Session session;
  final Function(Session, String)? onMemoSaved;
  final Function() onSessionTileTap;

  @override
  State<_SessionTile> createState() => _SessionTileState();
}

class _SessionTileState extends State<_SessionTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSessionTileTap,
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              MouseRegion(
                onEnter: (_) => setState(() => isHovering = true),
                onExit: (_) => setState(() => isHovering = false),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        AppColor.sessionColor(widget.session.sessionPriority),
                  ),
                ),
              ),
              // 진행률을 나타내는 반투명 오버레이
              IgnorePointer(
                ignoring: true,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      widget.session.progressedSessionTimeInSeconds /
                      widget.session.sessionTimeInSeconds,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              if (isHovering)
                IgnorePointer(
                  ignoring: true,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.gray0, width: 2),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.session.sessionTitle),
                        AppIconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => WriteTextDialog(
                              initialText: widget.session.sessionMemo,
                              fontSize: 14,
                              textFieldHeight:
                                  WindowSize.currentSize.height.toInt() - 128,
                              hintText: '메모를 입력해주세요.',
                              onSave: (text) => widget.onMemoSaved
                                  ?.call(widget.session, text),
                            ),
                          ),
                          icon: Symbols.article,
                          tooltip: '메모',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppMethod.remainingTimeTextWithUnit(
                            timeInSeconds: widget.session.sessionTimeInSeconds,
                            progressedTimeInSeconds:
                                widget.session.progressedSessionTimeInSeconds,
                            trailing: '남았습니다 ',
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.gray0,
                          ),
                        ),
                        Text(
                          '/ ${AppMethod.timeTextWithUnitTwoUnit(timeInSeconds: widget.session.sessionTimeInSeconds)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.gray0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
