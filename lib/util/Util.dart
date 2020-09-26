import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MyColors {
  static const Color PRIMARY = Color.fromRGBO(11, 92, 127, 1);
  static const Color SECONDARY = Color.fromRGBO(229, 84, 31, 1);
  static const Color TITLE = Color.fromRGBO(0, 0, 0, 1);
  static const Color TEXT = Color.fromRGBO(70, 70, 70, 1);
  static const Color DARK = Color.fromRGBO(0, 0, 0, 1);
  static const Color DANGER = Color.fromRGBO(255, 0, 0, 1);
  static const Color WARNING = Color.fromRGBO(200, 216, 29, 1);
  static const Color SUCCESS = Color.fromRGBO(45, 203, 119, 1);
  static const Color NORMAL = Color.fromRGBO(0, 80, 239, 1);
  static const Color RUNNING = Color.fromRGBO(0, 80, 239, 1);
  static const Color WRITE = Color.fromRGBO(250, 250, 250, 1);
}

abstract class MyFontSize {
  static const double TITLE = 13;
  static const double FULL_TITLE = 25;
  static const double SUBTITLE = 11;
}

abstract class MyIcons {
  
  static const double _sizeIcon = 25;

  static const _SUCCESS = Icon(
    Icons.check_circle,
    color: MyColors.SUCCESS,
    size: _sizeIcon,
  );

  static const _DANGER = Icon(
    Icons.cancel,
    color: MyColors.DANGER,
    size: _sizeIcon,
  );

  static const _WARNING = Icon(
    Icons.warning,
    color: MyColors.WARNING,
    size: _sizeIcon,
  );

  static const _NORMAL = Icon(
    Icons.check_circle,
    color: MyColors.NORMAL,
    size: _sizeIcon,
  );

  static const _RUNNING = Icon(
    Icons.content_paste,
    color: MyColors.NORMAL,
    size: _sizeIcon,
  );

  static Map<String, Icon> getIcon = {
    'CONCLUÍDO': _SUCCESS,
    'REAGENDADO': _WARNING,
    'CANCELADO': _DANGER,
    'NORMALIZOU': _NORMAL,
    'EM ANDAMENTO': _RUNNING
  }; 

}
