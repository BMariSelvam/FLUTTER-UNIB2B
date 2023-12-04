import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_b2b/Const/assets.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Const/size.dart';

class SupplierPurAnalysisScreen extends StatefulWidget {
  const SupplierPurAnalysisScreen({Key? key}) : super(key: key);

  @override
  State<SupplierPurAnalysisScreen> createState() =>
      _SupplierPurAnalysisScreenState();
}

class _SupplierPurAnalysisScreenState extends State<SupplierPurAnalysisScreen> {
  double pos = 32.40;
  double neg = -12.40;
  double tpPercent = 8.40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightGray,
      appBar: AppBar(
        backgroundColor: MyColors.mainTheme,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
            print("==============================");
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
          ),
        ),
        title: Text(
          "Purchase Analysis",
          style: TextStyle(
            fontFamily: MyFont.myFont,
            color: MyColors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: MyColors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(Assets.customerlogo))),
                ),
                SizedBox(width: width(context) / 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey, Hotcup!",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: MyFont.myFont,
                          color: MyColors.mainTheme),
                    ),
                    Text(
                      "83497UHDFDF99EUH",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: MyFont.myFont,
                          color: MyColors.mainTheme),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TotalsBox(
                  icon: Image.asset(
                    Assets.payment,
                    scale: 2,
                  ),
                  percent: pos,
                  amount: '10,243.00',
                  title: 'Total Payments',
                )),
                Expanded(
                    child: TotalsBox(
                  icon: const Icon(
                    Icons.fact_check_sharp,
                    color: Colors.white,
                    size: 21,
                  ),
                  percent: neg,
                  amount: '23,456',
                  title: 'Total Invoice',
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TotalsBox(
                  icon: Image.asset(
                    Assets.sales,
                    scale: 4.5,
                  ),
                  percent: pos,
                  amount: '1243',
                  title: 'Total Out standing',
                )),
                Expanded(
                    child: TotalsBox(
                  icon: const Icon(
                    Icons.shopping_cart_sharp,
                    color: Colors.white,
                    size: 21,
                  ),
                  percent: neg,
                  amount: '23,456',
                  title: 'Orders',
                )),
              ],
            ),
            const SizedBox(height: 18),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 18, left: 10, right: 10, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: MyColors.mainTheme,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    Assets.shopBag,
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 8,
                              // ),
                              Text(
                                (tpPercent.isNegative)
                                    ? '$tpPercent%'
                                    : '+$tpPercent%',
                                style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontSize: 16,
                                    color: tpPercent.isNegative
                                        ? MyColors.colFF7CA3
                                        : Colors.greenAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              // const SizedBox(
                              //   width: 5,
                              // ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: ColoredBox(
                                  color: tpPercent!.isNegative
                                      ? MyColors.colFF6471
                                      : MyColors.col88E091,
                                  child: Icon(
                                    tpPercent.isNegative
                                        ? Icons.arrow_downward_sharp
                                        : Icons.arrow_upward_sharp,
                                    color: tpPercent.isNegative
                                        ? MyColors.colFF7CA3
                                        : Colors.greenAccent,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '1,234',
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 30,
                                color: MyColors.mainTheme,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Top Products",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 14,
                                color: MyColors.mainTheme,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Profit",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 14,
                                color: MyColors.mainTheme,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$10,000.00',
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 18,
                                color: MyColors.mainTheme,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 35),
                          Text(
                            "Total Product",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 14,
                                color: MyColors.mainTheme,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '5,977',
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 18,
                                color: MyColors.mainTheme,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Purchase",
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontSize: 14,
                              color: MyColors.mainTheme,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$10,000.00',
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontSize: 18,
                              color: MyColors.mainTheme,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 35),
                        Text(
                          "Sold",
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontSize: 14,
                              color: MyColors.mainTheme,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$10,000.00',
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontSize: 18,
                              color: MyColors.mainTheme,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class TotalsBox extends StatelessWidget {
  final Widget? icon;
  final double percent;
  final String? amount;
  final String? title;

  const TotalsBox({
    super.key,
    this.icon,
    required this.percent,
    this.amount,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 18),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: MyColors.mainTheme,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10), child: icon),
                    ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    Text(
                      (percent.isNegative) ? '$percent%' : '+$percent%',
                      style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontSize: 16,
                          color: percent.isNegative
                              ? MyColors.colFF7CA3
                              : Colors.greenAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: ColoredBox(
                        color: percent!.isNegative
                            ? MyColors.colFF6471
                            : MyColors.col88E091,
                        child: Icon(
                          percent!.isNegative
                              ? Icons.arrow_downward_sharp
                              : Icons.arrow_upward_sharp,
                          color: percent!.isNegative
                              ? MyColors.colFF7CA3
                              : Colors.greenAccent,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$$amount',
                  style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontSize: 30,
                      color: MyColors.mainTheme,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "$title",
                  style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontSize: 14,
                      color: MyColors.mainTheme,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )),
    );
  }
}
