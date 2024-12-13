import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/session.dart';
import 'package:routine_manager/presentation/layout/default_layout.dart';
import 'package:routine_manager/presentation/provider/fetched_programs.dart';
import 'package:routine_manager/presentation/widget/app_text_button.dart';
import 'package:routine_manager/presentation/widget/progress_time_brief_bar.dart';
import 'package:routine_manager/service/app_service.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';
import '../constant/app_color.dart';
import '../widget/app_scaffold.dart';
import '../widget/app_textfield.dart';

class CreateProgramScreen extends ConsumerStatefulWidget {
  const CreateProgramScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProgramScreenState();
}

class _CreateProgramScreenState extends ConsumerState<CreateProgramScreen> {
  final TextEditingController _programNameController = TextEditingController();
  final TextEditingController _programHourController = TextEditingController();
  final TextEditingController _programMinuteController =
      TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  final TextEditingController _sessionHourController = TextEditingController();
  final TextEditingController _sessionMinuteController =
      TextEditingController();

  final List<Session> _sessions = [];
  Size _windowSize = Size(435, 300);
  // Size _sessionWindowSize = Size(435, 300);

  // bool _isOpenSideScreen = false;
  bool _isMouseOveringOnAddSessionButton = false;

  String? _errorText;
  Duration _remainingProgramTime = Duration(hours: 24);
  String _programDescription = '';

  @override
  void initState() {
    super.initState();
    windowManager.setSize(_windowSize); // 하단 15
  }

  @override
  void dispose() {
    _programNameController.dispose();
    _sessionNameController.dispose();
    _sessionHourController.dispose();
    _sessionMinuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: _windowSize.width,
          height: _windowSize.height,
          child: DefaultLayout(
            titleBarActions: const [],
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ProgressTimeBriefBar(
                  program: Program(
                      programTitle: _programNameController.text,
                      programUid: const Uuid().v4(),
                      programDescription: '',
                      startedHour:
                          int.tryParse(_programHourController.text) ?? 0,
                      startedMinute:
                          int.tryParse(_programMinuteController.text) ?? 0,
                      programTimeInSeconds: _remainingProgramTime.inSeconds,
                      programSessions: _sessions),
                ),

                if (_errorText != null)
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(_errorText!,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center),
                    ),
                  ),
                AppTextField(
                  height: 50,
                  maxLines: 1,
                  controller: _programNameController,
                  hintText: '생성할 프로그램의 이름을 입력해주세요.',
                  suffixIcon: IconButton(
                      // onPressed: () => _openSideScreen(300),
                      onPressed: () => _openWriteProgramDescriptionDialog(),
                      icon: Icon(Symbols.edit_note, color: Colors.white)),
                ),
                // ProgramTimeSelector(),
                _ProgramTimeSection(),
                const Gap(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _addSectionContainer(),
                        SizedBox(
                          height: _sessions.length < 6
                              ? _sessions.length * 60
                              : 300,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ..._sessions.map((session) => _SessionTile(
                                      session: session,
                                      trailing: IconButton(
                                        onPressed: () =>
                                            _removeSession(session),
                                        icon: Icon(
                                          Symbols.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextButton(
                        onPressed: () => Navigator.pop(context),
                        text: '취소',
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      AppTextButton(
                        onPressed: () async => await _saveProgram(),
                        text: '저장',
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // if (_isOpenSideScreen) // 삭제요망
        //   SizedBox(
        //     width: _sessionWindowSize.width,
        //     height: _windowSize.height,
        //     child: _WriteProgramDescriptionSideScreen(
        //       sideScreenSize: _sessionWindowSize,
        //       onBackButtonPressed: () => _closeSideScreen(),
        //     ),
        //   )
      ],
    );
  }

  Container _addSectionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            height: 50,
            maxLines: 1,
            filledColor: Colors.transparent,
            controller: _sessionNameController,
            hintText: '추가할 세션 이름을 입력해주세요.',
            suffixIcon: _sessionNameController.text.isEmpty ||
                    _sessionNameController.text == ''
                ? null
                : GestureDetector(
                    onTap: () => _addSession(),
                    child: MouseRegion(
                      // 마우스 오버시 색상 변경
                      onEnter: (event) => setState(
                          () => _isMouseOveringOnAddSessionButton = true),
                      onExit: (event) => setState(
                          () => _isMouseOveringOnAddSessionButton = false),
                      child: Icon(
                        Symbols.add,
                        color: _isMouseOveringOnAddSessionButton
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('세션 시간 '),
                  _timeTextField(
                      controller: _sessionHourController,
                      maxValue: 23,
                      hintText: '0',
                      height: 40,
                      width: 70,
                      filledColor: Colors.grey.withOpacity(0.1)),
                  Text('시간'),
                  _timeTextField(
                      controller: _sessionMinuteController,
                      maxValue: 59,
                      hintText: '00',
                      height: 40,
                      width: 70,
                      filledColor: Colors.grey.withOpacity(0.1)),
                  Text('분'),
                ],
              ),
              Text(
                  '잔여 시간 ${_remainingProgramTime.inHours}:${_remainingProgramTime.inMinutes % 60 == 0 ? '00' : _remainingProgramTime.inMinutes % 60}'),
            ],
          ),
        ],
      ),
    );
  }

  AppTextField _timeTextField({
    required TextEditingController controller,
    required int maxValue,
    required String hintText,
    int? height,
    int? width,
    Color? filledColor,
  }) {
    return AppTextField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      height: height ?? 40,
      width: width ?? 70,
      maxLines: 1,
      maxLength: maxValue.toString().length,
      controller: controller,
      filledColor: filledColor ?? AppColor.primaryMainDark,
      hintText: hintText,
      onChanged: (val) {
        if (int.tryParse(val) != null && int.tryParse(val)! > maxValue) {
          controller.text = hintText;
        }
      },
    );
  }

  Padding _ProgramTimeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('매일 '),
          _timeTextField(
            controller: _programHourController,
            maxValue: 23,
            hintText: '0',
          ),
          Text('시'),
          _timeTextField(
            controller: _programMinuteController,
            maxValue: 59,
            hintText: '00',
          ),
          Text('분 시작'),
        ],
      ),
    );
  }

  void _updateWindowSize() {
    // 기본 305 + 에러텍스트 30 + 세션 60 * 세션 수
    final height = 305 +
        (_errorText != null ? 30 : 0) +
        (_sessions.length < 6 ? _sessions.length * 60 : 300);

    _windowSize = Size(_windowSize.width, height.toDouble());

    // if (_isOpenSideScreen) {
    //   windowManager.setSize(Size(
    //       _windowSize.width + _sessionWindowSize.width, height.toDouble()));
    // } else {
    //   windowManager.setSize(_windowSize);
    // }
    windowManager.setSize(_windowSize);
  }

  // void _openSideScreen(double sideScreenWidth) {
  //   _sessionWindowSize = Size(sideScreenWidth, _windowSize.height);
  //   windowManager
  //       .setSize(Size(_windowSize.width + sideScreenWidth, _windowSize.height));
  //   setState(() => _isOpenSideScreen = true);
  // }

  // void _closeSideScreen() {
  //   windowManager.setSize(_windowSize);
  //   setState(() => _isOpenSideScreen = false);
  // }

  void _updateErrorText(String? text) {
    setState(() {
      _errorText = text;
    });
    _updateWindowSize();
  }

  void _openWriteProgramDescriptionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final textFieldHeight = _windowSize.height.toInt() - 128;
        const fontSize = 14.0;
        return WriteTextDialog(
          hintText: '프로그램 설명을 입력해주세요.',
          onSave: (text) => _updateProgramDescription(text),
          fontSize: fontSize,
          textFieldHeight: textFieldHeight,
          initialText: _programDescription,
        );
      },
    );
  }

  void _updateProgramDescription(String text) {
    setState(() {
      _programDescription = text;
    });
  }

  void _addSession() {
    final sessiontHour = int.tryParse(_sessionHourController.text) ?? 0;
    final sessiontMinute = int.tryParse(_sessionMinuteController.text) ?? 0;
    // 세션 시간설정 오류처리
    if (sessiontHour == 0 && sessiontMinute == 0) {
      _updateErrorText('세션 시간을 설정해주세요.');
      return;
    }
    // 세션시간이 잔여시간을 초과한 경우
    if (sessiontHour * 60 * 60 + sessiontMinute * 60 >
        _remainingProgramTime.inSeconds) {
      _updateErrorText('잔여시간을 초과했습니다.');
      return;
    }

    setState(() {
      _sessions.add(
        Session(
            sessionTitle: _sessionNameController.text,
            sessionUid: const Uuid().v4(),
            progressedSessionTimeInSeconds:
                sessiontHour * 60 * 60 + sessiontMinute * 60,
            sessionRemainingTime: sessiontHour * 60 * 60 + sessiontMinute * 60,
            sessionPriority: _sessions.length,
            sessionMemo: ''),
      );
      _remainingProgramTime -=
          Duration(hours: sessiontHour, minutes: sessiontMinute);
      _sessionNameController.clear();
      _sessionHourController.clear();
      _sessionMinuteController.clear();
      _updateErrorText(null);
    });
  }

  void _removeSession(Session session) {
    setState(() {
      // 잔여시간 재계산
      _remainingProgramTime += Duration(
          hours: session.progressedSessionTimeInSeconds ~/ 3600,
          minutes: (session.progressedSessionTimeInSeconds % 3600) ~/ 60);

      _sessions.remove(session);

      // 세션 순서 재정렬
      for (int i = 0; i < _sessions.length; i++) {
        _sessions[i] = _sessions[i].copyWith(sessionPriority: i);
      }

      _updateWindowSize();
    });
  }

  Future<void> _saveProgram() async {
    // validattion
    if (_programNameController.text.isEmpty ||
        _programNameController.text == '') {
      _updateErrorText('프로그램 이름을 입력해주세요.');
      return;
    }

    if (_sessions.isEmpty) {
      _updateErrorText('세션을 추가해주세요.');
      return;
    } else {
      // save
      await ref.read(appServiceProvider).saveProgram(Program(
          programTitle: _programNameController.text,
          programUid: const Uuid().v4(),
          programDescription: _programDescription,
          startedHour: int.tryParse(_programHourController.text) ?? 0,
          startedMinute: int.tryParse(_programMinuteController.text) ?? 0,
          programTimeInSeconds: _remainingProgramTime.inSeconds,
          programSessions: _sessions));

      await ref.read(fetchedProgramsProvider.notifier).refresh();
      Navigator.pop(context);
    }
  }
}

class WriteTextDialog extends StatefulWidget {
  const WriteTextDialog({
    super.key,
    required this.fontSize,
    required this.textFieldHeight,
    required this.hintText,
    required this.onSave,
    this.initialText,
  });

  final double fontSize;
  final int textFieldHeight;
  final String hintText;
  final Function(String) onSave;
  final String? initialText;

  @override
  State<WriteTextDialog> createState() => _WriteTextDialogState();
}

class _WriteTextDialogState extends State<WriteTextDialog> {
  late final TextEditingController controller = TextEditingController(
    text: widget.initialText == null || widget.initialText == ''
        ? null
        : widget.initialText,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryMain,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              isFontSizeAuto: false,
              fontSize: widget.fontSize,
              height: widget.textFieldHeight,
              maxLines: widget.textFieldHeight ~/ widget.fontSize,
              controller: controller,
              hintText: widget.hintText,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextButton(
                  onPressed: () => Navigator.pop(context),
                  text: '취소',
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                AppTextButton(
                  onPressed: () async {
                    await widget.onSave(controller.text);
                    Navigator.pop(context);
                  },
                  text: '저장',
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WriteProgramDescriptionSideScreen extends StatelessWidget {
  const _WriteProgramDescriptionSideScreen({
    super.key,
    required this.sideScreenSize,
    this.onBackButtonPressed,
  });

  final Size sideScreenSize;
  final Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColor.primaryMain.withOpacity(0.6),
      titleBarActions: [
        IconButton(
            onPressed: onBackButtonPressed,
            icon: Icon(
              Symbols.arrow_back_ios,
              color: Colors.white,
              size: 18,
            ))
      ],
      body: Column(
        children: [
          AppTextField(
              // padding: const EdgeInsets.only(right: 10),
              isFontSizeAuto: false,
              height: (sideScreenSize.height - 80).toInt(),
              maxLines: 100,
              controller: TextEditingController(),
              hintText: '프로그램에 대한 설명을 입력해주세요.'),
        ],
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile(
      {super.key, required this.session, required this.trailing});

  final Session session;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    Duration sessionTime =
        Duration(seconds: session.progressedSessionTimeInSeconds);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      decoration:
          BoxDecoration(color: AppColor.sessionColor(session.sessionPriority)),
      child: ListTile(
        leading: Text(
          '${session.sessionPriority + 1}',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        title: Text(session.sessionTitle,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        subtitle: Text(
          '${sessionTime.inHours}:${sessionTime.inMinutes % 60 == 0 ? '00' : sessionTime.inMinutes % 60}',
          style: TextStyle(fontSize: 12, color: Colors.grey[300]),
        ),
        trailing: trailing,
      ),
    );
  }
}
