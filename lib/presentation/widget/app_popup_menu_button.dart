import 'package:flutter/material.dart';
import 'package:routine_manager/presentation/widget/app_icon_button.dart';

class AppPopupMenuButton extends StatefulWidget {
  const AppPopupMenuButton({
    super.key,
    required this.items,
    required this.icon,
  });

  final List<AppPopupMenuItem> items;
  final IconData icon;

  @override
  State<AppPopupMenuButton> createState() => _AppPopupMenuButtonState();
}

class _AppPopupMenuButtonState extends State<AppPopupMenuButton> {
  final GlobalKey buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      key: buttonKey,
      onPressed: () => _showCustomPopupMenu(context, buttonKey),
      icon: widget.icon,
      tooltip: '더보기',
    );
  }

  void _showCustomPopupMenu(BuildContext context, GlobalKey buttonKey) {
    print('buttonKey: ${buttonKey.currentContext}');
    final RenderBox button =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    Navigator.push(
      context,
      PopupMenuRoute(
        position: position,
        items: widget.items,
      ),
    );
  }
}

class PopupMenuRoute extends PopupRoute {
  final RelativeRect position;
  final List<AppPopupMenuItem> items;

  PopupMenuRoute({
    required this.position,
    required this.items,
  });

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Positioned(
          top: position.top,
          left: position.left,
          child: FadeTransition(
            opacity: animation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 31, 59, 102),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: items,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppPopupMenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const AppPopupMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  }) : super(key: key);

  @override
  State<AppPopupMenuItem> createState() => _AppPopupMenuItemState();
}

class _AppPopupMenuItemState extends State<AppPopupMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color:
                _isHovered ? Colors.white.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: widget.isDestructive ? Colors.red : Colors.white,
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.isDestructive ? Colors.red : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
