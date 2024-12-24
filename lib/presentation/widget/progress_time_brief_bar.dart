import 'package:flutter/material.dart';
import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/program_extension.dart';
import 'package:routine_manager/model/session.dart';
import 'package:routine_manager/model/session_extension.dart';
import 'package:routine_manager/presentation/constant/app_color.dart';
import 'package:shimmer/shimmer.dart';

class ProgressTimeBriefBar extends StatelessWidget {
  const ProgressTimeBriefBar({
    super.key,
    required this.program,
    required this.selectedSessionUid,
    this.onSessionTap,
    this.onSessionHovering,
  });

  final Program program;
  final String? selectedSessionUid;
  final Function(Session?)? onSessionTap;
  final Function(Session?)? onSessionHovering;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: LayoutBuilder(builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Row(
            children: [
              ...program.programSessions.map(
                (session) => _SectionInnerBar(
                  width: constraints.maxWidth *
                      (session.sessionTimeInSeconds /
                          program.programTimeInSeconds),
                  session: session,
                  isRunning: selectedSessionUid == session.sessionUid,
                  onHovering: (session) => print(
                      'onHovering: ${session.sessionTitle}, width: ${constraints.maxWidth * (session.sessionTimeInSeconds / program.programTimeInSeconds)} '),
                  onTap: (session) => onSessionTap?.call(session),
                ),
              ),
              // 잔여시간 최우측에 표시

              // 잔여시간이 0이면 표시 안함
              if (program.totalRestTime > 0)
                _RestInnerBar(
                  width: constraints.maxWidth *
                      (program.totalRestTime / program.programTimeInSeconds),
                  program: program,
                  isResting: selectedSessionUid == null,
                  onHovering: (session) => print(
                      'onHovering: ${session?.sessionTitle}, width: ${constraints.maxWidth * (session?.sessionTimeInSeconds ?? 0 / program.programTimeInSeconds)} '),
                  onTap: (session) => onSessionTap?.call(session),
                ),
              // GestureDetector(
              //   onTap: () => onSessionTap(null),
              //   child: Container(
              //     width: constraints.maxWidth *
              //         (program.totalRestTime / program.programTimeInSeconds),
              //     height: 20,
              //     color: Colors.black,
              //     child: Align(
              //       alignment: Alignment.center,
              //       child: Text(
              //         // remainingRestTime을 00:00 형식으로 표시
              //         '${program.remainingRestTime ~/ 3600}:${((program.remainingRestTime % 3600) ~/ 60) < 10 ? '0' : ''}${(program.remainingRestTime % 3600) ~/ 60}',
              //         style: const TextStyle(fontSize: 10),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        );
      }),
    );
  }
}

class _SectionInnerBar extends StatefulWidget {
  const _SectionInnerBar({
    super.key,
    required this.session,
    required this.onHovering,
    required this.onTap,
    required this.isRunning,
    required this.width,
  });

  final Session session;
  final Function(Session)? onHovering;
  final Function(Session)? onTap;
  final bool isRunning;
  final double width;

  @override
  State<_SectionInnerBar> createState() => _SectionInnerBarState();
}

class _SectionInnerBarState extends State<_SectionInnerBar> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (!widget.isRunning && !widget.session.isSessionCompleted) {
                widget.onTap?.call(widget.session);
              }
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Container(
                height: 20,
                color: AppColor.sessionColor(widget.session.sessionPriority),
                child: Stack(
                  children: [
                    if (widget.isRunning)
                      Shimmer(
                        enabled: false,
                        period: const Duration(milliseconds: 3000),
                        child: Container(
                          color: Colors.white,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0.1),
                            Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: widget.width *
                  widget.session.progressedSessionTimeInSeconds /
                  widget.session.sessionTimeInSeconds,
              height: 20,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: _SectionInnerBarTimeTextSection(
                width: widget.width, session: widget.session),
          ),
          if (widget.isRunning)
            IgnorePointer(
              ignoring: true,
              child: Container(
                width: widget.width,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.accentPink, width: 2),
                ),
              ),
            ),
          if (isHovering)
            IgnorePointer(
              ignoring: true,
              child: Container(
                width: widget.width,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SectionInnerBarTimeTextSection extends StatelessWidget {
  const _SectionInnerBarTimeTextSection({
    super.key,
    required this.width,
    required this.session,
    this.widthThreshold = 30,
  });

  final double width;
  final Session session;
  final double widthThreshold;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Center(
        child: session.isSessionCompleted
            ? width < 10
                ? null
                : Text('OK',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))
            :
            // width 일정수준 이하일 때는 표시 안함
            width < widthThreshold
                ?
                // width < 일정수준 && width > 10 && 1시간 이상 남았을 때는 'n+'으로 표시
                width < widthThreshold &&
                        width > 10 &&
                        session.sessionRemainingTime >= 3600
                    ? Text(
                        '${session.sessionRemainingTime ~/ 3600}+',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : null
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (session.sessionRemainingTime >= 3600)
                        Text(
                          '${session.sessionRemainingTime ~/ 3600}:',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      Text(
                        '${(session.sessionRemainingTime % 3600) ~/ 60 < 10 ? '0' : ''}${(session.sessionRemainingTime % 3600) ~/ 60}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (session.sessionRemainingTime < 3600)
                        Text(
                          ':${session.sessionRemainingTime % 60 < 10 ? '0' : ''}${session.sessionRemainingTime % 60}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
      ),
    );
  }
}

class _RestInnerBar extends StatefulWidget {
  const _RestInnerBar({
    super.key,
    required this.program,
    required this.onHovering,
    required this.onTap,
    required this.isResting,
    required this.width,
  });

  final Program program;
  final Function(Session?)? onHovering;
  final Function(Session?)? onTap;
  final bool isResting;
  final double width;

  @override
  State<_RestInnerBar> createState() => _RestInnerBarState();
}

class _RestInnerBarState extends State<_RestInnerBar> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final Color shimmerColor =
        widget.program.remainingRestTime > 0 ? Colors.white : Colors.red;
    return Container(
      width: widget.width,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (!widget.isResting) {
                widget.onTap?.call(null);
              }
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Container(
                height: 20,
                color: Colors.black,
                child: Stack(
                  children: [
                    if (widget.isResting)
                      Shimmer(
                        period: const Duration(milliseconds: 3000),
                        enabled: false,
                        child: Container(
                          color: Colors.white,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            shimmerColor.withOpacity(0.2),
                            shimmerColor.withOpacity(0.8),
                            shimmerColor.withOpacity(0.2),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: widget.width *
                  (widget.program.totalRestTime -
                      widget.program.remainingRestTime) /
                  widget.program.totalRestTime,
              height: 20,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: _RestInnerBarTimeTextSection(
                width: widget.width, program: widget.program),
          ),
          if (widget.isResting)
            IgnorePointer(
              ignoring: true,
              child: Container(
                width: widget.width,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.accentPink, width: 2),
                ),
              ),
            ),
          if (isHovering)
            IgnorePointer(
              ignoring: true,
              child: Container(
                width: widget.width,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RestInnerBarTimeTextSection extends StatelessWidget {
  const _RestInnerBarTimeTextSection({
    super.key,
    required this.width,
    required this.program,
  });

  final double width;
  final Program program;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Center(
        child: width < 34
            ? null
            : Text(
                '${(program.remainingRestTime >= 0 ? program.remainingRestTime ~/ 3600 : 0).toString().padLeft(2, '0')}:${((program.remainingRestTime.abs() % 3600) ~/ 60).toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 10,
                  color:
                      program.remainingRestTime > 0 ? Colors.white : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
