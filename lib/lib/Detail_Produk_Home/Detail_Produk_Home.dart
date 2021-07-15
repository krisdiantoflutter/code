import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DetailProdukHome extends StatefulWidget {
  String gambar;
  String harga;
  String description;
  String hashtag;
// Get Key Data
  DetailProdukHome(
      {Key key, this.gambar, this.harga, this.description, this.hashtag})
      : super(key: key);
  @override
  _DetailProdukHomeState createState() => _DetailProdukHomeState();
}

class _DetailProdukHomeState extends State<DetailProdukHome>
    with TickerProviderStateMixin {
  AnimationController _ColorAnimationController;
  AnimationController _TextAnimationController;
  Animation _colorTween, _iconColorTween, _iconColorTween1;
  Animation<Offset> _transTween;

  @override
  void initState() {
     Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        isLoading = true;
      });
    });
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey[100])
        .animate(_ColorAnimationController);
    _iconColorTween1 = ColorTween(begin: Colors.white, end: Colors.grey)
        .animate(_ColorAnimationController);
    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    // getJsonData();
    // getData();
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);

      _TextAnimationController.animateTo(
          (scrollInfo.metrics.pixels - 350) / 50);
      return true;
    }
  }
  bool isLoading=false;
  bool tampil = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: _scrollListener,
              child: Stack(
                children: [
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(75.h),
                        color: Colors.deepPurple[400],
                      ),
                      Container(
                        child: isLoading?Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(160.h),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage('${widget.gambar}',
                                      scale: 100),
                                  fit: BoxFit.cover)),
                        ):Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(160.h),
                          child:  Shimmer.fromColors(
                                                child: Card(
                                                  color: Colors.grey,
                                                ),
                                                baseColor: Colors.grey[100],
                                                highlightColor:
                                                    Colors.grey[400],
                                                direction: ShimmerDirection.ltr,
                                              ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15.w),
                            right: ScreenUtil().setWidth(15.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           isLoading? Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(double.parse('${widget.harga}')),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w900),
                            ):Container(
                              height:30.h,
                              width: 90.w,
                              child: Shimmer.fromColors(
                                                child: Card(
                                                  color: Colors.grey,
                                                ),
                                                baseColor: Colors.grey[100],
                                                highlightColor:
                                                    Colors.grey[400],
                                                direction: ShimmerDirection.ltr,
                                              )
                            ),
                            //
                            Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[400],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        'Ke Keranjang',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Container(
                                    height: 20.h,
                                    width: 30.w,
                                    child: Image.asset(
                                      'gambar/images/love_icon.png',
                                      color: Colors.yellow[800],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(18.w),
                          top: ScreenUtil().setHeight(10.h),
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: 20.h,
                                width: 30.w,
                                child: Image.asset('gambar/images/diskon.png')),
                            Text(
                              '10%',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'Comfortaa',
                                  color: Colors.deepPurple[400],
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(double.parse('90000')),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Comfortaa',
                                fontSize: 10.sp,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.85,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                                height: 20.h,
                                width: 25.w,
                                child: Image.asset('gambar/images/driver.png')),
                            SizedBox(width: 6.w),
                            Text(
                              'Gratis Ongkir',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'Comfortaa',
                                  color: Colors.deepPurple[400],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      //
                      SizedBox(
                        height: 15.h,
                      ),
                     isLoading? Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15.w),
                          right: ScreenUtil().setWidth(15.w),
                        ),
                        child: Text(
                          '${widget.description}',
                          style: TextStyle(fontFamily: 'Comfortaa'),
                        ),
                      ):Padding(
                        padding:  EdgeInsets.only( left: ScreenUtil().setWidth(15.w),
                          right: ScreenUtil().setWidth(15.w),),
                        child: Container(
                          height: 150.h,
                         width: double.infinity,
                         child:  Shimmer.fromColors(
                                                  child: Card(
                                                    color: Colors.grey,
                                                  ),
                                                  baseColor: Colors.grey[100],
                                                  highlightColor:
                                                      Colors.grey[400],
                                                  direction: ShimmerDirection.ltr,
                                                ),
                        ),
                      ),
                      //
                      //  SizedBox(height: 15.h,),
                     isLoading? Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil().setHeight(10.h),
                          left: ScreenUtil().setWidth(15.w),
                          right: ScreenUtil().setWidth(15.w),
                        ),
                        child: Text(
                          '${widget.hashtag}',
                          style: TextStyle(
                              fontFamily: 'Comfortaa', color: Colors.blue),
                        ),
                      ):Padding(
                        padding:  EdgeInsets.only(bottom: ScreenUtil().setHeight(10.h),
                          left: ScreenUtil().setWidth(15.w),
                          right: ScreenUtil().setWidth(15.w),),
                        child: Container(
                          height: 40.h,
                          width: 250.w,
                          child:  Shimmer.fromColors(
                                                  child: Card(
                                                    color: Colors.grey,
                                                  ),
                                                  baseColor: Colors.grey[100],
                                                  highlightColor:
                                                      Colors.grey[400],
                                                  direction: ShimmerDirection.ltr,
                                                ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(25.w),
                          top: ScreenUtil().setWidth(8.h),
                        ),
                        child: Row(
                          children: [
                            //
                            Column(
                              children: [
                                Text('4.5',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900)),
                                SizedBox(height: 5.h),
                                Text(
                                  'Penilaian',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Container(
                              height: 40.h,
                              width: 3.w,
                              color: Colors.yellow[800],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Column(
                              children: [
                                Text('250',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900)),
                                SizedBox(height: 5.h),
                                Text(
                                  'Terjual',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Container(
                              height: 40.h,
                              width: 3.w,
                              color: Colors.yellow[800],
                            ),
                            //
                            SizedBox(
                              width: 10.w,
                            ),
                            //
                            Column(
                              children: [
                                Text('120',
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900)),
                                SizedBox(height: 5.h),
                                Text(
                                  'Sisa Stok',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //
                      SizedBox(height:10.h),
                      Container(
                        height: 30.h,
                        color: Colors.grey[300],
                      ),
                    //  Padding(
                    //    padding: const EdgeInsets.all(8.0),
                    //    child: Row(
                    //      children: [
                    //        Text('Dijual oleh'),
                    //        Text('CARInih'),
                    //      ],
                    //    ),
                    //  ),
                      // // Text('ssssssssss'),
                      // // Text('ssssssssss'),
                      // // Text('ssssssssss'),
                      // // Text('ssssssssss'),
                      // // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                      // Text('ssssssssss'),
                    ],
                  )),
                  AnimatedBuilder(
                    animation: _ColorAnimationController,
                    builder: (context, child) => Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                color: _colorTween.value,
                                margin: EdgeInsets.only(),
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).padding.left / 15,
                                  right:
                                      MediaQuery.of(context).padding.right / 10,
                                  top: MediaQuery.of(context).padding.top,
                                  // bottom: 5.h,
                                ),
                                height:
                                    MediaQuery.of(context).size.height / 14 +
                                        MediaQuery.of(context).padding.top,
                                // unutk searcbar na
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: _iconColorTween.value,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Cari masker medis',
                                              border: InputBorder.none,
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Comfortaa'),
                                          ),
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                            height: 20,
                                            width: 25,
                                            child: Image.asset(
                                              'gambar/images/love_icon.png',
                                              color: _iconColorTween1.value,
                                              fit: BoxFit.contain,
                                            )),
                                        //
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        //
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              tampil = !tampil;
                                            });
                                          },
                                          child: Container(
                                              height: 20,
                                              width: 25,
                                              child: Image.asset(
                                                'gambar/images/dll_icon.png',
                                                color: _iconColorTween1.value,
                                                fit: BoxFit.contain,
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                              height: 35,
                              color: Colors.white24,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
