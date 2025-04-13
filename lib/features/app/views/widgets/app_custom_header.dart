import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/helpers/location_helper.dart';
import 'package:foodtek/core/helpers/shared_preferences_helper.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import '../../models/notification_model.dart';
import '../../../../core/widgets/app_svg_icons.dart';

class AppCustomHeader extends StatefulWidget {
  const AppCustomHeader({super.key});

  @override
  State<AppCustomHeader> createState() => _AppCustomHeaderState();
}

class _AppCustomHeaderState extends State<AppCustomHeader> {
  String placeName = "";

  @override
  void initState() {
    super.initState();
    _loadStoredAddress();
  }

  Future<void> _loadStoredAddress() async {
    final prefs = SharedPreferencesHelper();
    final stored = await prefs.getPrefString(
      key: 'userAddress',
      defaultValue: '',
    );
    setState(() {
      placeName = stored;
    });
  }

  Future<void> _fetchLocationAndUpdate() async {
    final address = await LocationHelper.getCurrentAddress(context);
    if (!context.mounted) return;

    setState(() {
      placeName = address ?? context.l10n.location_unknown;
    });

    final prefs = SharedPreferencesHelper();
    await prefs.setPrefString(
      key: 'userAddress',
      value: placeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: responsiveWidth(context, 10),
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: responsiveHeight(context, 8),
                  horizontal: responsiveWidth(context, 8),
                ),
                decoration: BoxDecoration(
                  color: AppColors.octonary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppSvgIcons(
                  iconPath: AppIconStrings.mapPinUnderlined,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: _fetchLocationAndUpdate,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: responsiveWidth(context, 4),
                        children: [
                          Text(
                            context.l10n.current_location,
                            style: AppTextStyles.appSubTitle,
                          ),
                          AppSvgIcons(
                            iconPath: AppIconStrings.dropDownCursor,
                            width: responsiveWidth(context, 6),
                            height: responsiveHeight(context, 6),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      placeName.isNotEmpty
                          ? placeName
                          : context.l10n.location_unknown,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.appSubTitle,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.octonary,
                ),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => const NotificationModal(),
                    );
                  },
                  icon: AppSvgIcons(iconPath: AppIconStrings.notificationsBell),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
