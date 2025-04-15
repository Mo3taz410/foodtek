import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Sahlah'**
  String get welcome_title;

  /// No description provided for @welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy A Fast And Smooth Food Delivery At Your Doorstep'**
  String get welcome_subtitle;

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @delivery_on_time.
  ///
  /// In en, this message translates to:
  /// **'Get Delivery On Time'**
  String get delivery_on_time;

  /// No description provided for @delivery_description.
  ///
  /// In en, this message translates to:
  /// **'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'**
  String get delivery_description;

  /// No description provided for @choose_food.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Food'**
  String get choose_food;

  /// No description provided for @turn_on_location.
  ///
  /// In en, this message translates to:
  /// **'Turn On Your Location'**
  String get turn_on_location;

  /// No description provided for @location_description.
  ///
  /// In en, this message translates to:
  /// **'To Continue, Let Your Device Turn On Location, Which Uses Google’s Location Service'**
  String get location_description;

  /// No description provided for @yes_turn_on.
  ///
  /// In en, this message translates to:
  /// **'Yes, Turn It On'**
  String get yes_turn_on;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dont_have_account;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @log_in.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get log_in;

  /// No description provided for @continue_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continue_google;

  /// No description provided for @continue_facebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continue_facebook;

  /// No description provided for @continue_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continue_apple;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @birth_date.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birth_date;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @set_password.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get set_password;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @error_invalid_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name'**
  String get error_invalid_name;

  /// No description provided for @error_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get error_invalid_email;

  /// No description provided for @error_invalid_birth_date.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid birth date'**
  String get error_invalid_birth_date;

  /// No description provided for @error_invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get error_invalid_phone;

  /// No description provided for @error_invalid_password.
  ///
  /// In en, this message translates to:
  /// **'Password must include upper, lower, digit and symbol'**
  String get error_invalid_password;

  /// No description provided for @error_passwords_mismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get error_passwords_mismatch;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to Login page?'**
  String get back_to_login;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @reset_password_description.
  ///
  /// In en, this message translates to:
  /// **'Enter your e-mail or phone and we’ll send you a code to reset your account'**
  String get reset_password_description;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @enter_code.
  ///
  /// In en, this message translates to:
  /// **'A 4-digit code has been sent to your email. Please enter it below.'**
  String get enter_code;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @remember_password.
  ///
  /// In en, this message translates to:
  /// **'Remember Password?'**
  String get remember_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirm_new_password;

  /// No description provided for @update_password.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get update_password;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @password_reset_success.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get password_reset_success;

  /// No description provided for @search_menu.
  ///
  /// In en, this message translates to:
  /// **'Search menu, restaurant or etc'**
  String get search_menu;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @burger.
  ///
  /// In en, this message translates to:
  /// **'Burger'**
  String get burger;

  /// No description provided for @pizza.
  ///
  /// In en, this message translates to:
  /// **'Pizza'**
  String get pizza;

  /// No description provided for @sandwich.
  ///
  /// In en, this message translates to:
  /// **'Sandwich'**
  String get sandwich;

  /// No description provided for @experience_new_dish.
  ///
  /// In en, this message translates to:
  /// **'Experience our delicious new dish'**
  String get experience_new_dish;

  /// No description provided for @discount_30.
  ///
  /// In en, this message translates to:
  /// **'30% OFF'**
  String get discount_30;

  /// No description provided for @top_rated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get top_rated;

  /// No description provided for @recommend.
  ///
  /// In en, this message translates to:
  /// **'Recommend'**
  String get recommend;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @order_now.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get order_now;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @delayed_order.
  ///
  /// In en, this message translates to:
  /// **'Delayed Order'**
  String get delayed_order;

  /// No description provided for @delayed_order_msg.
  ///
  /// In en, this message translates to:
  /// **'Your order is running late. New ETA: 10:30 PM. Thanks for your patience!'**
  String get delayed_order_msg;

  /// No description provided for @promotional_offer.
  ///
  /// In en, this message translates to:
  /// **'Promotional Offer'**
  String get promotional_offer;

  /// No description provided for @promotional_offer_msg.
  ///
  /// In en, this message translates to:
  /// **'Craving something delicious? Get 20% off on your next order. Use code: YUMMY20.'**
  String get promotional_offer_msg;

  /// No description provided for @out_for_delivery.
  ///
  /// In en, this message translates to:
  /// **'Out for Delivery'**
  String get out_for_delivery;

  /// No description provided for @out_for_delivery_msg.
  ///
  /// In en, this message translates to:
  /// **'Your order is on the way! Estimated arrival: 15 mins. Stay hungry!'**
  String get out_for_delivery_msg;

  /// No description provided for @order_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmation'**
  String get order_confirmation;

  /// No description provided for @order_confirmation_msg.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed! We’re preparing it now. Track your order live!'**
  String get order_confirmation_msg;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @delivered_msg.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your meal! Your order has been delivered.'**
  String get delivered_msg;

  /// No description provided for @remove_from_favorites.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from favorites?'**
  String get remove_from_favorites;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @current_location.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get current_location;

  /// No description provided for @search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search menu, restaurant or etc'**
  String get search_placeholder;

  /// No description provided for @cheeseburger_title.
  ///
  /// In en, this message translates to:
  /// **'Cheeseburger Wendy\'s Burger'**
  String get cheeseburger_title;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// No description provided for @spicy.
  ///
  /// In en, this message translates to:
  /// **'Spicy'**
  String get spicy;

  /// No description provided for @mild.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get mild;

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get add_to_cart;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @price_range.
  ///
  /// In en, this message translates to:
  /// **'Price range'**
  String get price_range;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @fast_food.
  ///
  /// In en, this message translates to:
  /// **'Fast Food'**
  String get fast_food;

  /// No description provided for @sea_food.
  ///
  /// In en, this message translates to:
  /// **'Sea Food'**
  String get sea_food;

  /// No description provided for @dessert.
  ///
  /// In en, this message translates to:
  /// **'Dessert'**
  String get dessert;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @distance_1km.
  ///
  /// In en, this message translates to:
  /// **'1 KM'**
  String get distance_1km;

  /// No description provided for @distance_5km.
  ///
  /// In en, this message translates to:
  /// **'5 KM'**
  String get distance_5km;

  /// No description provided for @distance_10km.
  ///
  /// In en, this message translates to:
  /// **'10 KM'**
  String get distance_10km;

  /// No description provided for @dish.
  ///
  /// In en, this message translates to:
  /// **'Dish'**
  String get dish;

  /// No description provided for @tuna_tartare.
  ///
  /// In en, this message translates to:
  /// **'Tuna Tartare'**
  String get tuna_tartare;

  /// No description provided for @spicy_crab_cakes.
  ///
  /// In en, this message translates to:
  /// **'Spicy Crab Cakes'**
  String get spicy_crab_cakes;

  /// No description provided for @seafood_paella.
  ///
  /// In en, this message translates to:
  /// **'Seafood Paella'**
  String get seafood_paella;

  /// No description provided for @clam_chowder.
  ///
  /// In en, this message translates to:
  /// **'Clam Chowder'**
  String get clam_chowder;

  /// No description provided for @miso_glazed_cod.
  ///
  /// In en, this message translates to:
  /// **'Miso-Glazed Cod'**
  String get miso_glazed_cod;

  /// No description provided for @lobster_thermidor.
  ///
  /// In en, this message translates to:
  /// **'Lobster Thermidor'**
  String get lobster_thermidor;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @sub_total.
  ///
  /// In en, this message translates to:
  /// **'Sub-Total'**
  String get sub_total;

  /// No description provided for @delivery_charge.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charge'**
  String get delivery_charge;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @place_order.
  ///
  /// In en, this message translates to:
  /// **'Place My Order'**
  String get place_order;

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @load_more.
  ///
  /// In en, this message translates to:
  /// **'Load More..'**
  String get load_more;

  /// No description provided for @cart_empty.
  ///
  /// In en, this message translates to:
  /// **'Cart Empty'**
  String get cart_empty;

  /// No description provided for @cart_empty_message.
  ///
  /// In en, this message translates to:
  /// **'You didn’t have add any foods in cart at this time'**
  String get cart_empty_message;

  /// No description provided for @history_empty.
  ///
  /// In en, this message translates to:
  /// **'History Empty'**
  String get history_empty;

  /// No description provided for @history_empty_message.
  ///
  /// In en, this message translates to:
  /// **'You didn’t have order any foods before'**
  String get history_empty_message;

  /// No description provided for @track.
  ///
  /// In en, this message translates to:
  /// **'Track'**
  String get track;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'unread'**
  String get unread;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'read'**
  String get read;

  /// No description provided for @my_account.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get my_account;

  /// No description provided for @personal_information.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personal_information;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @push_notifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get push_notifications;

  /// No description provided for @promotional_notifications.
  ///
  /// In en, this message translates to:
  /// **'Promotional Notifications'**
  String get promotional_notifications;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @help_center.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get help_center;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get log_out;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @location_service_disabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled.'**
  String get location_service_disabled;

  /// No description provided for @location_permission_denied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied.'**
  String get location_permission_denied;

  /// No description provided for @location_permission_denied_forever.
  ///
  /// In en, this message translates to:
  /// **'Permission denied forever.'**
  String get location_permission_denied_forever;

  /// No description provided for @location_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown location'**
  String get location_unknown;

  /// No description provided for @no_favorites_yet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get no_favorites_yet;

  /// No description provided for @no_food_founds_in_this_category.
  ///
  /// In en, this message translates to:
  /// **'No food found in this category'**
  String get no_food_founds_in_this_category;

  /// No description provided for @remove_from_cart.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from cart?'**
  String get remove_from_cart;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @add_card.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get add_card;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
