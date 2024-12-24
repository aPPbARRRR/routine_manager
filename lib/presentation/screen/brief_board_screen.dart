import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_manager/main.dart';
import '../constant/window_size.dart';
import '../layout/default_layout.dart';
import '../provider/progressing_program_collection.dart';
import '../widget/go_program_collection_screen_icon_button.dart';
import '../widget/progress_brief_tile.dart';

final GlobalKey<ScaffoldState> _briefBoardScreenKey =
    GlobalKey<ScaffoldState>();

class BriefBoardScreen extends ConsumerStatefulWidget {
  const BriefBoardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BriefBoardScreenState();
}

class _BriefBoardScreenState extends ConsumerState<BriefBoardScreen> {
  @override
  void initState() {
    super.initState();
    WindowSize.updateWindowSize(
      size: Size(
        WindowSize.currentSize.width,
        ref.read(progressingProgramCollectionProvider).length * 110 + 34,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final runningPrograms = ref.watch(progressingProgramCollectionProvider);
    final controller = ref.read(progressingProgramCollectionProvider.notifier);
    runningPrograms.sort((a, b) => a.programUid.compareTo(b.programUid));

    return DefaultLayout(
      scaffoldKey: _briefBoardScreenKey,
      titleBarActions: const [GoProgramCollectionScreenIconButton()],
      body: runningPrograms.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('진행중인 프로그램이 없습니다.'),
              ),
            )
          : SizedBox(
              height: WindowSize.currentSize.height - WindowSize.titleBarHeight,
              child: ListView(
                children: [
                  ...runningPrograms.map((program) {
                    return ProgressBriefTile(
                      program: program,
                      selectedSessionUid: controller
                          .getSelectedSession(program.programUid)
                          ?.sessionUid,
                      onSessionTap: (session) =>
                          controller.setSelectedSession(program, session),
                      // onTileTap: () =>
                      //     _briefBoardScreenKey.currentState?.openDrawer(),
                      onSessionMemoSaved: (session, memo) =>
                          controller.updateSessionMemo(session, memo),
                      onProgramStop: (program) =>
                          controller.stopProgram(program),
                      onProgramDescriptionTap: (program, context) => controller
                          .showProgramDescriptionDialog(program, context),
                    );
                  })
                ],
              ),
            ),
    );
  }
}
