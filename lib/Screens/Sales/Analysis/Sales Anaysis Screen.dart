import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';

class SalesAnalysisScreen extends StatefulWidget {
  const SalesAnalysisScreen({Key? key}) : super(key: key);

  @override
  State<SalesAnalysisScreen> createState() => _SalesAnalysisScreenState();
}

class _SalesAnalysisScreenState extends State<SalesAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: MyColors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Sales Analysis",
          style: TextStyle(fontFamily: MyFont.myFont),
        ),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.search,
              )),
        ],
      ),
      body: SingleChildScrollView(
        //physics:NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: width(context)-20 ,
                height:100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.yellow
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Overview",style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Show:This year",style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontSize: 16
                                ),),
                                PopupMenuButton(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_drop_down_sharp,size: 20,)
                                      ],),
                                  ),
                                  //color: MyColors.white24,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    //side: const BorderSide(width: 2, color: Colors.black54)
                                  ),
                                  //iconSize: 20,
                                  //padding: const EdgeInsets.all(1),
                                  offset: const Offset(0, 30),
                                  itemBuilder: (_) => <PopupMenuEntry>[
                                    // PopupMenuItem(
                                    //     height: 20,
                                    //     child: Column(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       children: [
                                    //         Row(
                                    //             mainAxisAlignment: MainAxisAlignment.start,
                                    //             children: [
                                    //               // Image.asset(IconAssets.editIcon),
                                    //               SizedBox(
                                    //                 width: width(context) / 50,
                                    //               ),
                                    //               Text('Open ',
                                    //                 style: TextStyle(
                                    //
                                    //                     fontSize: 15,
                                    //                     color: MyColors.black),
                                    //               )]),
                                    //       ],
                                    //     )),
                                    // const PopupMenuDivider(),
                                    // PopupMenuItem(
                                    //   height: 20,
                                    //   child: Column(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     mainAxisSize: MainAxisSize.min,
                                    //     children: [
                                    //       Row(
                                    //           mainAxisAlignment: MainAxisAlignment.start,
                                    //           // crossAxisAlignment: CrossAxisAlignment.start,
                                    //           children: [
                                    //             SizedBox(
                                    //               width: width(context) / 50,
                                    //             ),
                                    //
                                    //             const Text(
                                    //               'Pending',
                                    //               style: TextStyle(
                                    //                   fontSize: 15,
                                    //                   color: MyColors.black),
                                    //             ),
                                    //           ]),
                                    //     ],
                                    //   ),
                                    // ),
                                    // const PopupMenuDivider(),
                                    // PopupMenuItem(
                                    //     height: 20,
                                    //     child: Column(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       children: [
                                    //         Row(
                                    //             mainAxisAlignment: MainAxisAlignment.start,
                                    //             children: [
                                    //               // Image.asset(IconAssets.editIcon),
                                    //               SizedBox(
                                    //                 width: width(context) / 50,
                                    //               ),
                                    //               Text('In Progress',
                                    //                 style: TextStyle(
                                    //
                                    //                     fontSize: 15,
                                    //                     color: MyColors.black),
                                    //               )]),
                                    //       ],
                                    //     )),

                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Assets.download)
                                  )
                              ),),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Assets.download)
                                  )
                              ),)],
                        ))
                  ],
                ) ,
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height(context)/5,
                        width: width(context)/2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Order",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("+2.5%^",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      color:Colors.green,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text("\$27658",style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),),
                              SizedBox(height: 10,),
                              Text("Compared to\n(\$20110 last Year)",
                                style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: MyColors.darkGrey
                                ),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height(context)/5,
                        width: width(context)/2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Invoice",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("+0.5%^",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      color:Colors.green,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text("\$20199",style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),),
                              SizedBox(height: 10,),
                              Text("Compared to\n(\$19000 last Year)",
                                style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: MyColors.darkGrey
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height(context)/5,
                        width: width(context)/2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Return",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("-1.5%^",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      color:Colors.red,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text("\$110",style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),),
                              SizedBox(height: 10,),
                              Text("Compared to\n(\$165 last Year)",
                                style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: MyColors.darkGrey
                                ),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height(context)/5,
                        width: width(context)/2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Quatation",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("+0.7%^",style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontSize: 16,
                                      color:Colors.green,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text("\$15658",style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),),
                              SizedBox(height: 10,),
                              Text("Compared to\n(\$12658 last Year)",
                                style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: MyColors.darkGrey
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 350,
                width: width(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Purchase Figures",style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle,color:MyColors.lightBlue,size: 20,),
                              Text("AAAA Purchase",style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontSize: 14
                              ),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle,color:MyColors.lightGreen,size: 20,),
                              Text("BBBB Purchase",style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontSize: 14
                              ),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Linechart(context),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 100,
                width: width(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 20.0,
                        lineWidth: 5.0,
                        percent: 0.8,
                        center: new Icon(
                          Icons.person_pin,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                      SizedBox(width: 5,),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("68%",style: TextStyle(
                              fontSize: 20,
                              //fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold),),
                          Text("Hit Rate this Year",style: TextStyle(
                              color: MyColors.darkGrey
                          ),)
                        ],
                      ),
                      SizedBox(width: 5,),
                      CircularPercentIndicator(
                        radius: 20.0,
                        lineWidth: 5.0,
                        percent: 0.8,
                        center: new Icon(
                          Icons.today_outlined,
                          size: 20.0,
                          color: Colors.green,
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.green,
                      ),
                      SizedBox(width: 5,),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("73%",style: TextStyle(
                              fontSize: 20,
                              //fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold),),
                          Text("Details this Year",style: TextStyle(
                              color: MyColors.darkGrey
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 100,
                width: width(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("10,571",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: MyFont.myFont,
                                  fontSize: 20
                              ),
                              ),
                              SizedBox(width: 10,),
                              Text("1.5% ^",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: MyFont.myFont,
                                  fontSize: 15,
                                  color: Colors.red
                              ),
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("Visitors of the Years",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: MyFont.myFont,
                                color: MyColors.darkGrey),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 400,
                width: width(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Average Total Purchase",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 5.0,
                            percent: 0.5,
                            center: new Text("46%",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 20),),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                          SizedBox(width: 10,),
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 5.0,
                            percent: 0.8,
                            center:  new Text("74%",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 20)),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.green,
                          ),
                          SizedBox(width: 10,),
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 5.0,
                            percent: 0.2,
                            center:  new Text("14%",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 20)),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("92,980",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("Cases",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 14,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text("28,587",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("Applications",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 14,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text("14,002",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("Products",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 14,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 1,
                        width: 310,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.crisis_alert),
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 230,
                            child: Text("Net Purchase, found on the income statement are used to calculate this ration returns and refunds must be backed out of total sales to measure the truly measure the firm’s assets abillity to generate sales.",
                              maxLines:8,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyFont.myFont
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 350,
                width: width(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child:Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text("2017",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 20,fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_sharp)
                        ],
                      ),
                      SizedBox(height: 20,),
                      CircularPercentIndicator(
                        radius: 75.0,
                        lineWidth: 5.0,
                        percent: 0.8,
                        center: new Icon(
                          Icons.today_outlined,
                          size: 20.0,
                          color: Colors.green,
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.green,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle_sharp,color: Colors.blue,size: 15,),
                                  SizedBox(width: 3,),
                                  Text("Amazon",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16),),
                                  SizedBox(width: 3,),
                                  Text("2.1K",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold))
                                ],
                              ),SizedBox(height: 15,),
                              Row(
                                children: [
                                  Icon(Icons.circle_sharp,color: Colors.green,size: 15,),
                                  SizedBox(width: 3,),
                                  Text("Flipcart",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16),),
                                  SizedBox(width: 3,),
                                  Text("1.9K",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle_sharp,color: Colors.blue,size: 15,),
                                  SizedBox(width: 3,),
                                  Text("Alibaba",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16),),
                                  SizedBox(width: 3,),
                                  Text("1K",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold))
                                ],
                              ),SizedBox(height: 15,),
                              Row(
                                children: [
                                  Icon(Icons.circle_sharp,color: Colors.green,size: 15,),
                                  SizedBox(width: 3,),
                                  Text("Shopify",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16),),
                                  SizedBox(width: 3,),
                                  Text("15.7K",style: TextStyle(fontFamily: MyFont.myFont,fontSize: 16,fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: height(context)/1.5,
                width: width(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset(Assets.map,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Top Retail Purchase Location",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("15,879",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 28,
                                fontWeight: FontWeight.w900
                            ),),
                          const SizedBox(width: 10,),
                          Container(
                            height: 20,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Assets.flag)
                                )
                            ),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Top Retail Purchase Location",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Our Most Customer in US",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey
                            ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.circle_sharp,color: Colors.lightBlue,size: 15,),
                                      SizedBox(width: 5,),
                                      Text("Massive",style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),),],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.circle_sharp,color: Colors.lightGreen,size: 15,),
                                      SizedBox(width: 5,),
                                      Text("Large",style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.circle_sharp,color: Colors.orange,size: 15,),
                                      SizedBox(width: 5,),
                                      Text("Medium",style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.circle_sharp,color: MyColors.darkGrey,size: 15,),
                                      SizedBox(width: 5,),
                                      Text("Small",style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(child: Column(
                            children: [
                              Text("15.7k",style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              )),
                              const SizedBox(height: 10,),
                              Text("4.9K",style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              )),
                              const SizedBox(height: 10,),
                              Text("2.4K",style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              )),
                              const SizedBox(height: 10,),
                              Text("980",style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ))
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: height(context)/3,
                width: width(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("New Customers",
                              style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              )),
                        ],
                      ),
                      SubCategoryList(),
                      Container(
                        height: 2,
                        width: width(context),
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 15,),
                      Text("VIEW MORE CUSTOMER",
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget Linechart(BuildContext context) {
    return Container(
      height: 200,
      width: width(context),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 1),
                FlSpot(2, 4),
                FlSpot(3, 2),
                FlSpot(4, 5),
                FlSpot(5, 1),
                FlSpot(6, 4),
              ],
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 4),
                FlSpot(4, 1),
                FlSpot(5, 5),
                FlSpot(6, 3),
              ],
              isCurved: true,
              color: Colors.red,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
  SubCategoryList() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: newcustomerListContent.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTapDown:  (position) {
                },
                child:ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(Assets.pp), // Replace with your image path
                  ),
                  title: Text(newcustomerListContent[index].name,
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),), // Replace with your name
                  subtitle: Text(newcustomerListContent[index].id,
                    style: TextStyle(
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey
                    ),), // Replace with additional information if needed
                  trailing: Icon(Icons.mail_outline), // Replace with your desired icon
                  onTap: () {
                    // Add your onTap logic here
                  },
                )
            );
          }),
    );
  }

  ///ListDetailForProductList
  List<newcustomerlist> newcustomerListContent = [
    newcustomerlist(
        name: 'Pushparaj',
        image: Assets.productBanner,
        id: 'CUSTOMER ID#00221'),
    newcustomerlist(
        name: 'Pushparaj 01',
        image: Assets.productBanner,
        id: 'CUSTOMER ID#00221'),

  ];

}
