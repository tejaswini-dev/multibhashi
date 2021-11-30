import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_multibashi/ArtWorkDetail/BlocComponents/art_work_detail_bloc.dart';
import 'package:flutter_app_multibashi/Utils/InteractiveImageViewer.dart';
import 'package:flutter_app_multibashi/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtWorkDetailScreen extends StatefulWidget {
  final int id;

  const ArtWorkDetailScreen({Key key, this.id}) : super(key: key);

  @override
  _ArtWorkDetailScreenState createState() => _ArtWorkDetailScreenState();
}

class _ArtWorkDetailScreenState extends State<ArtWorkDetailScreen> {
  final ArtWorkDetailBloc artWorkDetailBloc = ArtWorkDetailBloc();

  var _connectivitySubscription;
  bool isNetworkConnected = true;

  @override
  void initState() {
    super.initState();
    onNetworkChange();
    artWorkDetailBloc.add(
      FetchArtDetails(
        id: widget.id,
      ),
    );
  }

  @override
  void dispose() {
    artWorkDetailBloc?.close();
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
    return (!isNetworkConnected)
        ? Scaffold(
            appBar: AppBar(
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
            ),
            body: Center(
              child: Text(
                "OOPS!! Connection lost",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        : BlocBuilder(
            cubit: artWorkDetailBloc,
            builder: (context, state) {
              if (state is ArtWorkDetailLoading) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              } else if (state is ArtWorkDetailLoaded) {
                return (state.artWorkDetails != null)
                    ? Scaffold(
                        backgroundColor: Colors.white,
                        appBar: AppBar(
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
                          titleSpacing: 0.0,
                          title: Text(
                            state.artWorkDetails.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenUtil.setSp(
                                16.0,
                              ),
                            ),
                          ),
                        ),
                        body: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenUtil.setWidth(
                                15.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      state.artWorkDetails?.artistDisplay ?? '',
                                      fit: BoxFit.fill,
                                      height: screenUtil.screenHeight * 0.20,
                                      width: screenUtil.screenWidth,
                                      filterQuality: FilterQuality.low,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Container(
                                          height:
                                              screenUtil.screenHeight * 0.20,
                                          width: screenUtil.screenWidth,
                                          decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                              image: NetworkImage(
                                                  'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          height:
                                              screenUtil.screenHeight * 0.20,
                                          width: screenUtil.screenWidth,
                                          decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                              image: NetworkImage(
                                                  'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Positioned(
                                        right: 5.0,
                                        bottom: 5.0,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.fullscreen,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    InteractiveImageViewScreen(
                                                  imageURL: state.artWorkDetails
                                                          .artistDisplay ??
                                                      "",
                                                ),
                                              ),
                                            );
                                          },
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(
                                    6.0,
                                  ),
                                ),
                                Text(
                                  state.artWorkDetails.publicationHistory ?? "",
                                  style: TextStyle(
                                    fontSize: screenUtil.setSp(
                                      14.0,
                                    ),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(
                                    3.0,
                                  ),
                                ),
                                Text(
                                  state.artWorkDetails.exhibitionHistory ?? "",
                                  style: TextStyle(
                                    fontSize: screenUtil.setSp(
                                      14.0,
                                    ),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Scaffold(
                        backgroundColor: Colors.white,
                        body: Container(
                          child: Center(
                            child: Text("No Data found"),
                          ),
                        ),
                      );
              } else {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
          );
  }
}
