import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/helpers/location_helper.dart';
import 'package:foodtek/core/helpers/shared_preferences_helper.dart';
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
    final stored =
        await prefs.getPrefString(key: 'userAddress', defaultValue: '');
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
    await SharedPreferencesHelper()
        .setPrefString(key: 'userAddress', value: placeName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(responsiveWidth(context, 8)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppSvgIcons(iconPath: AppIconStrings.mapPinUnderlined),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: _fetchLocationAndUpdate,
                      child: Row(
                        children: [
                          Text(context.l10n.current_location,
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(width: 4),
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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: IconButton(
                  icon: AppSvgIcons(iconPath: AppIconStrings.notificationsBell),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) => const NotificationModal(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
