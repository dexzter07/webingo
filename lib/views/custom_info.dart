import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webingo/controller/place_order_controller.dart';
import 'package:webingo/views/success.dart';
import '../constants/app_constants.dart';
import '../constants/app_container.dart';
import '../database_manager/database_manager.dart';
import '../styles/app_colors.dart';
import '../styles/custom_text_style.dart';
import '../widgets/custom_button.dart';
import 'package:intl/intl.dart';


class CustomInfo extends StatefulWidget {
  const CustomInfo({Key? key}) : super(key: key);

  @override
  State<CustomInfo> createState() => _CustomInfoState();
}

class _CustomInfoState extends State<CustomInfo> {
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String tdata = DateFormat("hh:mm:ss a").format(DateTime.now());
  final PlaceOrderController _placeOrderController = Get.put(PlaceOrderController());
  final _formKey = GlobalKey<FormState>();
  var vatStatusList = [
    "VAT Registered Business",
    "Unregistered Business"
  ];

  var reasonList = [
    "Gift",
    "Self"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryButtonColor,
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryButtonColor,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: ContainerDecor.borderRadius1),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.screenHorizontalPadding,
                    vertical: AppConstants.screenVerticalPadding),
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
                          Text("Set Custom Info",style: CustomTextStyle.boldMediumTextStyle(color: AppColors.secondaryColor),),
                          const SizedBox(height: 7,),
                          Text("Fill in required custom info",style: CustomTextStyle.smallTextStyle1(color: AppColors.disableButtonColor),),
                          const SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[50],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.info_outline, color: Colors.orange[400],),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Text("Some HS code are missing for international parcels that have multiple items. After saving this info will be applied to all selected parcels that are international with one item.",
                                    style: CustomTextStyle.ultraSmallTextStyle(color: Colors.orange.shade400,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 30,),
                      DropdownButtonFormField(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: vatStatusList.map((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  Text(value),
                                ],
                              )
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            newValue;
                            _placeOrderController.vatStatus.value = newValue.toString();
                          });
                        },

                        decoration: InputDecoration(
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
                          labelText: 'VAT Status',
                        ),
                      ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: _placeOrderController.vatNumber,
                            validator: RequiredValidator(errorText: 'VAT Number cannot be empty'),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
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
                              labelText: 'VAT Number',
                            ),
                          ),
                          const SizedBox(height: 15,),
                          const Divider(),
                          const SizedBox(height: 15,),
                          DropdownButtonFormField(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: reasonList.map((String reason) {
                              return DropdownMenuItem(
                                  value: reason,
                                  child: Row(
                                    children: <Widget>[
                                      Text(reason),
                                    ],
                                  )
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                newValue;
                                _placeOrderController.reason.value = newValue.toString();
                              });
                            },

                            decoration: InputDecoration(
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
                              labelText: 'Reason for sending parcel',
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: _placeOrderController.hsCode,
                            validator: RequiredValidator(errorText: 'HS Code cannot be empty'),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.info_outline,color: AppColors.primaryButtonColor,),
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
                              labelText: 'HS Code',
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Suggested code",style: CustomTextStyle.smallTextStyle1(color: AppColors.disableButtonColor),),
                              Container(
                                padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.purple[100],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Text("123456789",style: CustomTextStyle.smallBoldTextStyle1(color: AppColors.primaryColor),)),
                              const Spacer(),
                              Text("Learn More",style: CustomTextStyle.smallBoldTextStyle1(color: AppColors.primaryColor),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Divider(),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(onPressed: (){},
                                  child: Text("Cancel",style: CustomTextStyle.smallBoldTextStyle1(color: AppColors.secondaryColor),)),
                              const SizedBox(width: 20,),
                              CustomButton(
                                  borderRadius: BorderRadius.circular(15),
                                  title: "Save", color: AppColors.primaryButtonColor,
                                  onTap: ()async{
                                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                    var uid = sharedPreferences.getString("uid");
                                    print(uid);
                                      if(_formKey.currentState!.validate()) {
                                        await DatabaseManager().createOrderData(
                                          _placeOrderController.length.text,
                                          _placeOrderController.width.text,
                                          _placeOrderController.height.text,
                                          _placeOrderController.weight.text,
                                          _placeOrderController.vatStatus.value,
                                          _placeOrderController.vatNumber.text,
                                          _placeOrderController.reason.value,
                                          _placeOrderController.hsCode.text,
                                          cdate,
                                          tdata,
                                          uid.toString()
                                            );
                                        Get.to(() => SuccessPage());
                                      }
                                  }),
                            ],
                          ),


                        ],
                      ),
                    ),
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
