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
    final stored = await SharedPreferencesHelper()
        .getPrefString(key: 'userAddress', defaultValue: '');
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
                width: responsiveWidth(context, 34),
                height: responsiveHeight(context, 34),
                padding: EdgeInsets.all(responsiveWidth(context, 8)),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppSvgIcons(
                  iconPath: AppIconStrings.mapPinUnderlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: _fetchLocationAndUpdate,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.l10n.current_location,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(width: responsiveWidth(context, 4)),
                          AppSvgIcons(
                            iconPath: AppIconStrings.dropDownCursor,
                            width: responsiveWidth(context, 6),
                            height: responsiveHeight(context, 6),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(context, 3),
                    ),
                    Text(
                      placeName.isNotEmpty
                          ? placeName
                          : context.l10n.location_unknown,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                width: responsiveWidth(context, 34),
                height: responsiveHeight(context, 34),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
