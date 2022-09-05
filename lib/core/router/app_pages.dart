import 'package:flutter/material.dart';
import 'package:formsflowai/presentation/features/home/tasklisting/view/task_list_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/assigntask/view/assign_task_screen.dart';
import '../../presentation/features/home/tasklisting/model/task_listing_data_model.dart';
import '../../presentation/features/login/views/login_screen.dart';
import '../../presentation/features/splash/view/splash_screen.dart';
import '../../presentation/features/taskdetails/model/application_history_data_model.dart';
import '../../presentation/features/taskdetails/view/task_details_screen.dart';
import '../../presentation/features/viewformsubmission/view/view_form_submission_screen.dart';
import 'app_page_error.dart';
import 'app_path.dart';
import 'app_routes.dart';

/// [FormsFlowAIRouter] Contains all the app
/// routing methods(routeNames, routePaths..)
class FormsFlowAIRouter {
  static final GoRouter appRouteList = GoRouter(
    initialLocation: AppPath.appIndexPath,
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const ErrorRouterPage(),
    routes: <GoRoute>[
      GoRoute(
        path: AppPath.appIndexPath,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: AppPath.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
          name: AppRoutes.taskListingScreen,
          path: AppPath.taskListingScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const TaskListScreen(),
          routes: [
            GoRoute(
              path: AppPath.taskDetailsScreen,
              name: AppRoutes.taskDetailsScreen,
              builder: (BuildContext context, GoRouterState state) =>
                  TaskDetailsScreen(
                taskListingDM: state.extra as TaskListingDM,
              ),
            ),
            GoRoute(
              path: AppPath.viewFormSubmissionScreen,
              name: AppRoutes.viewFormSubmissionScreen,
              builder: (BuildContext context, GoRouterState state) =>
                  ViewFormSubmissionScreen(
                applicationHistoryDM: state.extra as ApplicationHistoryDM,
              ),
            ),
            GoRoute(
              path: AppPath.assignTaskScreen,
              name: AppRoutes.assignTaskScreen,
              builder: (BuildContext context, GoRouterState state) =>
                  AssignTaskScreen(
                taskListingDM: state.extra as TaskListingDM,
              ),
            ),
          ]),
    ],
  );
}
