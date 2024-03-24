import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_cubit.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import '../../../../../styles/app_size/app_size_config.dart';
import '../../../../../styles/color_manager/color_manager.dart';

class AddDeathScreen extends StatelessWidget {
  const AddDeathScreen({super.key});

  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => EventsCubit(),
      child: BlocConsumer<EventsCubit, EventsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = EventsCubit.get(context);
          return ModalProgressHUD(
            inAsyncCall: state is AddDeathEventLoadingState?true:false,
            progressIndicator:const Center(child: CircularProgressIndicator(),),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "أضافة وفاة",
                  style: TextStyle(
                    fontSize: SizeConfig.headline3Size,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.white,
                  ),
                ),
                centerTitle: true,
              ),

              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.height * 0.02),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [

                        /// person name
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('أسم الشخص',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathPersonNameController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),

                        /// person age
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('العمر',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathPersonAgeController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),


                        /// location
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('مكان الدفن',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathLocationController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),


                        /// date
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('تاريخ الدفن',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        InkWell(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: cubit.selectedDate,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2101),
                            ).then((value) {
                              cubit.selectDate(value!);
                            });

                          },
                          child: DefaultTextField(
                              controller: cubit.deathDateController,
                              hintText: '',
                              validator: (validator) {
                                if (validator!.trim() == '') {
                                  return '!!';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onTap: () {},
                              enable: false,
                          ),
                        ),
                        SizedBox(height: SizeConfig.height * 0.03,),


                        /// time
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('موعد الدفن و المكان',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathTimeAndLocationController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),


                        /// مكان عزاء الرجال
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('مكان عزاء الرجال',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathMenLocationController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),


                        /// رقم تواصل للرجال
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('رقم تواصل للرجال',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathMenPhoneController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),

                        /// مكان عزاء النساء
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('مكان عزاء النساء',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathWomenLocationController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onTap: () {}),
                        SizedBox(height: SizeConfig.height * 0.03,),


                        /// رقم تواصل للنساء
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('رقم تواصل للنساء',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: cubit.deathWomenPhoneController,
                            hintText: '',
                            validator: (validator) {
                              if (validator!.trim() == '') {
                                return '!!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            onTap: () {}
                        ),


                        SizedBox(height: SizeConfig.height * 0.05,),


                        /// upload event button
                        defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.addDeathEvent();
                              }
                            },
                            backGroundColor: ColorManager.primaryColor,
                            height: SizeConfig.height * 0.055,
                            width: double.infinity,
                            content: const Text(
                              'نشر الوفاه',
                              style: TextStyle(color: Colors.white),
                            )
                        ),


                      ],
                    ),
                  ),
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}
