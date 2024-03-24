import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/data/models/dawina_model.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';
import 'package:svg_flutter/svg.dart';

class DawinaItem extends StatelessWidget {
  const DawinaItem({super.key,required this.dawinaModel});

  final DawinaModel dawinaModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin:  EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.01
        ),
        child: Material(
          elevation: SizeConfig.height * 0.015,
          borderRadius:  BorderRadius.circular(20),
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    /// Admin check
                    CashHelper.getData(key: 'isAdmin') == true ?
                     Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: (){
                          AppCubit.get(context).deleteDawina(dawinaId: dawinaModel.uId!);
                        },
                        child: Icon(
                          Icons.delete_forever,
                          color: ColorManager.red,
                          size: SizeConfig.width * 0.09,
                        ),
                      ),
                    ):Container(),

                    /// اسم الدوانيه
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'اسم الدوانيه : ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.height*0.01,
                        ),
                        Expanded(
                          child: Text(
                            dawinaModel.itemName!,
                            textAlign: TextAlign.start,
                            style:   TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.headline3Size,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.height*0.02,),

                    /// اسم المنطقه
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'اسم المنطقه : ',
                          textAlign: TextAlign.start,
                          style:   TextStyle(
                              color:ColorManager.primaryColor,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.height*0.01,
                        ),
                        Expanded(
                          child: Text(
                            dawinaModel.address!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.headline3Size,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.height*0.02,),

                    /// الاياام
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'الاياام : ',
                          textAlign: TextAlign.start,
                          style:TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(width: SizeConfig.height*0.01,),

                        Expanded(
                          child: Text(
                            dawinaModel.days!,
                            textAlign: TextAlign.start,
                            style:TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.headline3Size,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.height*0.02,),

                    /// الموبيل
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'رقم هاتف صاحب الدوانيه : ',
                          textAlign: TextAlign.start,
                          style:   TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.height*0.01,
                        ),
                        Expanded(
                          child: Text(
                            dawinaModel.phone!,
                            textAlign: TextAlign.start,
                            style:TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.headline3Size,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.height*0.02,),

                    /// اللوكشن
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'اللوكشن : ',
                          textAlign: TextAlign.start,
                          style:TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: SizeConfig.headline4Size,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(width: SizeConfig.height*0.01,),

                        Expanded(
                          child: Text(
                            dawinaModel.location!,
                            textAlign: TextAlign.start,
                            style:TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: SizeConfig.headline5Size,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),


                  ],
                ),

                SizedBox(height: SizeConfig.height*0.02,),

                const Divider(height: 2,color: ColorManager.primaryColor ,),

                SizedBox(height: SizeConfig.height*0.02,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorManager.primaryColor,
                        child: Icon(
                            Icons.comment,
                            color: Colors.white,
                            size: SizeConfig.height*0.024,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorManager.primaryColor,
                        child: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: SizeConfig.height*0.024,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
