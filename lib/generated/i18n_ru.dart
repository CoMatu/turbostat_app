import 'i18n.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get button_cancel => 'ОТМЕНА';

  @override
  String get button_delete => 'УДАЛИТЬ';

  @override
  String get button_delete_camel => 'Удалить';

  @override
  String get button_save => 'СОХРАНИТЬ';

  @override
  String get button_edit => 'ИЗМЕНИТЬ';

  @override
  String get button_edit_camel => 'Изменить';

  @override
  String get button_add_car => 'ДОБАВИТЬ АВТО';

  @override
  String get button_add_calendar_camel => 'Напомнить';

  @override
  String get car_card_alert_dialog_title => 'Удалить автомобиль из списка?';

  @override
  String get car_card_content_text =>
      'Вы удалите автомобиль из списка транспортных средств без возможности восстановления';

  @override
  String get car_card_no_image_selected => 'Изображение не выбрано';

  @override
  String get car_card_mileage => 'Пробег: \$mileage км';

  @override
  String get car_card_enter_current_mileage => 'Введите текущий пробег';

  @override
  String get car_card_change => 'Изменить';

  @override
  String get drawer_not_logged => 'Вход не выполнен';

  @override
  String get drawer_my_cars => 'Мои автомобили';

  @override
  String get drawer_add_car => 'Добавить автомобиль';

  @override
  String get drawer_logout => 'Выход из аккаунта';

  @override
  String get form_warning_fill_info => 'Заполните необходимую информацию';

  @override
  String get form_alert_details => 'Детали';

  @override
  String get form_alert_car_name => 'Имя: \$name';

  @override
  String get form_alert_car_mark => 'Марка: \$mark';

  @override
  String get form_alert_car_model => 'Модель: \$model';

  @override
  String get form_alert_car_year => 'Год выпуска: \$year';

  @override
  String get form_alert_car_mileage => 'Пробег: \$mileage';

  @override
  String get form_initial_my_car => 'Моя машина';

  @override
  String get form_switch_replacement => 'Замена';

  @override
  String get form_switch_check => 'Проверка';

  @override
  String get form_validator_car_name => 'Пожалуйста, введите название';

  @override
  String get form_validator_car_mark => 'Пожалуйста, введите марку автомобиля';

  @override
  String get form_validator_car_model => 'Пожалуйста, введите модель авто';

  @override
  String get form_validator_car_year => 'Пожалуйста, введите год выпуска';

  @override
  String get form_validator_car_mileage => 'Пожалуйста, введите текущий пробег';

  @override
  String get form_validator_car_vin => 'Пожалуйста, введите VIN';

  @override
  String get form_validator_dot => 'Используйте точку для групп разрядов';

  @override
  String get form_validator_date_format => 'Неправильный формат даты';

  @override
  String get form_decorator_car_name => 'Придумайте название авто';

  @override
  String get form_decorator_car_mark => 'Введите марку автомобиля';

  @override
  String get form_decorator_car_model => 'Введите модель автомобиля';

  @override
  String get form_decorator_car_year => 'Введите год выпуска';

  @override
  String get form_decorator_car_mileage => 'Введите текущий пробег';

  @override
  String get form_decorator_car_vin => 'Введите VIN *необязательно';

  @override
  String get form_decorator_maintenance_interval => 'Периодичность, мес';

  @override
  String get form_decorator_maintenance_interval_km => 'Периодичность, км';

  @override
  String get form_decorator_maintenance_name => 'Название проверки или вида ТО';

  @override
  String get form_decorator_notes => 'Заметки';

  @override
  String get form_decorator_value_work => 'Стоимость работ';

  @override
  String get form_decorator_value_parts => 'Стоимость запчастей';

  @override
  String get form_decorator_part_name => 'Расходные материалы / запчасти';

  @override
  String get form_decorator_odometer_value => 'Текущий пробег, км';

  @override
  String get form_decorator_date_select => 'Выберите дату';

  @override
  String get form_decorator_date => 'Дата проверки (операции)';

  @override
  String get form_decorator_select_maintenance => 'Выберите проверку из списка';

  @override
  String get snack_bar_message_warning => 'Форма заполнена некорректно! Исправьте ошибки...';

  @override
  String get add_car_page_description =>
      'На этой странице необходимо ввести информацию о Вашем автомобиле:';

  @override
  String get add_entry_page_description =>
      'На этой странице необходимо ввести название проверки или операции регламента технического обслуживания автомобиля, а также периодичность проверки.';

  @override
  String get add_operation_page_description =>
      'На этой странице необходимо записать выполненную проверку или операцию ТО, показания одометра, использованные расходники или запчасти';

  @override
  String get car_list_page_warning =>
      'Для начала работы с программой нужно добавить хотя бы один автомобиль';

  @override
  String get dashboard_page_welcome => 'Добро пожаловать в TurboStat!';

  @override
  String get dashboard_page_welcome_thanks => 'Спасибо, что Вы с нами!';

  @override
  String get dashboard_page_missed_maintenance =>
      'Вы пропустили операцию ТО, пробег сверх нормы составил \$mileageFromLast км';

  @override
  String get dashboard_page_missed_maintenance_days =>
      'Вы пропустили операцию ТО на \$daysOver дней';

  @override
  String get dashboard_page_not_determinate_title => 'Нет информации о проведении ТО';

  @override
  String get dashboard_page_maintenance_before =>
      'До следующей операции ТО осталось \$daysRemain дней или \$mileageRemain км';

  @override
  String get add_maintenance_regular => 'Добавить регламент ТО';

  @override
  String get add_maintenance_operation => 'Записать операцию ТО';

  @override
  String get edit_car_page_title => 'Редактировать информацию об автомобиле:';

  @override
  String get delete_image => 'Удалить фотографию';

  @override
  String get new_image_info => '* новую фотографию можно выбрать на странице списка Ваших машин';

  @override
  String get image_deleted => 'Фотография удалена';

  @override
  String get edit_entry_page_title => 'Редактировать информацию вида технического обслуживания:';

  @override
  String get works => 'Работа:';

  @override
  String get parts => 'Запчасти:';

  @override
  String get odometer => 'пробег';

  @override
  String get km => ' км';

  @override
  String get date => 'дата выполнения';

  @override
  String get entry_details_page_description =>
      'Эту операцию ТО необходимо выполнять каждые \$entryDateLimit2 мес или \$entryMileageLimit2 км (в зависимости от того, что наступит раньше)';

  @override
  String get enter_email => 'Введите Email';

  @override
  String get enter_password => 'Введите пароль';

  @override
  String get password => 'Пароль';

  @override
  String get login => 'ВХОД В ПРИЛОЖЕНИЕ:';

  @override
  String get signin => 'ВХОД';

  @override
  String get signin_with_google => 'ВХОД ЧЕРЕЗ GOOGLE';

  @override
  String get registration => 'Зарегистрироваться';

  @override
  String get already_have_account => 'Есть аккаунт? Войти';

  @override
  String get delete_entry_operation => 'Удалить запись?';

  @override
  String get delete_entry_operation_warning =>
      'Вы удалите текущую запись без возможности восстановления';

  @override
  String get will_pop_alert => 'Выйти из приложения?';

  @override
  String get pick_image => 'Выбрать изображение';

  @override
  String get statistics => 'Статистика';

  @override
  String get history => 'История';

  @override
  String get stats => 'Статистика';

  @override
  String get cars => 'Машины';

  @override
  String get settings => 'Настройки';
}
