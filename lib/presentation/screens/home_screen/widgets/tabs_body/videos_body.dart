
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_last_app/business_logic/app_cubit/app_cubit.dart';
import 'package:news_last_app/core/local/cash_helper.dart';
import 'package:news_last_app/styles/app_size/app_size_config.dart';
import 'package:news_last_app/styles/color_manager/color_manager.dart';
import 'package:video_player/video_player.dart';

class VideosBody extends StatefulWidget {
  const VideosBody({super.key});

  @override
  State<VideosBody> createState() => _VideosBodyState();
}

class _VideosBodyState extends State<VideosBody> {

  @override
  void initState() {
    super.initState();

    AppCubit.get(context).initialVideo(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {},
        builder:(context, state) {
          var cubit=AppCubit.get(context);
          return Container(
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.height * 0.01,
                              vertical: SizeConfig.height * 0.01,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.height * 0.01,
                            ),
                            height: SizeConfig.height * 0.37,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                /// Admin check
                                CashHelper.getData(key: 'isAdmin') == true ?
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Icon(
                                      Icons.delete_forever,
                                      color: ColorManager.red,
                                      size: SizeConfig.width * 0.09,
                                    ),
                                  ),
                                ):Container(),

                                Text('سبحان الله',style: TextStyle(
                                  fontSize: SizeConfig.height * 0.022,
                                  fontWeight: FontWeight.w500,
                                )),
                                SizedBox(height: SizeConfig.height * 0.01,),
                                Stack(
                                    children: [
                                       cubit.videoController.value.isInitialized
                                          ? AspectRatio(
                                           aspectRatio: cubit.videoController.value.aspectRatio,
                                           child: VideoPlayer(cubit.videoController),
                                         )
                                          : const Center(child: CircularProgressIndicator(
                                         color: ColorManager.primaryColor,
                                       )),
                                      cubit.videoController.value.isInitialized?
                                       Positioned(
                                        left: SizeConfig.height * 0.21,
                                        top: SizeConfig.height * 0.11,
                                        child: IconButton(
                                          onPressed: (){
                                            cubit.videoIsPlay();
                                          },
                                          icon: Icon(
                                              cubit.videoController.value.isPlaying?Icons.pause:Icons.play_arrow
                                          ),
                                        ),
                                      ):Container(),

                                    ]
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return  SizedBox(height: SizeConfig.height * 0.02,);
                        },
                        itemCount: 1
                    ),
                  ]
              ),
            ),
          );
        },
    );
  }
}
