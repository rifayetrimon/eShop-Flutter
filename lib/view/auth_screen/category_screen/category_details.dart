import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/consts/consts.dart';
import 'package:market/services/firebase_services.dart';
import 'package:market/view/auth_screen/category_screen/item_detils.dart';
import 'package:market/widget_common/bg_widget.dart';
import 'package:market/controller/product_controller.dart';
import 'package:market/widget_common/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title: title!.text.white.fontFamily(bold).make(),
            ),
            body: StreamBuilder(
                stream: FirestoreServices.getProducts(title),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: loadingIndicator(),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child:
                          "No products found!".text.color(darkFontGrey).make(),
                    );
                  } else {
                    var data = snapshot.data!.docs;

                    return Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(

                                  // NOT WORKING
                                  5,
                                  (index) => "Baby shop"

                                      // controller.subcat.length,
                                      // (index) => "${controller.subcat[index]}"
                                      .text
                                      .size(12)
                                      .fontFamily(semibold)
                                      .color(fontGrey)
                                      .makeCentered()
                                      .box
                                      .white
                                      .roundedSM
                                      .size(120, 60)
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .make()),
                            ),
                          ),

                          20.heightBox,

                          // item container
                          Expanded(
                              child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: 250,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP5,
                                          height: 150,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        "Bag Leather"
                                            .text
                                            .fontFamily(semibold)
                                            .color(fontGrey)
                                            .make(),
                                        10.heightBox,
                                        "\$600"
                                            .text
                                            .color(redColor)
                                            .fontFamily(bold)
                                            .make()
                                      ],
                                    )
                                        .box
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 5))
                                        .white
                                        .roundedSM
                                        .outerShadowSm
                                        .padding(const EdgeInsets.all(12))
                                        .make()
                                        .onTap(() {
                                      Get.to(() =>
                                          ItemDetails(title: "Dummy Item"));
                                    });
                                  }))
                        ],
                      ),
                    );
                  }
                })));
  }
}
