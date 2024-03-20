import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/presentation/screens/dawina_screen/widgets/add_dawina_item.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';

class AddDawina extends StatelessWidget {
   AddDawina({super.key});

  static  TextEditingController nameController = TextEditingController();
  static  TextEditingController addressController = TextEditingController();
  static  TextEditingController daysController = TextEditingController();
  static  TextEditingController phoneController = TextEditingController();
  static  TextEditingController locationController = TextEditingController();
   var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {

        },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
         return Scaffold(
          appBar: AppBar(
            title: Text('اضافه دوانيه',style: TextStyle(
              fontSize: SizeConfig.height * 0.025,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
            ),),
          ),

          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.04,
                vertical: SizeConfig.height * 0.02
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(

                    children: [

                      /// اسم الدوانيه

                      AddDawinaItem(
                          itemName: 'اسم الدوانيه',
                          validator: 'ادخل اسم الدوانيه',
                          hintText: ' اكتب اسم الدوانيه هنا',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onTap: () {},
                          controller: nameController
                      ),

                      SizedBox(height: SizeConfig.height*0.02,),

                      /// اسم المنطقه
                      AddDawinaItem(
                          itemName: 'اسم المنطقه',
                          validator: 'ادخل اسم المنطقه',
                          hintText: ' اكتب اسم المنطقه هنا',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onTap: () {},
                          controller: addressController
                      ),

                      SizedBox(height: SizeConfig.height*0.02,),

                      /// الاياام
                      AddDawinaItem(
                          maxLines: 3,
                          itemName: 'الاياام',
                          validator: 'ادخل الاياام',
                          hintText: ' اكتب الاياام هنا',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onTap: () {},
                          controller: daysController
                      ),

                      SizedBox(height: SizeConfig.height*0.02,),

                      /// الموبيل
                      AddDawinaItem(
                          itemName: 'رقم هاتف صاحب الدوانيه',
                          validator: 'ادخل رقم الهاتف ',
                          hintText: ' اكتب رقم الهاتف هنا',
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          onTap: () {},
                          controller: phoneController
                      ),

                      SizedBox(height: SizeConfig.height*0.02,),


                      /// اللوكشن
                      AddDawinaItem(
                          itemName: 'اللوكشن',
                          validator: 'ادخل اللوكشن ',
                          hintText: ' اكتب اللوكشن هنا',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onTap: () {},
                          controller: locationController
                      ),

                      SizedBox(height: SizeConfig.height*0.03,),

                      state is UploadDawinaLoadingState ?
                      const CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                      ):
                      defaultButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              cubit.addDawina(
                                  itemName: nameController.text,
                                  address: addressController.text,
                                  days: daysController.text,
                                  phone: phoneController.text,
                                  location: locationController.text
                              );
                            }
                          },
                          backGroundColor: ColorManager.primaryColor,
                          height: SizeConfig.height*0.06,
                          width: double.infinity,
                          content: Text('اضافه',style: TextStyle(
                              color: ColorManager.white,
                              fontSize: SizeConfig.headline3Size
                          ),)
                      ),

                    ]
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
