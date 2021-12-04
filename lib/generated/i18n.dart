import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'i18n_en.dart';
import 'i18n_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizationss returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizationss.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/i18n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizationss.localizationsDelegates,
///   supportedLocales: AppLocalizationss.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
/// be consistent with the languages listed in the AppLocalizationss.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationssDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru')];

  /// No description provided for @button_cancel.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get button_cancel;

  /// No description provided for @button_delete.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get button_delete;

  /// No description provided for @button_delete_camel.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get button_delete_camel;

  /// No description provided for @button_save.
  ///
  /// In en, this message translates to:
  /// **'SAVE'**
  String get button_save;

  /// No description provided for @button_edit.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get button_edit;

  /// No description provided for @button_edit_camel.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get button_edit_camel;

  /// No description provided for @button_add_car.
  ///
  /// In en, this message translates to:
  /// **'ADD CAR'**
  String get button_add_car;

  /// No description provided for @button_add_calendar_camel.
  ///
  /// In en, this message translates to:
  /// **'Remind'**
  String get button_add_calendar_camel;

  /// No description provided for @car_card_alert_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Remove a car from the list?'**
  String get car_card_alert_dialog_title;

  /// No description provided for @car_card_content_text.
  ///
  /// In en, this message translates to:
  /// **'You will remove the car from the list of vehicles without the possibility of recovery'**
  String get car_card_content_text;

  /// No description provided for @car_card_no_image_selected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get car_card_no_image_selected;

  /// No description provided for @car_card_mileage.
  ///
  /// In en, this message translates to:
  /// **'Mileage: \$mileage km'**
  String get car_card_mileage;

  /// No description provided for @car_card_enter_current_mileage.
  ///
  /// In en, this message translates to:
  /// **'Enter current mileage'**
  String get car_card_enter_current_mileage;

  /// No description provided for @car_card_change.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get car_card_change;

  /// No description provided for @drawer_not_logged.
  ///
  /// In en, this message translates to:
  /// **'Not logged in'**
  String get drawer_not_logged;

  /// No description provided for @drawer_my_cars.
  ///
  /// In en, this message translates to:
  /// **'My cars'**
  String get drawer_my_cars;

  /// No description provided for @drawer_add_car.
  ///
  /// In en, this message translates to:
  /// **'Add car'**
  String get drawer_add_car;

  /// No description provided for @drawer_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get drawer_logout;

  /// No description provided for @form_warning_fill_info.
  ///
  /// In en, this message translates to:
  /// **'Fill in the required information'**
  String get form_warning_fill_info;

  /// No description provided for @form_alert_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get form_alert_details;

  /// No description provided for @form_alert_car_name.
  ///
  /// In en, this message translates to:
  /// **'Car name: \$name'**
  String get form_alert_car_name;

  /// No description provided for @form_alert_car_mark.
  ///
  /// In en, this message translates to:
  /// **'Car mark: \$mark'**
  String get form_alert_car_mark;

  /// No description provided for @form_alert_car_model.
  ///
  /// In en, this message translates to:
  /// **'Car model: \$model'**
  String get form_alert_car_model;

  /// No description provided for @form_alert_car_year.
  ///
  /// In en, this message translates to:
  /// **'Car year: \$year'**
  String get form_alert_car_year;

  /// No description provided for @form_alert_car_mileage.
  ///
  /// In en, this message translates to:
  /// **'Mileage: \$mileage'**
  String get form_alert_car_mileage;

  /// No description provided for @form_initial_my_car.
  ///
  /// In en, this message translates to:
  /// **'My Car'**
  String get form_initial_my_car;

  /// No description provided for @form_switch_replacement.
  ///
  /// In en, this message translates to:
  /// **'Replacement'**
  String get form_switch_replacement;

  /// No description provided for @form_switch_check.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get form_switch_check;

  /// No description provided for @form_validator_car_name.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a car name'**
  String get form_validator_car_name;

  /// No description provided for @form_validator_car_mark.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a car mark'**
  String get form_validator_car_mark;

  /// No description provided for @form_validator_car_model.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a car model'**
  String get form_validator_car_model;

  /// No description provided for @form_validator_car_year.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a car year'**
  String get form_validator_car_year;

  /// No description provided for @form_validator_car_mileage.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a current mileage'**
  String get form_validator_car_mileage;

  /// No description provided for @form_validator_car_vin.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a VIN code'**
  String get form_validator_car_vin;

  /// No description provided for @form_validator_dot.
  ///
  /// In en, this message translates to:
  /// **'Use dot for groups of digits'**
  String get form_validator_dot;

  /// No description provided for @form_validator_date_format.
  ///
  /// In en, this message translates to:
  /// **'Wrong date format'**
  String get form_validator_date_format;

  /// No description provided for @form_decorator_car_name.
  ///
  /// In en, this message translates to:
  /// **'Choose a car name'**
  String get form_decorator_car_name;

  /// No description provided for @form_decorator_car_mark.
  ///
  /// In en, this message translates to:
  /// **'Enter a car mark'**
  String get form_decorator_car_mark;

  /// No description provided for @form_decorator_car_model.
  ///
  /// In en, this message translates to:
  /// **'Enter a car model'**
  String get form_decorator_car_model;

  /// No description provided for @form_decorator_car_year.
  ///
  /// In en, this message translates to:
  /// **'Enter a car year'**
  String get form_decorator_car_year;

  /// No description provided for @form_decorator_car_mileage.
  ///
  /// In en, this message translates to:
  /// **'Enter a current mileage'**
  String get form_decorator_car_mileage;

  /// No description provided for @form_decorator_car_vin.
  ///
  /// In en, this message translates to:
  /// **'Enter a VIN code * unnecessary'**
  String get form_decorator_car_vin;

  /// No description provided for @form_decorator_maintenance_interval.
  ///
  /// In en, this message translates to:
  /// **'Maintenance interval, mo'**
  String get form_decorator_maintenance_interval;

  /// No description provided for @form_decorator_maintenance_interval_km.
  ///
  /// In en, this message translates to:
  /// **'Maintenance interval, km'**
  String get form_decorator_maintenance_interval_km;

  /// No description provided for @form_decorator_maintenance_name.
  ///
  /// In en, this message translates to:
  /// **'Maintenance title'**
  String get form_decorator_maintenance_name;

  /// No description provided for @form_decorator_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get form_decorator_notes;

  /// No description provided for @form_decorator_value_work.
  ///
  /// In en, this message translates to:
  /// **'Value of work'**
  String get form_decorator_value_work;

  /// No description provided for @form_decorator_value_parts.
  ///
  /// In en, this message translates to:
  /// **'Value of parts'**
  String get form_decorator_value_parts;

  /// No description provided for @form_decorator_part_name.
  ///
  /// In en, this message translates to:
  /// **'Consumables / parts'**
  String get form_decorator_part_name;

  /// No description provided for @form_decorator_odometer_value.
  ///
  /// In en, this message translates to:
  /// **'Odometer value, km'**
  String get form_decorator_odometer_value;

  /// No description provided for @form_decorator_date_select.
  ///
  /// In en, this message translates to:
  /// **'Select the date'**
  String get form_decorator_date_select;

  /// No description provided for @form_decorator_date.
  ///
  /// In en, this message translates to:
  /// **'Maintenance date'**
  String get form_decorator_date;

  /// No description provided for @form_decorator_select_maintenance.
  ///
  /// In en, this message translates to:
  /// **'Select maintenance from list'**
  String get form_decorator_select_maintenance;

  /// No description provided for @snack_bar_message_warning.
  ///
  /// In en, this message translates to:
  /// **'The form is filled incorrectly! Correct the mistakes'**
  String get snack_bar_message_warning;

  /// No description provided for @add_car_page_description.
  ///
  /// In en, this message translates to:
  /// **'On this page you must enter information about your car:'**
  String get add_car_page_description;

  /// No description provided for @add_entry_page_description.
  ///
  /// In en, this message translates to:
  /// **'On this page you must enter the name of the inspection or operation of the vehicle maintenance schedule, as well as the maintenance interval.'**
  String get add_entry_page_description;

  /// No description provided for @add_operation_page_description.
  ///
  /// In en, this message translates to:
  /// **'On this page, it is necessary to record the performed inspection or maintenance operation, odometer value, used consumables or spare parts'**
  String get add_operation_page_description;

  /// No description provided for @car_list_page_warning.
  ///
  /// In en, this message translates to:
  /// **'To get started you need to add a car'**
  String get car_list_page_warning;

  /// No description provided for @dashboard_page_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to TurboStat!'**
  String get dashboard_page_welcome;

  /// No description provided for @dashboard_page_welcome_thanks.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dashboard_page_welcome_thanks;

  /// No description provided for @dashboard_page_missed_maintenance.
  ///
  /// In en, this message translates to:
  /// **'You missed a maintenance operation, your mileage was over \$mileageFromLast km'**
  String get dashboard_page_missed_maintenance;

  /// No description provided for @dashboard_page_missed_maintenance_days.
  ///
  /// In en, this message translates to:
  /// **'You missed a maintenance operation for \$daysOver days'**
  String get dashboard_page_missed_maintenance_days;

  /// No description provided for @dashboard_page_not_determinate_title.
  ///
  /// In en, this message translates to:
  /// **'No maintenance information'**
  String get dashboard_page_not_determinate_title;

  /// No description provided for @dashboard_page_maintenance_before.
  ///
  /// In en, this message translates to:
  /// **'\$daysRemain days or \$mileageRemain km left before the next maintenance operation'**
  String get dashboard_page_maintenance_before;

  /// No description provided for @add_maintenance_regular.
  ///
  /// In en, this message translates to:
  /// **'Add regular maintenance'**
  String get add_maintenance_regular;

  /// No description provided for @add_maintenance_operation.
  ///
  /// In en, this message translates to:
  /// **'Write maintenance operation'**
  String get add_maintenance_operation;

  /// No description provided for @edit_car_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit car details:'**
  String get edit_car_page_title;

  /// No description provided for @delete_image.
  ///
  /// In en, this message translates to:
  /// **'Delete image'**
  String get delete_image;

  /// No description provided for @new_image_info.
  ///
  /// In en, this message translates to:
  /// **'* a new image can be selected on the list of your cars page'**
  String get new_image_info;

  /// No description provided for @image_deleted.
  ///
  /// In en, this message translates to:
  /// **'Image deleted'**
  String get image_deleted;

  /// No description provided for @edit_entry_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit maintenance information'**
  String get edit_entry_page_title;

  /// No description provided for @works.
  ///
  /// In en, this message translates to:
  /// **'Works: '**
  String get works;

  /// No description provided for @parts.
  ///
  /// In en, this message translates to:
  /// **'Parts: '**
  String get parts;

  /// No description provided for @odometer.
  ///
  /// In en, this message translates to:
  /// **'odometer'**
  String get odometer;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **' km'**
  String get km;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'date'**
  String get date;

  /// No description provided for @entry_details_page_description.
  ///
  /// In en, this message translates to:
  /// **'This maintenance must be performed every \$entryDateLimit2 months or \$entryMileageLimit2 kilometers (whichever comes first)'**
  String get entry_details_page_description;

  /// No description provided for @enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enter_email;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enter_password;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN:'**
  String get login;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get signin;

  /// No description provided for @signin_with_google.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN WITH GOOGLE'**
  String get signin_with_google;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get registration;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get already_have_account;

  /// No description provided for @delete_entry_operation.
  ///
  /// In en, this message translates to:
  /// **'Delete record?'**
  String get delete_entry_operation;

  /// No description provided for @delete_entry_operation_warning.
  ///
  /// In en, this message translates to:
  /// **'You will delete the current record without the possibility of recovery'**
  String get delete_entry_operation_warning;

  /// No description provided for @will_pop_alert.
  ///
  /// In en, this message translates to:
  /// **'Exit the App?'**
  String get will_pop_alert;

  /// No description provided for @pick_image.
  ///
  /// In en, this message translates to:
  /// **'Pick Image'**
  String get pick_image;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @cars.
  ///
  /// In en, this message translates to:
  /// **'Cars'**
  String get cars;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;
}

class _AppLocalizationssDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationssDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizationss(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationssDelegate old) => false;
}

AppLocalizations lookupAppLocalizationss(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizationss.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
