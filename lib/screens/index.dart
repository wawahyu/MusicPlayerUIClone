import 'package:flutter/material.dart';
import 'package:meizuplayerclone/data/dummy.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainIndexPage extends StatefulWidget {
  @override
  _MainIndexPageState createState() => _MainIndexPageState();
}

class _MainIndexPageState extends State<MainIndexPage> {
  PanelController panelController;
  double slide = 0.0;
  bool load = false;
  bool get panelOpen => panelController?.isPanelOpen ?? false;
  @override
  void initState() {
    super.initState();
  }

  Future initialize() async {
    await Future.delayed(Duration());
    setState(() {
      panelController = PanelController();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    List<Map> musics = musicDummy;
    musics.sort((a, b) => a['title'].compareTo(b['title']));

    return Material(
      child: SlidingUpPanel(
        controller: panelController,
        onPanelSlide: (val) {
          setState(() {
            slide = val;
          });
        },
        maxHeight: height,
        minHeight: 54,
        panel: GestureDetector(
          // onTap: panelOpen ? null : () => panelController.open(),
          child: Container(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1),
                  left: 16 - (slide * 16),
                  top: 4 - (slide * 4),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1),
                    height: 46 - (slide * 46) + slide * width,
                    width: 46 - (slide * 46) + slide * width,
                    color: Colors.grey[600],
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1),
                  left: (16 + 46 + 8) - (slide * (16 + 46 + 8)),
                  top: 4 - (slide * 4) + slide * width + slide * 16,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1),
                    padding: EdgeInsets.symmetric(horizontal: 16 * slide),
                    width: width -
                        (16 + 46 + 8) -
                        (60 + 16 + 8) -
                        ((width - (16 + 46 + 8) - (60 + 16 + 8)) * slide) +
                        width * slide,
                    height: 46 + 54 * slide,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 1),
                          width: width -
                              (16 + 46 + 8) -
                              (60 + 16 + 8) -
                              ((width - (16 + 46 + 8) - (60 + 16 + 8)) *
                                  slide) +
                              width * slide,
                          height: 46 + 14 * slide,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 46 + 14 * slide,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Under way Way Way',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Back Up',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: slide * 40,
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: 30 + 10 * slide,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.grey[700],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: slide * 40,
                              ),
                            ],
                          ),
                        ),
                        slide > 0.5
                            ? AnimatedPositioned(
                                top: 54 - 54 * slide,
                                right: 8,
                                duration: Duration(milliseconds: 1),
                                child: Container(
                                  height: 46 + 14 * slide,
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey[700].withOpacity(slide),
                                  ),
                                ),
                              )
                            : Container(),
                        slide > 0.5
                            ? AnimatedPositioned(
                                top: 54 - 54 * slide,
                                right: 88,
                                duration: Duration(milliseconds: 1),
                                child: Container(
                                  height: 46 + 14 * slide,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey[700].withOpacity(slide),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1),
                  top: 4 - (slide * 4) + slide * height - 54 * slide,
                  right: 16,
                  left: slide * 16 +
                      (width - 60 - 16) -
                      (width - 60 - 16) * slide,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1),
                    width: 60 - (slide * 60) + width * slide,
                    height: 46 + (slide * 14),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: slide.round(),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: width / 6 * slide,
                                // child: Icon(Icons.playlist_play),
                              ),
                            ),
                            Flexible(
                              flex: slide.round(),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: width / 6 * slide,
                                // child: Icon(Icons.skip_previous),
                              ),
                            ),
                            Flexible(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: 30 - 30 * slide + width / 6 * slide,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            Flexible(
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: 30 - 30 * slide + width / 6 * slide,
                                child: Icon(
                                  Icons.skip_next,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: slide.round(),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1),
                                width: width / 6 * slide,
                                // child: Icon(
                                //   Icons.refresh,
                                // ),
                              ),
                            ),
                          ],
                        ),
                        slide > 0.5
                            ? AnimatedPositioned(
                                top: -8 + 8 * slide,
                                left: 16 - 16 * slide,
                                duration: Duration(milliseconds: 1),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 1),
                                  height: 46 + (slide * 14),
                                  width: width / 6 * slide,
                                  child: Icon(
                                    Icons.playlist_add,
                                    color: Colors.grey[700].withOpacity(slide),
                                  ),
                                ),
                              )
                            : Container(),
                        slide > 0.5
                            ? AnimatedPositioned(
                                top: -8 + 8 * slide,
                                left: 16 - 16 * slide + width / 6,
                                duration: Duration(milliseconds: 1),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 1),
                                  height: 46 + (slide * 14),
                                  width: width / 6 * slide,
                                  child: Icon(
                                    Icons.skip_previous,
                                    color: Colors.grey[700].withOpacity(slide),
                                  ),
                                ),
                              )
                            : Container(),
                        slide > 0.5
                            ? AnimatedPositioned(
                                top: -8 + 8 * slide,
                                right: -16 + 16 * slide,
                                duration: Duration(milliseconds: 1),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 1),
                                  height: 46 + (slide * 14),
                                  width: width / 6 * slide,
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.grey[700].withOpacity(slide),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                panelOpen
                    ? SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            top: 8,
                          ),
                          child: InkWell(
                            // onTap: () => panelController.close(),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 4,
            title: Text(
              'Music',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: AspectRatio(
                  aspectRatio: 16 / 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    height: width,
                    width: width,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            width: width / 3,
                            height: width / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red[500],
                                    ),
                                  ),
                                ),
                                Text(
                                  'Favorites',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '100 Song(s)',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: width / 3,
                            height: width / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.history,
                                      color: Colors.orange[500],
                                    ),
                                  ),
                                ),
                                Text(
                                  'Recent',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '40 Song(s)',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: width / 3,
                            height: width / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Icon(
                                      Icons.article,
                                      color: Colors.blue[500],
                                    ),
                                  ),
                                ),
                                Text(
                                  'My Playlist',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '8 Playlist(s)',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 8,
                  color: Colors.grey[100],
                ),
              ),
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                elevation: 0.7,
                actions: [],
                title: Container(
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 16,
                  //   vertical: 8,
                  // ),
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red[500],
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                'Shuffle',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.sort,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.view_module,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.25),
                    //     offset: Offset(0, 0.5),
                    //   ),
                    // ],
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 60,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Map music = musics[index];
                    return Container(
                      width: width,
                      height: 60,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  music['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  ((music['artist'] ?? {})['title'] ??
                                              'Unknown Artist')
                                          .toString() +
                                      ' - ' +
                                      ((music['album'] ?? {})['title'] ??
                                              'Unknown Album')
                                          .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 30,
                            child: Icon(
                              Icons.more_horiz,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: musics.length,
                ),
              ),
            ],
            physics: BouncingScrollPhysics(),
            // controller: _scrollController,
          ),
          // body: Container(
          //   height: height,
          //   width: width,
          //   child: Column(
          //     children: [
        ),
      ),
    );
  }
}

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  double _maxExtent, _minExtent;

  SliverHeaderDelegate(this._maxExtent, this._minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Container(
        color: Colors.lightBlue,
      ),
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this ||
        oldDelegate?.maxExtent != this.maxExtent ||
        oldDelegate?.minExtent != this.minExtent;
  }
}
