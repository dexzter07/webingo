import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webingo/constants/app_constants.dart';
import 'package:webingo/constants/app_container.dart';
import 'package:webingo/styles/custom_text_style.dart';
import 'package:get/get.dart';
import 'package:webingo/views/description_page.dart';
import '../styles/app_colors.dart';
import 'auth/sign_in.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryButtonColor,
      appBar: AppBar(
        title: const Text("Webingo"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryButtonColor,
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(const Login());
            },
            child: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: ContainerDecor.borderRadius1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(() => DescriptionPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2.0,
                          ),]
                      ),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset("assets/images/parcel.jpg",
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,

                            ),
                          ),
                          const SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Arrange Delivery", style: CustomTextStyle.boldMediumTextStyle(color: AppColors.secondaryColor),),
                                Text("Delivery of anything, anytime",
                                  style: CustomTextStyle.smallTextStyle1(color: AppColors.secondaryColor),
                                ),
                            Text("& anywhere",
                              style: CustomTextStyle.smallTextStyle1(color: AppColors.secondaryColor),)
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_sharp)
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Image.asset("assets/images/A2.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          )),

        ],
      ),
    );
  }
}
