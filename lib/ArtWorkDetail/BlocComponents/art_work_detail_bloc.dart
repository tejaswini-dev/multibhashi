import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_multibashi/DataModel/ArtWorkDetailPage.dart';
import 'package:flutter_app_multibashi/Services/Services.dart';
import 'package:flutter_app_multibashi/Utils/InternetUtil.dart';
import 'package:meta/meta.dart';

part 'art_work_detail_event.dart';
part 'art_work_detail_state.dart';

class ArtWorkDetailBloc extends Bloc<ArtWorkDetailEvent, ArtWorkDetailState> {
  ArtWorkDetailBloc() : super(ArtWorkDetailLoading());

  @override
  Stream<ArtWorkDetailState> mapEventToState(ArtWorkDetailEvent event) async* {
    if (event is FetchArtDetails) {
      yield* _mapFetchArtDetails(event);
    }
  }

  Stream<ArtWorkDetailState> _mapFetchArtDetails(FetchArtDetails event) async* {
    Data artWorkDetails;

    getArtData() async {
      await InternetHelperUtil.checkInternetConnection().then((internet) async {
        if (internet) {
          await Service()
              .fetchArtWorkDetailedPageData(
            id: event.id ?? "",
          )
              .then((ArtWorksDetailedPage responseObj) {
            if (responseObj.data != null) {
              print("object: ${responseObj.data}");
              artWorkDetails = responseObj.data;
            }
          });
        } else {
          /*No Internet*/
        }
      });
    }

    await getArtData();
    yield ArtWorkDetailLoaded(
      artWorkDetails: artWorkDetails,
    );
  }
}
