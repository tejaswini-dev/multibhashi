import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_multibashi/ArtWorkDetail/ArtWorkDetailScreen.dart';
import 'package:flutter_app_multibashi/Constants/ColorConstants.dart';
import 'package:flutter_app_multibashi/Dashboard/BlocComponents/dashboard_bloc.dart';
import 'package:flutter_app_multibashi/Utils/InternetUtil.dart';
import 'package:flutter_app_multibashi/Utils/SearchBar.dart';
import 'package:flutter_app_multibashi/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /*Bloc instance*/
  final DashboardBloc dashboardBloc = DashboardBloc();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  var _connectivitySubscription;

  /*Text Editing Controllers*/
  final TextEditingController searchController = TextEditingController();

  bool isNetworkConnected = true;

  @override
  void initState() {
    super.initState();
    onNetworkChange();
    dashboardBloc.add(
      FetchArtWorkDataEvent(
        page: 1,
      ),
    );
  }

  @override
  void dispose() {
    searchController?.dispose();
    dashboardBloc?.close();
    _refreshController?.dispose();
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  /* On change in network wifi/mobile data */
  void onNetworkChange() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isNetworkConnected = false;
      } else {
        isNetworkConnected = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // ignore: missing_return
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: (!isNetworkConnected)
            ? AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0.0,
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: SizedBox(
                  width: 0.0,
                ),
              ),
        body: (!isNetworkConnected)
            ? Center(
                child: Text(
                  "OOPS!! Connection lost",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus.unfocus();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenUtil.setWidth(
                      15.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenUtil.setHeight(
                          30.0,
                        ),
                      ),
                      /*Search Bar*/
                      searchBar(
                        textEditController: searchController,
                        readonly: false,
                        hinttext: 'Search Artworks',
                        keyboardaction: TextInputAction.search,
                        keyBoardInputType: TextInputType.text,
                        onChange: (value) {
                          dashboardBloc.add(
                            FetchArtWorkSearchDataEvent(
                              searchKey: value,
                            ),
                          );
                        },
                        onEditComplete: () {
                          dashboardBloc.add(
                            FetchArtWorkSearchDataEvent(
                              searchKey: searchController.text,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(15.0),
                      ),
                      BlocBuilder(
                        cubit: dashboardBloc,
                        builder: (context, state) {
                          if (state is DashboardLoading) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenUtil.screenHeight * 0.35,
                                ),
                                CircularProgressIndicator(),
                              ],
                            );
                          } else if (state is DashboardLoaded) {
                            return Expanded(
                              child:
                                  NotificationListener<ScrollEndNotification>(
                                onNotification:
                                    (ScrollNotification scrollInfo) {
                                  FocusScope.of(context).unfocus();

                                  if (!state.saving &&
                                      scrollInfo.metrics.pixels ==
                                          scrollInfo.metrics.maxScrollExtent) {
                                    if (!state.endPage) {
                                      state.saving = true;

                                      dashboardBloc.add(
                                        FetchArtWorkDataEvent(
                                          page: state.page,
                                          oldArtWorkDataList:
                                              state.artWorkDataList,
                                        ),
                                      );
                                    }
                                  }
                                  return true;
                                },
                                child: SmartRefresher(
                                  controller: _refreshController,
                                  enablePullDown: true,
                                  enablePullUp: state.endPage
                                      ? false
                                      : (isNetworkConnected == false)
                                          ? false
                                          : true,
                                  onRefresh: () {
                                    InternetHelperUtil.checkInternetConnection()
                                        .then((internet) {
                                      if (internet) {
                                        searchController.clear();
                                        dashboardBloc.add(
                                          FetchArtWorkDataEvent(
                                            page: 1,
                                          ),
                                        );
                                        _refreshController.refreshCompleted();
                                      } else {
                                        _refreshController.refreshFailed();
                                      }
                                    });
                                  },
                                  child: SingleChildScrollView(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: state.artWorkDataList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ArtWorkDetailScreen(
                                                  id: state
                                                      .artWorkDataList[index]
                                                      .id,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Image.network(
                                                state.artWorkDataList[index]
                                                        .artistDisplay ??
                                                    '',
                                                fit: BoxFit.fill,
                                                height:
                                                    screenUtil.screenHeight *
                                                        0.20,
                                                width: screenUtil.screenWidth,
                                                filterQuality:
                                                    FilterQuality.low,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent
                                                            loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Container(
                                                    height: screenUtil
                                                            .screenHeight *
                                                        0.20,
                                                    width:
                                                        screenUtil.screenWidth,
                                                    decoration:
                                                        new BoxDecoration(
                                                      image:
                                                          new DecorationImage(
                                                        image: NetworkImage(
                                                            'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    height: screenUtil
                                                            .screenHeight *
                                                        0.20,
                                                    width:
                                                        screenUtil.screenWidth,
                                                    decoration:
                                                        new BoxDecoration(
                                                      image:
                                                          new DecorationImage(
                                                        image: NetworkImage(
                                                            'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Positioned(
                                                bottom: 5.0,
                                                child: SizedBox(
                                                  width: screenUtil.screenWidth,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      state
                                                              .artWorkDataList[
                                                                  index]
                                                              .title ??
                                                          "",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: screenUtil.setHeight(
                                                6.0,
                                              ),
                                            ),
                                            Divider(
                                              height: 1.5,
                                              thickness: 1.5,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              height: screenUtil.setHeight(
                                                6.0,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (state is DashboardSearchResultsLoaded) {
                            return (state.artWorkDataList != null &&
                                    state.artWorkDataList.isNotEmpty &&
                                    state.artWorkDataList.length > 0)
                                ? Expanded(
                                    child: SingleChildScrollView(
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: state.artWorkDataList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ArtWorkDetailScreen(
                                                    id: state
                                                        .artWorkDataList[index]
                                                        .id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Image.network(
                                                  state.artWorkDataList[index]
                                                          .thumbnail.lqip ??
                                                      '',
                                                  fit: BoxFit.fill,
                                                  height:
                                                      screenUtil.screenHeight *
                                                          0.20,
                                                  width: screenUtil.screenWidth,
                                                  filterQuality:
                                                      FilterQuality.low,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent
                                                              loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Container(
                                                      height: screenUtil
                                                              .screenHeight *
                                                          0.20,
                                                      width: screenUtil
                                                          .screenWidth,
                                                      decoration:
                                                          new BoxDecoration(
                                                        image:
                                                            new DecorationImage(
                                                          image: NetworkImage(
                                                              'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Container(
                                                      height: screenUtil
                                                              .screenHeight *
                                                          0.20,
                                                      width: screenUtil
                                                          .screenWidth,
                                                      decoration:
                                                          new BoxDecoration(
                                                        image:
                                                            new DecorationImage(
                                                          image: NetworkImage(
                                                              'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Positioned(
                                                  bottom: 5.0,
                                                  child: SizedBox(
                                                    width:
                                                        screenUtil.screenWidth,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        state
                                                                .artWorkDataList[
                                                                    index]
                                                                .title ??
                                                            "",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: screenUtil.setHeight(
                                                  6.0,
                                                ),
                                              ),
                                              Divider(
                                                height: 1.5,
                                                thickness: 1.5,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                height: screenUtil.setHeight(
                                                  6.0,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
