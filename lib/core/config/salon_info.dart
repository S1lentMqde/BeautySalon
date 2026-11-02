/// Данные салона. Позже будут загружаться из таблицы salon_settings.
/// ВПИШИТЕ СВОИ ДАННЫЕ в строки ниже. Пустые ссылки = кнопка покажет
/// «Этот контакт пока не указан».
abstract final class SalonInfo {
  static const name = 'Мээрим Айтиева';

  // Текст, который видит клиент:
  static const address = '[Адрес салона в Оше — впишите]';
  static const phone = '[Телефон — впишите]';
  static const hours = '[Часы работы — впишите]';

  // Для кнопок (можно оставить пустыми):
  static const phoneDial = ''; // например '+996700123456'
  static const whatsapp = ''; // цифры без плюса, например '996700123456'
  static const instagram = ''; // например 'https://instagram.com/ваш_аккаунт'
  static const mapUrl = ''; // ссылка на салон в 2ГИС или Google Maps
}
