/// Временные данные. На этапе 4 заменим загрузкой из Supabase.
class DemoService {
  const DemoService(this.category, this.name);
  final String category;
  final String name;
}

class DemoSpecialist {
  const DemoSpecialist(this.name, this.specialization, this.photo);
  final String name;
  final String specialization;
  final String photo; // путь к фото в папке assets/specialists/
}

abstract final class DemoData {
  /// Первые 4 услуги показываются на главной как популярные.
  static const services = [
    DemoService('Перманентный макияж', 'Перманентный макияж бровей'),
    DemoService('Перманентный макияж', 'Перманентный макияж губ'),
    DemoService('Ресницы и брови', 'Наращивание ресниц любой сложности'),
    DemoService('Ресницы и брови', 'Ламинирование и окрашивание ресниц/бровей'),
    DemoService('Перманентный макияж', 'Стрелка с растушевкой'),
    DemoService('Перманентный макияж', 'Межресничка'),
    DemoService('Перманентный макияж', 'Обновление старого перманента'),
    DemoService('Исправление работ', 'Перекрытие'),
    DemoService('Исправление работ', 'Исправление любой сложной работы'),
    DemoService('Лазер', 'Удаление лазерным аппаратом'),
  ];

  static List<DemoService> get popularServices => services.take(4).toList();

  static List<String> get categories =>
      services.map((s) => s.category).toSet().toList();

  /// ЗАМЕНИТЕ имена и услуги на настоящие. Фото: assets/specialists/masterN.jpg
  static const specialists = [
    DemoSpecialist(
      'Имя мастера 1',
      'Перманентный макияж бровей',
      'assets/specialists/master1.jpg',
    ),
    DemoSpecialist(
      'Имя мастера 2',
      'Перманентный макияж губ',
      'assets/specialists/master2.jpg',
    ),
    DemoSpecialist(
      'Имя мастера 3',
      'Удаление лазерным аппаратом',
      'assets/specialists/master3.jpg',
    ),
    DemoSpecialist(
      'Имя мастера 4',
      'Наращивание ресниц',
      'assets/specialists/master4.jpg',
    ),
    DemoSpecialist(
      'Имя мастера 5',
      'Ламинирование и окрашивание ресниц/бровей',
      'assets/specialists/master5.jpg',
    ),
    DemoSpecialist(
      'Имя мастера 6',
      'Стрелка с растушевкой, межресничка',
      'assets/specialists/master6.jpg',
    ),
    DemoSpecialist(
      'Имя мастера 7',
      'Перекрытие и исправление работ',
      'assets/specialists/master7.jpg',
    ),
  ];
}
