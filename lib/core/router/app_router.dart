import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login_page.dart';
import '../../features/booking/presentation/booking_page.dart';
import '../../features/catalog/presentation/services_page.dart';
import '../../features/salon/presentation/contacts_page.dart';
import '../../features/salon/presentation/home_page.dart';
import '../../features/specialists/presentation/specialists_page.dart';
import '../widgets/stub_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/booking',
        builder: (context, state) => const BookingPage(),
      ),
      GoRoute(
        path: '/services',
        builder: (context, state) => const ServicesPage(),
      ),
      GoRoute(
        path: '/specialists',
        builder: (context, state) => const SpecialistsPage(),
      ),
      GoRoute(
        path: '/courses',
        builder: (context, state) => const StubPage(title: 'Обучающие курсы'),
      ),
      GoRoute(
        path: '/contacts',
        builder: (context, state) => const ContactsPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    ],
    errorBuilder: (context, state) =>
        const StubPage(title: 'Страница не найдена (404)'),
  );
});
