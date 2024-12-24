import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:routine_manager/presentation/constant/app_color.dart';
import 'package:routine_manager/presentation/widget/app_icon_button.dart';
import 'package:routine_manager/presentation/widget/app_popup_menu_button.dart';

import '../../model/program.dart';
import '../constant/app_method.dart';
import '../constant/window_size.dart';
import '../layout/default_layout.dart';
import '../provider/fetched_programs.dart';
import '../provider/progressing_program_collection.dart';
import '../provider/selected_program.dart';
import '../widget/progress_brief_badge.dart';
import 'brief_board_screen.dart';
import 'create_program_screen.dart';
import '../widget/program_history_collecion_widget.dart';

class ProgramCollectionScreen extends ConsumerStatefulWidget {
  const ProgramCollectionScreen({super.key});

  @override
  ConsumerState<ProgramCollectionScreen> createState() =>
      _ProgramCollectionScreenState();
}

class _ProgramCollectionScreenState
    extends ConsumerState<ProgramCollectionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSideScreenOpen = false;

  @override
  Widget build(BuildContext context) {
    final fetchedPrograms = ref.watch(fetchedProgramsProvider);

    return SizedBox(
      width: WindowSize.currentSize.width,
      height: WindowSize.currentSize.height,
      child: DefaultLayout(
        scaffoldKey: _scaffoldKey,
        titleBarActions: const [
          ProgressBriefBadge(),
        ],
        endDrawer: Drawer(
          child: ProgramHistoryCollectionWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: fetchedPrograms.maybeMap(
              orElse: () => SizedBox(
                    child: Text('error'),
                  ),
              data: (data) {
                List<Program> programs = data.value;

                return ListView(
                  children: [
                    _GoCreateProgramScreenButton(),
                    if (programs.isEmpty)
                      SizedBox(
                        height: 90,
                        child: const Center(
                          child: Text('저장된 프로그램이 없습니다.'),
                        ),
                      ),
                    ...programs.map((program) {
                      return ProgramTile(
                        onHistoryButtonTap: (program) =>
                            _onOpenHistoryButtonTap(program),
                        program: program,
                        onTap: () {
                          ref
                              .read(
                                  progressingProgramCollectionProvider.notifier)
                              .runProgram(program, context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const BriefBoardScreen(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                              (route) => false);
                        },
                        onDeleteButtonTap: (program) => ref
                            .read(fetchedProgramsProvider.notifier)
                            .removeProgram(program, context),
                      );
                    })
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _onOpenHistoryButtonTap(Program program) {
    ref.read(selectedProgramProvider.notifier).setSelectedProgram(program);
    _scaffoldKey.currentState?.openEndDrawer();
  }
}

class ProgramTile extends StatefulWidget {
  const ProgramTile({
    super.key,
    required this.program,
    required this.onTap,
    required this.onHistoryButtonTap,
    this.onEditButtonTap,
    this.onDeleteButtonTap,
  });

  final Program program;
  final VoidCallback onTap;
  final Function(Program) onHistoryButtonTap;
  final Function(Program)? onEditButtonTap;
  final Function(Program)? onDeleteButtonTap;

  @override
  State<ProgramTile> createState() => _ProgramTileState();
}

class _ProgramTileState extends State<ProgramTile> {
  bool _isMouseOveringOnTile = false;
  final GlobalKey _menuButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Duration programDuration =
        Duration(seconds: widget.program.programTimeInSeconds);

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isMouseOveringOnTile = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isMouseOveringOnTile = false;
        });
      },
      child: GestureDetector(
        onTap: () => widget.onHistoryButtonTap(widget.program),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: _isMouseOveringOnTile
                ? const Color.fromARGB(255, 31, 59, 102)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: widget.program.programTitle.length * 18 <
                                  WindowSize.defaultSize.width - 190
                              ? null
                              : WindowSize.defaultSize.width - 190,
                          child: Text(
                            widget.program.programTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AppPopupMenuButton(
                          icon: Symbols.more_vert,
                          items: [
                            if (widget.onEditButtonTap != null)
                              AppPopupMenuItem(
                                icon: Symbols.edit,
                                label: '수정하기',
                                onTap: () async {
                                  await widget.onEditButtonTap!(widget.program);
                                  Navigator.pop(context);
                                },
                              ),
                            if (widget.onDeleteButtonTap != null)
                              AppPopupMenuItem(
                                icon: Symbols.delete,
                                label: '삭제하기',
                                isDestructive: true,
                                onTap: () async {
                                  await widget
                                      .onDeleteButtonTap!(widget.program);
                                  Navigator.pop(context);
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppMethod.timeTextWithUnitTwoUnit(
                          timeInSeconds: programDuration.inSeconds),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _RunProgramButton(
                    onPressed: () => widget.onTap(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RunProgramButton extends StatefulWidget {
  const _RunProgramButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<_RunProgramButton> createState() => _RunProgramButtonState();
}

class _RunProgramButtonState extends State<_RunProgramButton> {
  bool _isMouseOveringOnTile = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isMouseOveringOnTile = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isMouseOveringOnTile = false;
          });
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color:
                _isMouseOveringOnTile ? AppColor.gray0.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: _isMouseOveringOnTile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isMouseOveringOnTile)
                      const Text(
                        '시작하기',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                )
              : const Icon(Symbols.play_arrow, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}

class _GoCreateProgramScreenButton extends StatefulWidget {
  const _GoCreateProgramScreenButton({
    super.key,
  });

  @override
  State<_GoCreateProgramScreenButton> createState() =>
      __GoCreateProgramScreenButtonState();
}

class __GoCreateProgramScreenButtonState
    extends State<_GoCreateProgramScreenButton> {
  bool _isMouseOveringOnButton = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await WindowSize.updateWindowSize(
            size: WindowSize.defaultSize,
            onExpanded: () => Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const CreateProgramScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
                (route) => false));
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isMouseOveringOnButton = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isMouseOveringOnButton = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _isMouseOveringOnButton
                ? AppColor.gray0.withOpacity(0.1)
                : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Symbols.add,
                color: Colors.white,
              ),
              Text('프로그램 추가')
            ],
          ),
        ),
      ),
    );
  }
}
