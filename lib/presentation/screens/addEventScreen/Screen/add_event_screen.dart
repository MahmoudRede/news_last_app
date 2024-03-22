import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_cubit.dart';
import 'package:news_last_app/business_logic/eventsCubit/events_states.dart';
import 'package:news_last_app/presentation/widgets/default_button.dart';
import 'package:news_last_app/presentation/widgets/default_text_field.dart';
import '../../../../../generated/assets.dart';
import '../../../../../styles/app_size/app_size_config.dart';
import '../../../../../styles/color_manager/color_manager.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => EventsCubit(),
      child: BlocConsumer<EventsCubit, EventsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = EventsCubit.get(context);
          return ModalProgressHUD(
            inAsyncCall: (state is UploadEventsImageLoadingState || state is AddEventsLoadingState)?true:false,
            progressIndicator:const Center(child: CircularProgressIndicator(),),
            child: Scaffold(
              appBar: AppBar(),
            
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.height * 0.02),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
            
                        /// event title
                        Align(
                          alignment: Alignment.topRight,
                          child: Text('عنوان المناسبة',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        DefaultTextField(
                            controller: titleController,
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
            
            
                        /// event image
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('اضافة  صورة',
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: SizeConfig.height * 0.025,
                                  color: ColorManager.primaryColor)),
                        ),
            
                        SizedBox(height: SizeConfig.height * 0.01),
                        if (cubit.eventImage != null)
                          Card(
                            elevation: 10,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.only(
                              bottom: 10.0,
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Image(
                                  image: FileImage(cubit.eventImage!),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey.withOpacity(0.3),
                                    radius: 18,
                                    child: IconButton(
                                        splashRadius: 30.0,
                                        onPressed: () {
                                          cubit.removeImage();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 18.0,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (cubit.eventImage == null)
                          GestureDetector(
                            onTap: () {
                              cubit.pickImage();
                            },
                            child: Container(
                              width: SizeConfig.width,
                              height: SizeConfig.height * 0.3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.primaryColor,
                                  width: 1,
                                  style: BorderStyle.values[1],
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(
                                child: Image.asset(
                                  Assets.uploadImage,
                                  width: SizeConfig.width * 0.8,
                                  height: SizeConfig.height * 0.1,
                                ),
                              ),
                            ),
                          ),
            
            
                        SizedBox(height: SizeConfig.height * 0.05,),
            
            
                        /// upload event button
                        defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (cubit.eventImage == null) {
                                  cubit.addEventPost(title: titleController.text,);
                                } else {
                                  cubit.uploadEventImage(title: titleController.text);
                                }
                              }
                            },
                            backGroundColor: ColorManager.primaryColor,
                            height: SizeConfig.height * 0.055,
                            width: double.infinity,
                            content: const Text(
                              'نشر المناسبة',
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
