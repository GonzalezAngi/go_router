import 'package:go_router/go_router.dart';
import 'package:navegabilidadgorouter/ciclo_vida/ciclo_vida_screen.dart';
import 'package:navegabilidadgorouter/paso_parametros/detalle_screen.dart';
import 'package:navegabilidadgorouter/paso_parametros/paso_parametros.dart';
import 'package:navegabilidadgorouter/views/Listado/meal_detail_view.dart';
import 'package:navegabilidadgorouter/views/Listado/meal_list_view.dart';
import 'package:navegabilidadgorouter/views/establecimientos/establecimiento_crear_view.dart';
import 'package:navegabilidadgorouter/views/establecimientos/establecimiento_edit_view.dart';
import 'package:navegabilidadgorouter/views/establecimientos/establecimientos_list_view.dart';
import 'package:navegabilidadgorouter/views/future/future_view.dart';
import 'package:navegabilidadgorouter/views/home_view.dart';
import 'package:navegabilidadgorouter/views/isolate/isolate_view.dart';
import 'package:navegabilidadgorouter/views/timer/timer_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(), // Usa HomeView
    ),
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    GoRoute(
      path: '/future',
      name: 'future',
      builder: (context, state) => const FutureView(),
    ),
    //!Ruta para el demo de Timer
    GoRoute(
      path: '/timer',
      name: 'timerView',
      builder: (context, state) => const TimerView(),
    ),

    //!Ruta para el demo de Isolate
    GoRoute(
      path: '/isolate', //*ruta para el demo de Isolate
      name: 'isolate', //*nombre de la ruta
      builder: (context, state) => const IsolateView(),
    ),
     //! Rutas para Meals
    GoRoute(
      path: '/meals',
      name: 'meals',
      builder: (context, state) => const MealListView(),
    ),
    GoRoute(
      path: '/meals/:idMeal',
      name: 'mealDetail',
      builder: (context, state) => MealDetailView(idMeal: state.pathParameters['idMeal']!),
    ),
  //!Rutas para el manejo de Establecimientos
    //!Ruta para la lista de establecimientos
    GoRoute(
      path: '/establecimientos',
      name: 'establecimientos',
      builder: (context, state) => const EstablecimientosListView(),
    ),
    //!Ruta para editar de un establecimiento
    GoRoute(
      path: '/establecimientos/edit/:id',
      builder: (context, state) {
        //*se captura el id del establecimiento
        final id = int.parse(state.pathParameters['id']!);
        return EstablecimientoEditView(id: id);
      },
    ),
    //!Ruta para crear un establecimiento
    GoRoute(
      path: '/establecimientos/create',
      name: 'establecimientoscrear',
      builder: (context, state) => const EstablecimientoCrearView(),
    ),
  ],
);
