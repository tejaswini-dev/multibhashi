part of 'art_work_detail_bloc.dart';

@immutable
abstract class ArtWorkDetailState {}

class ArtWorkDetailLoading extends ArtWorkDetailState {}

class ArtWorkDetailLoaded extends ArtWorkDetailState {
  final Data artWorkDetails;

  ArtWorkDetailLoaded({this.artWorkDetails});
}
