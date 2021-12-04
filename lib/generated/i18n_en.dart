import 'i18n.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get button_cancel => 'CANCEL';

  @override
  String get button_delete => 'DELETE';

  @override
  String get button_delete_camel => 'Delete';

  @override
  String get button_save => 'SAVE';

  @override
  String get button_edit => 'EDIT';

  @override
  String get button_edit_camel => 'Edit';

  @override
  String get button_add_car => 'ADD CAR';

  @override
  String get button_add_calendar_camel => 'Remind';

  @override
  String get car_card_alert_dialog_title => 'Remove a car from the list?';

  @override
  String get car_card_content_text =>
      'You will remove the car from the list of vehicles without the possibility of recovery';

  @override
  String get car_card_no_image_selected => 'No image selected';

  @override
  String get car_card_mileage => 'Mileage: \$mileage km';

  @override
  String get car_card_enter_current_mileage => 'Enter current mileage';

  @override
  String get car_card_change => 'Edit';

  @override
  String get drawer_not_logged => 'Not logged in';

  @override
  String get drawer_my_cars => 'My cars';

  @override
  String get drawer_add_car => 'Add car';

  @override
  String get drawer_logout => 'Logout';

  @override
  String get form_warning_fill_info => 'Fill in the required information';

  @override
  String get form_alert_details => 'Details';

  @override
  String get form_alert_car_name => 'Car name: \$name';

  @override
  String get form_alert_car_mark => 'Car mark: \$mark';

  @override
  String get form_alert_car_model => 'Car model: \$model';

  @override
  String get form_alert_car_year => 'Car year: \$year';

  @override
  String get form_alert_car_mileage => 'Mileage: \$mileage';

  @override
  String get form_initial_my_car => 'My Car';

  @override
  String get form_switch_replacement => 'Replacement';

  @override
  String get form_switch_check => 'Check';

  @override
  String get form_validator_car_name => 'Please, enter a car name';

  @override
  String get form_validator_car_mark => 'Please, enter a car mark';

  @override
  String get form_validator_car_model => 'Please, enter a car model';

  @override
  String get form_validator_car_year => 'Please, enter a car year';

  @override
  String get form_validator_car_mileage => 'Please, enter a current mileage';

  @override
  String get form_validator_car_vin => 'Please, enter a VIN code';

  @override
  String get form_validator_dot => 'Use dot for groups of digits';

  @override
  String get form_validator_date_format => 'Wrong date format';

  @override
  String get form_decorator_car_name => 'Choose a car name';

  @override
  String get form_decorator_car_mark => 'Enter a car mark';

  @override
  String get form_decorator_car_model => 'Enter a car model';

  @override
  String get form_decorator_car_year => 'Enter a car year';

  @override
  String get form_decorator_car_mileage => 'Enter a current mileage';

  @override
  String get form_decorator_car_vin => 'Enter a VIN code * unnecessary';

  @override
  String get form_decorator_maintenance_interval => 'Maintenance interval, mo';

  @override
  String get form_decorator_maintenance_interval_km => 'Maintenance interval, km';

  @override
  String get form_decorator_maintenance_name => 'Maintenance title';

  @override
  String get form_decorator_notes => 'Notes';

  @override
  String get form_decorator_value_work => 'Value of work';

  @override
  String get form_decorator_value_parts => 'Value of parts';

  @override
  String get form_decorator_part_name => 'Consumables / parts';

  @override
  String get form_decorator_odometer_value => 'Odometer value, km';

  @override
  String get form_decorator_date_select => 'Select the date';

  @override
  String get form_decorator_date => 'Maintenance date';

  @override
  String get form_decorator_select_maintenance => 'Select maintenance from list';

  @override
  String get snack_bar_message_warning => 'The form is filled incorrectly! Correct the mistakes';

  @override
  String get add_car_page_description => 'On this page you must enter information about your car:';

  @override
  String get add_entry_page_description =>
      'On this page you must enter the name of the inspection or operation of the vehicle maintenance schedule, as well as the maintenance interval.';

  @override
  String get add_operation_page_description =>
      'On this page, it is necessary to record the performed inspection or maintenance operation, odometer value, used consumables or spare parts';

  @override
  String get car_list_page_warning => 'To get started you need to add a car';

  @override
  String get dashboard_page_welcome => 'Welcome to TurboStat!';

  @override
  String get dashboard_page_welcome_thanks => '';

  @override
  String get dashboard_page_missed_maintenance =>
      'You missed a maintenance operation, your mileage was over \$mileageFromLast km';

  @override
  String get dashboard_page_missed_maintenance_days =>
      'You missed a maintenance operation for \$daysOver days';

  @override
  String get dashboard_page_not_determinate_title => 'No maintenance information';

  @override
  String get dashboard_page_maintenance_before =>
      '\$daysRemain days or \$mileageRemain km left before the next maintenance operation';

  @override
  String get add_maintenance_regular => 'Add regular maintenance';

  @override
  String get add_maintenance_operation => 'Write maintenance operation';

  @override
  String get edit_car_page_title => 'Edit car details:';

  @override
  String get delete_image => 'Delete image';

  @override
  String get new_image_info => '* a new image can be selected on the list of your cars page';

  @override
  String get image_deleted => 'Image deleted';

  @override
  String get edit_entry_page_title => 'Edit maintenance information';

  @override
  String get works => 'Works: ';

  @override
  String get parts => 'Parts: ';

  @override
  String get odometer => 'odometer';

  @override
  String get km => ' km';

  @override
  String get date => 'date';

  @override
  String get entry_details_page_description =>
      'This maintenance must be performed every \$entryDateLimit2 months or \$entryMileageLimit2 kilometers (whichever comes first)';

  @override
  String get enter_email => 'Enter Email';

  @override
  String get enter_password => 'Enter Password';

  @override
  String get password => 'Password';

  @override
  String get login => 'SIGN IN:';

  @override
  String get signin => 'SIGN IN';

  @override
  String get signin_with_google => 'SIGN IN WITH GOOGLE';

  @override
  String get registration => 'Create an Account';

  @override
  String get already_have_account => 'Already have an account? Sign in';

  @override
  String get delete_entry_operation => 'Delete record?';

  @override
  String get delete_entry_operation_warning =>
      'You will delete the current record without the possibility of recovery';

  @override
  String get will_pop_alert => 'Exit the App?';

  @override
  String get pick_image => 'Pick Image';

  @override
  String get statistics => 'Statistics';

  @override
  String get history => 'History';

  @override
  String get stats => 'Stats';

  @override
  String get cars => 'Cars';

  @override
  String get settings => 'Settings';
}
