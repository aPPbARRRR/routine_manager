import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:routine_manager/main.dart';
import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/session.dart';
import 'package:routine_manager/model/session_extension.dart';
import 'package:routine_manager/presentation/layout/default_layout.dart';
import 'package:routine_manager/presentation/provider/fetched_programs.dart';
import 'package:routine_manager/presentation/widget/app_text_button.dart';
import 'package:routine_manager/presentation/widget/go_program_collection_screen_icon_button.dart';
import 'package:routine_manager/presentation/widget/progress_time_brief_bar.dart';
import 'package:routine_manager/service/app_service.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';
import '../constant/app_color.dart';
import '../constant/window_size.dart';
import '../widget/app_textfield.dart';
import '../widget/progress_brief_badge.dart';
import '../widget/write_text_dialog.dart';
import 'program_collection_screen.dart';

class CreateProgramScreen extends ConsumerStatefulWidget {
  const CreateProgramScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProgramScreenState();
}

class _CreateProgramScreenState extends ConsumerState<CreateProgramScreen> {
  final TextEditingController _programNameController = TextEditingController();
  final TextEditingController _programHourController = TextEditingController();
  final TextEditingController _sessionNameController = TextEditingController();
  final TextEditingController _sessionHourController = TextEditingController();
  final TextEditingController _sessionMinuteController =
      TextEditingController();

  final List<Session> _sessions = [];
  // Size _windowSize = Size(435, 300);
  bool _isMouseOveringOnAddSessionButton = false;
  bool _isFormValid = false;

  String? _errorText;
  int _programTimeInSeconds = 0;
  late int _notAssignedProgramTimeInSeconds = _programTimeInSeconds -
      _sessions.fold(0, (acc, session) => acc + session.sessionTimeInSeconds);
  String _programDescription = '';
  final String _programUid = const Uuid().v4();

  // @override
  // void initState() {
  //   super.initState();
  //   WindowSize.updateWindowSize(); // 하단 15
  // }

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
    return SizedBox(
      width: WindowSize.currentSize.width,
      height: WindowSize.currentSize.height,
      child: DefaultLayout(
        titleBarActions: const [
          ProgressBriefBadge(),
          GoProgramCollectionScreenIconButton()
        ],
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_programTimeInSeconds <= 0 ||
                _notAssignedProgramTimeInSeconds < 0)
              const SizedBox(
                height: 30,
              ),
            if (_programTimeInSeconds > 0 &&
                _notAssignedProgramTimeInSeconds >= 0)
              ProgressTimeBriefBar(
                onSessionTap: (_) {},
                program: Program(
                    programTitle: _programNameController.text,
                    programUid: _programUid,
                    programDescription: _programDescription,
                    programTimeInSeconds: _programTimeInSeconds,
                    progressedProgramTimeInSeconds: 0,
                    programSessions: _sessions),
                selectedSessionUid: null,
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
              onChanged: (value) => _validateProgram(),
              suffixIcon: IconButton(
                  // onPressed: () => _openSideScreen(300),
                  onPressed: () => _openWriteProgramDescriptionDialog(),
                  icon: Icon(Symbols.edit_note, color: Colors.white)),
            ),
            _ProgramTimeSection(),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _addSessionContainer(),
                    SizedBox(
                      height:
                          _sessions.length < 6 ? _sessions.length * 60 : 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ..._sessions.map((session) => _SessionTile(
                                  session: session,
                                  trailing: IconButton(
                                    onPressed: () => _removeSession(session),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTextButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const ProgramCollectionScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    ),
                    text: '취소',
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  AppTextButton(
                    onPressed: () async => await _saveProgram(),
                    isEnabled: _isFormValid, // validator로...
                    text: '프로그램 저장',
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _addSessionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      decoration: BoxDecoration(color: Colors.black),
      child: _programTimeInSeconds == 0
          ? const SizedBox.shrink(
              child: Center(
                child: Text('프로그램 소요시간을 입력해주세요.'),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(10),
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
                    Row(
                      children: [
                        Text(
                            '잔여 시간 ${_notAssignedProgramTimeInSeconds ~/ 3600}'),
                        Text(
                            ':${(_notAssignedProgramTimeInSeconds % 3600) ~/ 60 < 10 ? '0' : ''}${(_notAssignedProgramTimeInSeconds % 3600) ~/ 60}')
                      ],
                    ),
                  ],
                ),
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
                            onExit: (event) => setState(() =>
                                _isMouseOveringOnAddSessionButton = false),
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
    Function(String)? onChanged,
    FocusNode? focusNode,
  }) {
    return AppTextField(
      focusNode: focusNode,
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
          controller.text = maxValue.toString();
        }
        onChanged?.call(val);
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
          Text('프로그램 총 소요 시간 : '),
          _timeTextField(
            controller: _programHourController,
            maxValue: 24,
            hintText: '0',
            onChanged: (val) {
              final newProgramTimeInSeconds =
                  val.isEmpty || val == '' ? 0 : int.parse(val) * 60 * 60;
              final currentAssignedTimeInSeconds = _sessions.fold(
                  0, (value, session) => value + session.sessionTimeInSeconds);

              _programTimeInSeconds =
                  val.isEmpty || val == '' ? 0 : int.parse(val) * 60 * 60;
              _notAssignedProgramTimeInSeconds =
                  _programTimeInSeconds - currentAssignedTimeInSeconds;
              if (_notAssignedProgramTimeInSeconds < 0) {
                _updateErrorText(
                    '프로그램 소요 시간은 세션 시간의 총 합보다 작을 수 없습니다.'); // setstate 호출
              } else {
                _updateErrorText(null);
                _validateProgram();
              }
            },
          ),
          Text('시간'),
        ],
      ),
    );
  }

  Future<void> _updateWindowSize({Size? size}) async {
    // 기본 305 + 에러텍스트 30 + 세션 60 * 세션 수
    final height = 305 +
        (_errorText != null ? 30 : 0) +
        (_sessions.length < 6 ? _sessions.length * 60 : 300);

    if (!mounted) return;
    await WindowSize.updateWindowSize(
        size: Size(WindowSize.currentSize.width, height.toDouble()),
        onExpanded: () => setState(() {}));
  }

  Future<void> _updateErrorText(String? text) async {
    _errorText = text;
    await _updateWindowSize();
  }

  void _openWriteProgramDescriptionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final textFieldHeight = WindowSize.currentSize.height.toInt() - 128;
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
        _notAssignedProgramTimeInSeconds) {
      _updateErrorText('프로그램 잔여시간을 초과할 수 없습니다.');
      return;
    }

    setState(() {
      _sessions.add(
        Session(
            sessionTitle: _sessionNameController.text,
            sessionUid: const Uuid().v4(),
            programUid: _programUid,
            progressedSessionTimeInSeconds: 0,
            sessionTimeInSeconds: sessiontHour * 60 * 60 + sessiontMinute * 60,
            sessionPriority: _sessions.length,
            sessionMemo: ''),
      );
    });
    _notAssignedProgramTimeInSeconds -=
        sessiontHour * 60 * 60 + sessiontMinute * 60;
    _sessionNameController.clear();
    _sessionHourController.clear();
    _sessionMinuteController.clear();
    _updateErrorText(null);
    _validateProgram();
  }

  void _removeSession(Session session) async {
    _sessions.remove(session);
    _notAssignedProgramTimeInSeconds = _programTimeInSeconds -
        _sessions.fold(0, (acc, session) => acc + session.sessionTimeInSeconds);

    // 세션 순서 재정렬
    for (int i = 0; i < _sessions.length; i++) {
      _sessions[i] = _sessions[i].copyWith(sessionPriority: i);
    }

    await _updateWindowSize();
    _validateProgram();
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
      talker.error(_programUid); // ##
      // save
      await ref.read(appServiceProvider).saveProgram(Program(
          programTitle: _programNameController.text,
          programUid: _programUid,
          programDescription: _programDescription,
          programTimeInSeconds: _programTimeInSeconds,
          progressedProgramTimeInSeconds: 0,
          programSessions: _sessions));

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => const ProgramCollectionScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ));
    }
  }

  void _validateProgram() {
    setState(() {
      talker.debug('validateProgram'); // ##
      _isFormValid = _programNameController.text.isNotEmpty &&
          _programNameController.text != '' &&
          _sessions.isNotEmpty &&
          _programTimeInSeconds > 0 &&
          _notAssignedProgramTimeInSeconds >= 0;
    });
  }
}

class _SessionTile extends StatefulWidget {
  const _SessionTile(
      {super.key, required this.session, required this.trailing});

  final Session session;
  final Widget trailing;

  @override
  State<_SessionTile> createState() => _SessionTileState();
}

class _SessionTileState extends State<_SessionTile> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    Duration sessionRemainingDuration =
        Duration(seconds: widget.session.sessionRemainingTime);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        decoration: BoxDecoration(
            color: AppColor.sessionColor(widget.session.sessionPriority)),
        child: ListTile(
          leading: Text(
            '${widget.session.sessionPriority + 1}',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          title: Text(widget.session.sessionTitle,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          subtitle: Text(
            '${sessionRemainingDuration.inHours}:${sessionRemainingDuration.inMinutes % 60 == 0 ? '00' : sessionRemainingDuration.inMinutes % 60}',
            style: TextStyle(fontSize: 12, color: Colors.grey[300]),
          ),
          trailing: widget.trailing,
        ),
      ),
    );
  }
}
