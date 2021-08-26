import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:nabed_test/config/chache_manager.dart';
import 'package:nabed_test/config/colors.dart';
import 'package:nabed_test/pages/auth/login/login.dart';
import 'package:nabed_test/pages/home/bloc/home_bloc.dart';
import 'package:nabed_test/pages/home/bloc/home_event.dart';
import 'package:nabed_test/pages/home/image_detail_page.dart';
import '../../injectoin.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = sl<HomeBloc>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.add(GetImages());
    super.initState();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _bloc.add(GetNext((b) => b));
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, HomeState state) {
        if (state.isLogout) {
          WidgetsBinding.instance!.addPostFrameCallback((_) =>
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage())));
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: PRIMARY,
            leading: SizedBox(),
            centerTitle: true,
            title: Text("Home"),
            actions: [
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    _bloc.add(Logout());
                  })
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.images.isNotEmpty
                  ? Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: _handleScrollNotification,
                        child: ListView.builder(
                            itemCount: state.images.length,
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return index == state.images.length
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ImageDetailPage(
                                                      image:
                                                          state.images[index],
                                                    )));
                                      },
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Hero(
                                          tag: state.images[index].id!
                                              .toString(),
                                          child: CachedNetworkImage(
                                            imageUrl: state
                                                .images[index].userImageURL!,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                CupertinoActivityIndicator(),
                                          ),

                                          // CachedNetworkImage(
                                          //   imageUrl: state
                                          //       .images[index].userImageURL!,
                                          //   cacheManager: ,
                                          //   fit: BoxFit.fill,
                                          //   placeholder: (context, url) =>
                                          //       CircularProgressIndicator(),
                                          // )

                                          //     Image.network(
                                          //   state.images[index].userImageURL!,
                                          //   fit: BoxFit.fill,
                                          // ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    );
                            }),
                      ),
                    )
                  : Expanded(child: Center(child: CircularProgressIndicator())),
              state.hasReachedEndOfResults
                  ? Container()
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        );
      },
    );
  }
}
