import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/supabase/supabase.dart';
import '/auth/base_auth_user_provider.dart';
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty =>
      state.pathParameters.isEmpty && state.queryParams.isEmpty;

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    // Check query parameters first
    if (state.queryParams.containsKey(paramName)) {
      final param = state.queryParams[paramName];
      return deserializeParam<T>(param, type, isList);
    }

    // Check path parameters
    if (state.pathParameters.containsKey(paramName)) {
      final param = state.pathParameters[paramName];
      return deserializeParam<T>(param, type, isList);
    }

    return null;
  }
}

extension on GoRouterState {
  get queryParams => null;
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const SignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const SignInWidget(),
        ),
        FFRoute(
          name: 'SignIn',
          path: '/signIn',
          builder: (context, params) => const SignInWidget(),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => const SignUpWidget(),
        ),
        FFRoute(
          name: 'nameAndNum',
          path: '/nameAndNum',
          builder: (context, params) => NameAndNumWidget(
            password: params.getParam('password', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'homePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'child_profile',
          path: '/childProfile',
          builder: (context, params) => const ChildProfileWidget(),
        ),
        FFRoute(
          name: 'mother_profile',
          path: '/motherProfile',
          builder: (context, params) => const MotherProfileWidget(),
        ),
        FFRoute(
          name: 'childedit',
          path: '/childedit',
          builder: (context, params) => const ChildeditWidget(),
        ),
        FFRoute(
          name: 'set_nameandnum',
          path: '/setNameandnum',
          builder: (context, params) => const SetNameandnumWidget(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Widget Function(BuildContext, FFParameters) builder;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }
          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state);
          final child = appStateNotifier.loading
              ? Center(child: CircularProgressIndicator())
              : builder(context, ffParams);
          return MaterialPage(key: state.pageKey, child: child);
        },
      );
}
