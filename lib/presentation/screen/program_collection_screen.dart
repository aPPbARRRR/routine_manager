import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
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
                    GoCreateProgramScreenButton(),
                    ...programs.map((program) {
                      return ListTile(title: Text(program.programTitle));
                    })
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class GoCreateProgramScreenButton extends StatefulWidget {
  const GoCreateProgramScreenButton({
    super.key,
  });

  @override
  State<GoCreateProgramScreenButton> createState() =>
      _GoCreateProgramScreenButtonState();
}

class _GoCreateProgramScreenButtonState
    extends State<GoCreateProgramScreenButton> {
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
