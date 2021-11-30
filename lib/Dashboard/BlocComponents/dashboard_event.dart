part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class FetchArtWorkDataEvent extends DashboardEvent {
  final List<Data> oldArtWorkDataList;
  final int page;

  FetchArtWorkDataEvent({
    this.oldArtWorkDataList,
    this.page,
  });
}

class FetchArtWorkSearchDataEvent extends DashboardEvent {
  final String searchKey;

  FetchArtWorkSearchDataEvent({
    this.searchKey,
  });
}
