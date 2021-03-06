import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_x/base/base_appbar_page.dart';
import 'package:flutter_x/utils/route_utils.dart';

class SwiperCustomLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SwiperViewDefaultScalPageState();
  }
}

class SwiperViewDefaultScalPageState
    extends BaseAppBarPageState<StatefulWidget> {
  @override
  String buildInitState() {
    buildBackBar("轮播图", backIcon: Icons.arrow_back_ios);
    return null;
  }

  @override
  Widget buildWidget(BuildContext context) {
    print("build --");
    return new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
        ),
        buildStyle1(),

        Padding(
          padding: EdgeInsets.all(30),
        ),
        //LinearProgressIndicator不具备设置高度的选项，可以使用SizedBox来设置高度与宽度
      ],
    );
  }

  Widget buildStyle1() {
    return Container(
      color: Colors.grey,
      height: 300.0,
      child: new Swiper(
        // 横向
        scrollDirection: Axis.horizontal,
        // 布局构建
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          );
        },
        //条目个数
        itemCount: 6,
        // 自动翻页
        autoplay: true,
        // 分页指示
        pagination: buildPlugin(),
        //点击事件
        onTap: (index) {
          print(" 点击 " + index.toString());
        },
        // 用户进行操作时停止自动翻页
        autoplayDisableOnInteraction: true,
        // 无线轮播
        loop: true,
        //缩放
        scale: 0.85,
        // 当前视窗展示比例 小于1可见上一个和下一个视窗
        viewportFraction: 0.8,
        customLayoutOption: buildCustomLayout(),
        // 布局方式
        layout: SwiperLayout.CUSTOM,
        itemWidth: 300.0,
        itemHeight: 200.0,
      ),
    );
  }

  buildPlugin() {
    return SwiperPagination();
  }

  buildCustomLayout() {
    CustomLayoutOption layoutOption =
        new CustomLayoutOption(startIndex: -1, stateCount: 3)
            .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
      new Offset(-370.0, -40.0),
      new Offset(0.0, 0.0),
      new Offset(370.0, -40.0)
    ]);
    return layoutOption;
  }
}
