import 'package:flutter/material.dart';

enum TimeDragPickerType {
  hours,
  minutes,
}

class TimeDragPicker extends StatefulWidget {
  const TimeDragPicker(
      {super.key, required this.onTimeChanged, required this.type});

  final Function(int) onTimeChanged;
  final TimeDragPickerType type;

  @override
  State<TimeDragPicker> createState() => _TimeDragPickerState();
}

class _TimeDragPickerState extends State<TimeDragPicker> {
  final pageController = PageController(initialPage: 0);
  bool _isHovering = false;
  int _curVal = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _isHovering = true;
      }),
      onExit: (event) => setState(() {
        _isHovering = false;
      }),
      child: SizedBox(
        height: 300,
        width: 100,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  if (_curVal <
                      (widget.type == TimeDragPickerType.hours ? 24 : 50)) {
                    _curVal++;
                    pageController.animateToPage(
                      _curVal,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                }),
                onSecondaryTap: () => setState(() {
                  if (_curVal > 0) {
                    _curVal--;
                    pageController.animateToPage(
                      _curVal,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                }),
                child: PageView(
                  controller: pageController, // PageController 추가
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) => setState(() => _curVal = value),
                  children: widget.type == TimeDragPickerType.hours
                      ? List.generate(
                          24,
                          (index) => Text('${index}',
                              style: _isHovering
                                  ? const TextStyle(fontSize: 20)
                                  : const TextStyle(
                                      fontSize: 20, color: Colors.grey)))
                      : List.generate(
                          6,
                          (index) => Text('${index * 10}',
                              style: _isHovering
                                  ? const TextStyle(fontSize: 20)
                                  : const TextStyle(
                                      fontSize: 20, color: Colors.grey))),
                ),
              ),
            ),
            // Expanded(
            //   child: GestureDetector(
            //     onTap: () => setState(() => _curVal++),
            //     child: PageView(
            //       physics: const AlwaysScrollableScrollPhysics(),
            //       scrollDirection: Axis.vertical,
            //       onPageChanged: (value) => setState(() => _curVal = value),
            //       children: widget.type == TimeDragPickerType.hours
            //           ? List.generate(
            //               24,
            //               (index) => Text('${index}',
            //                   style: _isHovering
            //                       ? const TextStyle(fontSize: 20)
            //                       : const TextStyle(
            //                           fontSize: 20, color: Colors.grey)))
            //           : List.generate(
            //               6,
            //               (index) => Text('${index * 10}',
            //                   style: _isHovering
            //                       ? const TextStyle(fontSize: 20)
            //                       : const TextStyle(
            //                           fontSize: 20, color: Colors.grey))),
            //     ),
            //   ),
            // ),
            Text(
              widget.type == TimeDragPickerType.hours ? '시' : '분',
              style: _isHovering
                  ? const TextStyle(fontSize: 20)
                  : const TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
