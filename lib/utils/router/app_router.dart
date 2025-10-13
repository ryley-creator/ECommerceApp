import 'package:ecommerce/pages/auth/forgot_password.dart';
import 'package:ecommerce/pages/detailed_info_page.dart';
import 'package:ecommerce/pages/pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  redirect: (context, state) {
    if (state.fullPath?.isEmpty ?? true) {
      return '/home_page';
    }
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/welcome_page1',
      builder: (context, state) => WelcomePage1(),
    ),
    GoRoute(
      path: '/welcome_page2',
      builder: (context, state) => WelcomePage2(),
    ),
    GoRoute(
      path: '/welcome_page3',
      builder: (context, state) => WelcomePage3(),
    ),
    GoRoute(path: '/login_page', builder: (context, state) => LoginPage()),
    GoRoute(path: '/home_page', builder: (context, state) => HomePage()),
    GoRoute(path: '/sign_up_page', builder: (context, state) => SignUpPage()),
    GoRoute(path: '/login_page', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/forgot_password',
      builder: (context, state) => ForgotPassword(),
    ),
    GoRoute(
      path: '/details_page',
      builder: (context, state) => DetailedInfoPage(),
    ),
  ],
);
