import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'responsive.dart';
import 'app_colors.dart';

class AppIcons {
  static const IconData email = LucideIcons.mail;
  static const IconData password = LucideIcons.lock;
  static const IconData user = LucideIcons.user;
  static const IconData phone = LucideIcons.phone;
  static const IconData calendar = LucideIcons.calendar;
  static const IconData eye = LucideIcons.eye;
  static const IconData eyeSlash = LucideIcons.eyeOff;
  static const IconData arrowLeftLong = LucideIcons.moveLeft;
  static const IconData home = LucideIcons.home;
  static const IconData favorite = LucideIcons.heart;
  static const IconData cart = LucideIcons.shoppingCart;
  static const IconData location = LucideIcons.mapPin;
  static const IconData profile = LucideIcons.user;
  static const IconData notifications = LucideIcons.bell;

  static Widget icon(BuildContext context, IconData icon,
      {Color color = AppColors.tertiary, double? size}) {
    return Icon(
      icon,
      size: size ?? responsiveTextSize(context, 22),
      color: color,
    );
  }
}
