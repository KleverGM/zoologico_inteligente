import 'package:go_router/go_router.dart';

import 'pages/zoologico_home_page.dart';
import 'pages/animal_habitat_page.dart';
import 'pages/calculo_alimento_page.dart';
import 'pages/animal_favorito_page.dart';
import 'pages/plan_alimentacion_semanal_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const ZoologicoHomePage(),
    ),
    GoRoute(
      path: '/animal-habitat',
      builder: (_, __) => const AnimalHabitatPage(),
    ),
    GoRoute(
      path: '/calculo-alimento',
      builder: (_, __) => const CalculoAlimentoPage(),
    ),
    GoRoute(
      path: '/animal-favorito',
      builder: (_, __) => const AnimalFavoritoPage(),
    ),
    GoRoute(
      path: '/plan-alimentacion',
      builder: (_, __) => const PlanAlimentacionPage(),
    ),
  ],
);