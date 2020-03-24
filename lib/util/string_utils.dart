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
    0.0: "Easy",
    0.2: "Pretty easy",
    0.4: "Intermediate",
    0.6: "Pretty hard",
    0.8: "Hard",
    1.0: "Extreme"
  };

  static Map difficultyColorMap = {
    0.0: Color(0xFF41DDB5),
    0.2: Color(0xFFAAEEB3),
    0.4: Color(0xFFFFD166),
    0.6: Color(0xFFFF5F58),
    0.8: Color(0xFFFB362D),
    1.0: Color(0xFFFF0B00)
  };

}
