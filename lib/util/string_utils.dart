import 'package:flutter/material.dart';

class StringUtils {

  static const weekDayMap = {
    1: "Mon",
    2: "Tue",
    3: "Wen",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };

  static Map difficultyMap = {
    1.0: "Easy",
    2.0: "Pretty easy",
    3.0: "Intermediate",
    4.0: "Pretty hard",
    5.0: "Hard",
    6.0: "Extreme"
  };

  static Map difficultyColorMap = {
    1.0: Color(0xFFA2F7DF),
    2.0: Color(0xFFAAEEB3),
    3.0: Color(0xFFF3E4AE),
    4.0: Color(0xFFF9A9A5),
    5.0: Color(0xFFFB8A84),
    6.0: Color(0xFFFD6961)
  };
  static Map difficultyColorMapTranslucent = {
    1.0: Color(0x8041DDB5),
    2.0: Color(0x80AAEEB3),
    3.0: Color(0x80FFD166),
    4.0: Color(0x80FF5F58),
    5.0: Color(0x80FB362D),
    6.0: Color(0x80FF0B00)
  };

  static Map difficultyHeightMap = {
    1.0: 40.0,
    2.0: 60.0,
    3.0: 80.0,
    4.0: 100.0,
    5.0: 120.0,
    6.0: 140.0
  };

}
