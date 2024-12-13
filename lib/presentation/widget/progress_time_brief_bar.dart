import 'package:flutter/material.dart';
import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/session.dart';
import 'package:routine_manager/presentation/constant/app_color.dart';

class ProgressTimeBriefBar extends StatelessWidget {
  const ProgressTimeBriefBar({
    super.key,
    required this.program,
  });

  final Program program;

  @override
  Widget build(BuildContext context) {
    final int remainingProgramTimeInSeconds = program.programTimeInSeconds -
        program.programSessions.fold(
            0,
            (previousValue, session) =>
                previousValue + session.sessionRemainingTime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: [
            ...program.programSessions.map(
              (session) => _InnerBar(
                session: session,
                onHovering: (session) =>
                    print('onHovering: ${session.sessionTitle} '),
                onTap: (session) => print('onTap: ${session.sessionTitle}'),
              ),
            ),
            // 잔여시간 최우측에 표시

            // 잔여시간이 0이면 표시 안함
            if (program.programTimeInSeconds - remainingProgramTimeInSeconds >=
                0)
              Expanded(
                flex: remainingProgramTimeInSeconds,
                child: Container(
                  height: 20,
                  color: Colors.black,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      // 전체 프로그램 시간에서 세션 시간들 제외한만큼을 00:00 형식으로 표시
                      '${program.programTimeInSeconds ~/ 3600}:${(program.programTimeInSeconds % 3600) ~/ 60 < 10 ? '0' : ''}${(program.programTimeInSeconds % 3600) ~/ 60}',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _InnerBar extends StatelessWidget {
  const _InnerBar({
    super.key,
    required this.session,
    required this.onHovering,
    required this.onTap,
  });

  final Session session;
  final Function(Session)? onHovering;
  final Function(Session)? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: session.sessionRemainingTime,
      child: GestureDetector(
        onTap: () => onTap?.call(session), // ## 확인
        child: MouseRegion(
          onHover: (_) => onHovering?.call(session), // ## 확인
          child: Container(
            height: 20,
            color: AppColor.sessionColor(session.sessionPriority),
            child: Center(
              child: session.sessionRemainingTime < 1800
                  ? null
                  : Text(
                      // 세션 시간은 00:00 형식으로 표시, 1시간 이하인 경우 분  으로 표시
                      session.sessionRemainingTime > 3600
                          ? '${session.sessionRemainingTime ~/ 3600}:${(session.sessionRemainingTime % 3600) ~/ 60 < 10 ? '0' : ''}${(session.sessionRemainingTime % 3600) ~/ 60}'
                          : '${session.sessionRemainingTime ~/ 60}',

                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );

    // return Expanded(
    //   flex: 1,
    //   child: Container(
    //     height: 20,
    //     color: Colors.black,
    //     child: Center(
    //       child: Text(
    //         '24:00',
    //         style: TextStyle(fontSize: 10),
    //       ),
    //     ),
    //   ),
    // );
  }
}
