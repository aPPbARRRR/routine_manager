import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:routine_manager/presentation/widget/app_icon_button.dart';

import '../constant/app_color.dart';
import '../screen/program_collection_screen.dart';

class GoProgramCollectionScreenIconButton extends StatefulWidget {
  const GoProgramCollectionScreenIconButton({
    super.key,
  });

  @override
  State<GoProgramCollectionScreenIconButton> createState() =>
      _GoProgramCollectionScreenIconButtonState();
}

class _GoProgramCollectionScreenIconButtonState
    extends State<GoProgramCollectionScreenIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const ProgramCollectionScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
            (route) => false);
      },
      icon: Symbols.list,
      tooltip: '목록',
    );

    // return MouseRegion(
    //   onEnter: (_) => setState(() => _isHovering = true),
    //   onExit: (_) => setState(() => _isHovering = false),
    //   child: IconButton(
    //     onPressed: () {
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation1, animation2) =>
    //                 const ProgramCollectionScreen(),
    //             transitionDuration: Duration.zero,
    //             reverseTransitionDuration: Duration.zero,
    //           ),
    //           (route) => false);
    //     },
    //     tooltip: '목록',
    //     icon: Container(
    //       decoration: BoxDecoration(
    //         color: _isHovering ? AppColor.white.withOpacity(0.7) : null,
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: Center(
    //         child: Icon(
    //           Symbols.list,
    //           size: 18,
    //           color: _isHovering ? AppColor.primaryMain : AppColor.gray0,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
