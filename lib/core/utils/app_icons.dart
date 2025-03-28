import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'responsive.dart';
import 'app_colors.dart';

class AppIcons {
  static const IconData email = FontAwesomeIcons.envelope;
  static const IconData password = FontAwesomeIcons.lock;
  static const IconData user = FontAwesomeIcons.user;
  static const IconData phone = FontAwesomeIcons.phone;
  static const IconData calendar = FontAwesomeIcons.calendar;
  static const IconData eye = FontAwesomeIcons.eye;
  static const IconData eyeSlash = FontAwesomeIcons.eyeSlash;
  static const IconData arrowLeftLong = FontAwesomeIcons.arrowLeftLong;

  static Widget icon(BuildContext context, IconData icon,
      {Color color = AppColors.secondary, double? size}) {
    return Icon(
      icon,
      size: size ?? responsiveTextSize(context, 18),
      color: color,
    );
  }
}
