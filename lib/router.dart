import 'package:go_router/go_router.dart';
import 'package:vasanthamdriverapp/login_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
