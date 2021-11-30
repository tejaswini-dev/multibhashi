part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Data> artWorkDataList;
  bool saving;
  int page;
  bool endPage;

  DashboardLoaded({
    this.artWorkDataList,
    this.page,
    this.saving,
    this.endPage,
  });
}

class DashboardSearchResultsLoaded extends DashboardState {
  final List<SearchData> artWorkDataList;
  bool saving;
  int page;
  bool endPage;

  DashboardSearchResultsLoaded({
    this.artWorkDataList,
    this.page,
    this.saving,
    this.endPage,
  });
}
