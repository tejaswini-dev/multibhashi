import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_multibashi/DataModel/ArtWorkDetails.dart';
import 'package:flutter_app_multibashi/DataModel/ArtWorksDataModel.dart';
//import 'package:flutter_app_multibashi/DataModel/ArtWorksDataModel.dart';
import 'package:flutter_app_multibashi/Services/Services.dart';
import 'package:flutter_app_multibashi/Utils/InternetUtil.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardLoading());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchArtWorkDataEvent) {
      yield* _mapFetchArtWorkDataEvent(event);
    }

    if (event is FetchArtWorkSearchDataEvent) {
      yield* _mapFetchArtWorkSearchDataEvent(event);
    }
  }

  Service api = Service();

  Stream<DashboardState> _mapFetchArtWorkDataEvent(
      FetchArtWorkDataEvent event) async* {
    List<Data> artWorkDataList = [];
    bool saving = true;
    int page = event.page;
    bool endPage = false;

    getArtDetails() async {
      await InternetHelperUtil.checkInternetConnection().then((internet) async {
        if (internet) {
          await api
              .fetchArtWorkDetailedData(
            page: event.page,
          )
              .then((ArtWorksDetail responseObj) {
            if (responseObj.data != null &&
                responseObj.data.isNotEmpty &&
                responseObj.data.length > 0) {
              artWorkDataList = responseObj.data;
              if (artWorkDataList.length > 0 &&
                  event.oldArtWorkDataList != null) {
                event.oldArtWorkDataList.addAll(artWorkDataList);
                artWorkDataList = event.oldArtWorkDataList;
              }
              page++;
              saving = false;
            } else {
              if (event.oldArtWorkDataList != null &&
                  event.oldArtWorkDataList.length > 0) {
                artWorkDataList = event.oldArtWorkDataList;
              }
              endPage = true;
              saving = true;
            }
          });
        } else {
          /*No Internet*/
          endPage = true;
          saving = true;
        }
      });
    }

    await getArtDetails();
    yield DashboardLoaded(
      artWorkDataList: artWorkDataList,
      saving: saving,
      endPage: endPage,
      page: page,
    );
  }

  Stream<DashboardState> _mapFetchArtWorkSearchDataEvent(
      FetchArtWorkSearchDataEvent event) async* {
    List<SearchData> artWorkSearchList = [];

    getArtData() async {
      await InternetHelperUtil.checkInternetConnection().then((internet) async {
        if (internet) {
          await api
              .fetchArtWorkData(
            searchKeyValue: event.searchKey ?? "",
          )
              .then((ArtWorksDataModel responseObj) {
            if (responseObj.data != null &&
                responseObj.data.isNotEmpty &&
                responseObj.data.length > 0) {
              artWorkSearchList = responseObj.data;
            }
          });
        } else {
          /*No Internet*/

        }
      });
    }

    await getArtData();
    yield DashboardLoading();
    yield DashboardSearchResultsLoaded(
      artWorkDataList: artWorkSearchList,
      saving: true,
      endPage: true,
      page: 1,
    );
  }
}
