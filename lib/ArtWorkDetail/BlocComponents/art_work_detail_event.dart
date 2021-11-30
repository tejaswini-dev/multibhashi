part of 'art_work_detail_bloc.dart';

@immutable
abstract class ArtWorkDetailEvent {}

class FetchArtDetails extends ArtWorkDetailEvent {
  final int id;

  FetchArtDetails({this.id});
}
