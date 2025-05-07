import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

import '../../../../core/models/food_model.dart';
import '../../../../core/models/notification_model.dart';
import '../../../cart/controllers/cart_cubit.dart';
import '../../../../core/widgets/cart_summary_box.dart';
import '../../controllers/card_type_cubit.dart';
import '../../controllers/payment_method_cubit.dart';
import '../../../track/views/screen/track_screen.dart';
import '../../../location/views/screen/location_picker_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final promoCodeController = TextEditingController();
  LatLng? _selectedLocation;
  String? _selectedPlaceName;

  Future<void> _pickLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LocationPickerScreen()),
    );
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _selectedLocation = result['location'];
        _selectedPlaceName = result['placeName'];
      });
    }
  }

  @override
  void dispose() {
    promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 30),
            vertical: responsiveHeight(context, 30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: responsiveWidth(context, 34),
                    height: responsiveHeight(context, 34),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                      icon: AppSvgIcons(
                        iconPath: AppIconStrings.notificationsBell,
                      ),
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
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppSvgIcons(
                      iconPath: AppIconStrings.leftLongArrow,
                      width: responsiveWidth(context, 12),
                      height: responsiveHeight(context, 12),
                    ),
                  ),
                  SizedBox(width: responsiveWidth(context, 20)),
                  Text(
                    context.l10n.checkout,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 30)),
              Text(
                context.l10n.delivery_path,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        AppSvgIcons(
                          iconPath: AppIconStrings.restaurentLocation,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Container(
                          width: 1,
                          height: responsiveHeight(context, 25),
                          color: Colors.grey,
                        ),
                        AppSvgIcons(
                          iconPath: AppIconStrings.userLocation,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                    SizedBox(width: responsiveWidth(context, 20)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Al-Shura St., Amman',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            'Amman, Jordan',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(height: responsiveHeight(context, 20)),
                          Text(
                            _selectedPlaceName ?? 'Ahmad alAwazem st',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amman, Jordan',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              InkWell(
                                onTap: _pickLocation,
                                child: Text(
                                  context.l10n.change,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsiveHeight(context, 30)),
              Text(
                context.l10n.promo_code,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              AppCustomTextField(
                controller: promoCodeController,
                hintText: context.l10n.enter_your_promo_code,
                hintStyle: Theme.of(context).textTheme.labelSmall,
                suffixIcon: AppCustomButton(
                  text: context.l10n.add,
                  onPressed: () {},
                  width: responsiveWidth(context, 90),
                  height: responsiveHeight(context, 40),
                ),
              ),
              SizedBox(height: responsiveHeight(context, 30)),
              Text(
                context.l10n.payment_method,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              BlocBuilder<PaymentMethodCubit, PaymentMethod>(
                builder: (context, selectedMethod) {
                  return Row(
                    children: [
                      Radio<PaymentMethod>(
                        value: PaymentMethod.card,
                        groupValue: selectedMethod,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (val) {
                          if (val != null) {
                            context.read<PaymentMethodCubit>().select(val);
                          }
                        },
                      ),
                      Text(context.l10n.card),
                      SizedBox(width: responsiveWidth(context, 20)),
                      Radio<PaymentMethod>(
                        value: PaymentMethod.cash,
                        groupValue: selectedMethod,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (val) {
                          if (val != null) {
                            context.read<PaymentMethodCubit>().select(val);
                          }
                        },
                      ),
                      Text(context.l10n.cash),
                    ],
                  );
                },
              ),
              SizedBox(height: responsiveHeight(context, 30)),
              Text(
                context.l10n.card_type,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              BlocBuilder<CardTypeCubit, CardType?>(
                builder: (context, selectedCard) {
                  return Row(
                    children: [
                      Radio<CardType>(
                        value: CardType.mastercard,
                        groupValue: selectedCard,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (val) =>
                            context.read<CardTypeCubit>().select(val!),
                      ),
                      Image.asset(
                        AppImageStrings.mastercard,
                        width: responsiveWidth(context, 27),
                        height: responsiveHeight(context, 18),
                      ),
                      SizedBox(width: responsiveWidth(context, 20)),
                      Radio<CardType>(
                        value: CardType.visa,
                        groupValue: selectedCard,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (val) =>
                            context.read<CardTypeCubit>().select(val!),
                      ),
                      Image.asset(
                        AppImageStrings.visa,
                        width: responsiveWidth(context, 27),
                        height: responsiveHeight(context, 18),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: responsiveHeight(context, 30)),
              BlocBuilder<CartCubit, List<FoodModel>>(
                builder: (context, cartItems) {
                  return CartSummaryBox(
                    cartItems: cartItems,
                    onPressed: () {
                      if (_selectedLocation != null &&
                          _selectedPlaceName != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TrackScreen(
                              deliveryLocation: _selectedLocation!,
                              placeName: _selectedPlaceName!,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select a delivery location."),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
