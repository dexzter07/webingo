import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:webingo/controller/place_order_controller.dart';
import 'package:webingo/styles/custom_text_style.dart';
import 'package:get/get.dart';
import 'package:webingo/views/custom_info.dart';
import '../constants/app_constants.dart';
import '../constants/app_container.dart';
import '../styles/app_colors.dart';
import '../widgets/custom_button.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final PlaceOrderController _placeOrderController = Get.put(PlaceOrderController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryButtonColor,
      appBar: AppBar(
        title: const Text("Place Order"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryButtonColor,

      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: ContainerDecor.borderRadius1),
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2.0,
                          ),]
                      ),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Set dimensions",style: CustomTextStyle.boldMediumTextStyle(color: AppColors.secondaryColor),),
                          Text("Fill in required dimension info",style: CustomTextStyle.smallTextStyle1(color: AppColors.disableButtonColor),),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _placeOrderController.length,
                                  validator: RequiredValidator(errorText: 'Empty'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixText: 'Cm',
                                    floatingLabelBehavior:FloatingLabelBehavior.always,
                                    floatingLabelStyle: CustomTextStyle.smallTextStyle1(color: AppColors.primaryButtonColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: AppColors.disableButtonColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: AppColors.primaryButtonColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                    ),
                                    labelText: 'Length',
                                  ),
                                  textAlign: TextAlign.center,
                                  enabled: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("X",style: CustomTextStyle.bigTextStyle(color: AppColors.disableButtonColor),),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _placeOrderController.width,
                                  validator: RequiredValidator(errorText: 'Empty'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixText: 'Cm',
                                    floatingLabelBehavior:FloatingLabelBehavior.always,
                                    floatingLabelStyle: CustomTextStyle.smallTextStyle1(color: AppColors.primaryButtonColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: AppColors.disableButtonColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: AppColors.primaryButtonColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                    ),
                                    labelText: 'Width',
                                  ),
                                  textAlign: TextAlign.center,
                                  enabled: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("X",style: CustomTextStyle.bigTextStyle(color: AppColors.disableButtonColor),),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _placeOrderController.height,
                                  validator: RequiredValidator(errorText: 'Empty'),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixText: 'Cm',
                                    floatingLabelBehavior:FloatingLabelBehavior.always,
                                    floatingLabelStyle: CustomTextStyle.smallTextStyle1(color: AppColors.primaryButtonColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: AppColors.disableButtonColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: AppColors.primaryButtonColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(width: 1, color: Colors.red),
                                    ),
                                    labelText: 'Height',
                                  ),
                                  textAlign: TextAlign.center,
                                  enabled: true,



                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),

                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2.0,
                          ),]
                      ),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Set weight",style: CustomTextStyle.boldMediumTextStyle(color: AppColors.secondaryColor),),
                          Text("Fill in required weight info",style: CustomTextStyle.smallTextStyle1(color: AppColors.disableButtonColor),),
                          const SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                               Icon(Icons.info_outline, color: Colors.grey[500],),
                               const SizedBox(width: 10,),
                               Expanded(
                                 child: Text("After saving this info will be applied to all selected parcels.",
                                   style: CustomTextStyle.mediumTextStyle(color: AppColors.disableButtonColor),
                                 ),
                               )
                              ],
                            ),
                          ),
                          const SizedBox(height: 30,),
                          TextFormField(
                            controller: _placeOrderController.weight,
                            validator: RequiredValidator(errorText: 'Empty'),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixText: 'Kg',
                              floatingLabelBehavior:FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(width: 1, color: AppColors.disableButtonColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(width: 1, color: AppColors.primaryButtonColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(width: 1, color: Colors.red),
                              ),
                              labelText: 'Weight',
                            ),
                          ),
                          const SizedBox(height: 10,),



                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.1),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: MaterialButton(
                        onPressed: (){
                              if(_formKey.currentState!.validate()) {
                                Get.to(() => CustomInfo());
                              }
                        },
                        color: AppColors.primaryButtonColor,
                        minWidth: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Continue",style: CustomTextStyle.boldMediumTextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
