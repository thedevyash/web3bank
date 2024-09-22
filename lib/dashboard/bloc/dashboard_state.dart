part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

class DasboardLoadingState extends DashboardState {}

class DasboardErrorState extends DashboardState {}

class DasboardSuccessState extends DashboardState {}
