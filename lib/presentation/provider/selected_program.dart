import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/program.dart';
part 'selected_program.g.dart';

@Riverpod(keepAlive: true)
class SelectedProgram extends _$SelectedProgram {
  @override
  Program? build() {
    return null;
  }

  void setSelectedProgram(Program program) => state = program;
}
