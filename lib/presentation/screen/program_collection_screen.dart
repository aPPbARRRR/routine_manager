import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:routine_manager/presentation/constant/app_color.dart';

import '../../model/program.dart';
import '../layout/default_layout.dart';
import '../provider/fetched_programs.dart';
import 'create_program_screen.dart';

class ProgramCollectionScreen extends ConsumerWidget {
  const ProgramCollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programsState = ref.watch(fetchedProgramsProvider);

    return DefaultLayout(
      titleBarActions: const [],
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: programsState.maybeMap(
              orElse: () => SizedBox(
                    child: Text('error'),
                  ),
              data: (data) {
                List<Program> programs = data.value;

                return ListView(
                  children: [
                    _GoCreateProgramScreenButton(),
                    ...programs.map((program) {
                      return ProgramTile(program: program);
                    })
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class ProgramTile extends StatefulWidget {
  const ProgramTile({
    super.key,
    required this.program,
  });

  final Program program;

  @override
  State<ProgramTile> createState() => _ProgramTileState();
}

class _ProgramTileState extends State<ProgramTile> {
  bool _isMouseOveringOnTile = false;

  @override
  Widget build(BuildContext context) {
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
      child: Container(
        height: 80,
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
                      Text(
                        widget.program.programTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Symbols.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // 프로그램 진행시간 전체를 00:00 형식으로 시간, 분으로 표시하도록 수정
                    '24:00',
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
                _openHistorySideScreenButton(onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _openHistorySideScreenButton extends StatefulWidget {
  const _openHistorySideScreenButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<_openHistorySideScreenButton> createState() =>
      _openHistorySideScreenButtonState();
}

class _openHistorySideScreenButtonState
    extends State<_openHistorySideScreenButton> {
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
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            color:
                _isMouseOveringOnTile ? AppColor.gray0.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_isMouseOveringOnTile)
                const Text(
                  '진행 기록 ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              Icon(Symbols.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
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
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CreateProgramScreen();
        }));
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
