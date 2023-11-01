import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppStyle {
  static Color background_S = Color.fromARGB(255, 0, 0, 0);
  static Color container_b = const Color(0xff30302c);
  static Color lime_t = const Color(0xffBEDE61);
  static Color grey_t = const Color(0xffb4AAAA);
  static Color white_t = const Color(0xFFFFFFFF);
}

final String home_svg = 'lib/assets/icons/home.svg';
final String notification_svg = 'lib/assets/icons/notification.svg';
final String profile_svg = 'lib/assets/icons/profile.svg';
final String search_svg = 'lib/assets/icons/search.svg';

final Widget homeSvgA = SvgPicture.asset(
  home_svg,
  height: 25,
  width: 25,
  semanticsLabel: "Home",
  colorFilter: ColorFilter.mode(AppStyle.lime_t, BlendMode.srcIn),
);

final Widget notificationSvgA = SvgPicture.asset(
  notification_svg,
  height: 25,
  width: 25,
  semanticsLabel: "Notification",
  colorFilter: ColorFilter.mode(AppStyle.lime_t, BlendMode.srcIn),
);
final Widget profileSvgA = SvgPicture.asset(
  profile_svg,
  height: 25,
  width: 25,
  semanticsLabel: "Notification",
  colorFilter: ColorFilter.mode(AppStyle.lime_t, BlendMode.srcIn),
);
final Widget searchSvgA = SvgPicture.asset(
  search_svg,
  height: 25,
  width: 25,
  semanticsLabel: "Notification",
  colorFilter: ColorFilter.mode(AppStyle.lime_t, BlendMode.srcIn),
);

final Widget homeSvg = SvgPicture.asset(
  home_svg,
  semanticsLabel: "Home",
  colorFilter: ColorFilter.mode(AppStyle.grey_t, BlendMode.srcIn),
);

final Widget notificationSvg = SvgPicture.asset(
  notification_svg,
  semanticsLabel: "Notification",
  colorFilter: ColorFilter.mode(AppStyle.grey_t, BlendMode.srcIn),
);
final Widget profileSvg = SvgPicture.asset(
  profile_svg,
  semanticsLabel: "Notification",
  colorFilter: ColorFilter.mode(AppStyle.grey_t, BlendMode.srcIn),
);
final Widget searchSvg = SvgPicture.asset(
  search_svg,
  semanticsLabel: "Notification",
  colorFilter: ColorFilter.mode(AppStyle.grey_t, BlendMode.srcIn),
);
