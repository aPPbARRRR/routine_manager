import 'package:flutter/material.dart';

class AppColor {
  static Color sessionColor(int sessionPriority) {
    // 빨주노초파남보 순서로 색 반환. 7개 색 다 쓰면 채도 낮춰서 다시 빨주노초파남보. 총 21개 색상
    switch (sessionPriority % 21) {
      // First set - Darker shades
      case 0:
        return const Color(0xFFCC0000); // Darker Red
      case 1:
        return const Color(0xFFCC6600); // Darker Orange
      case 2:
        return const Color(0xFFCCCC00); // Darker Yellow
      case 3:
        return const Color(0xFF00CC00); // Darker Green
      case 4:
        return const Color(0xFF0000CC); // Darker Blue
      case 5:
        return const Color(0xFF3B0066); // Darker Indigo
      case 6:
        return const Color(0xFF6600CC); // Darker Violet

      // Second set - 70% saturation and darker
      case 7:
        return const Color(0xFFCC3D3D);
      case 8:
        return const Color(0xFFCC8B3D);
      case 9:
        return const Color(0xFFCCCC3D);
      case 10:
        return const Color(0xFF3DCC3D);
      case 11:
        return const Color(0xFF3D3DCC);
      case 12:
        return const Color(0xFF633D79);
      case 13:
        return const Color(0xFF8B3DCC);

      // Third set - 40% saturation and darker
      case 14:
        return const Color(0xFFCC7979);
      case 15:
        return const Color(0xFFCCAB79);
      case 16:
        return const Color(0xFFCCCC79);
      case 17:
        return const Color(0xFF79CC79);
      case 18:
        return const Color(0xFF7979CC);
      case 19:
        return const Color(0xFF8F798F);
      case 20:
        return const Color(0xFFA379CC);

      default:
        return const Color(0xFF000000);
    }
  }

  // Primary
  static const Color primaryMain = Color.fromARGB(255, 36, 72, 126);
  static const Color primaryMainDark = Color.fromARGB(255, 31, 59, 102);
  static const Color primaryMainLight = Color.fromARGB(255, 204, 204, 204);

  // secondary
  static const Color secondaryGreen = Color(0xFF00ea00);
  static const Color secondaryRed = Color(0xFFff2d2d);

  // gray
  static const Color gray100 = Color(0xFF000000);
  static const Color gray90 = Color(0xFF0d0d0d);
  static const Color gray80 = Color(0xFF1a1a1a);
  static const Color gray70 = Color(0xFF484848);
  static const Color gray60 = Color(0xFF666666);
  static const Color gray50 = Color(0xFF999999);
  static const Color gray40 = Color(0xFFcccccc);
  static const Color gray30 = Color(0xFFefefef);
  static const Color gray0 = Color(0xFFffffff);
  static const Color white = Color(0xFFffffff);
}
