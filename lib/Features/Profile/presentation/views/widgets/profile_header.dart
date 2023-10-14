import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_app/Core/utils/icon_broken.dart';
import 'package:social_app/Core/utils/my_colors.dart';
import 'package:social_app/Core/widgets/custom_loading_widget.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/functions/show_snack_bar.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../manager/profile_cubit/profile_cubit.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutLoadingState) {
          isLoading = true;
        } else if (state is LogoutSuccessState) {
          isLoading = false;
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        } else if (state is LogoutFailureState) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LogoutLoadingState) {
          return const CustomLoadingWidget();
        }
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  ctx: context,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(user.name!, style: Styles.textStyle20),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        profileBottomSheet(context);
                      },
                      icon: const Icon(IconBroken.More_Circle),
                    ),
                    const SizedBox(width: 10)
                  ],
                  isBack: false,
                ),
                SizedBox(
                  height: 280,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 230,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(user.cover!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(user.image!),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> profileBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      showDragHandle: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  GoRouter.of(context).pop();
                  GoRouter.of(context).push(AppRouter.kSavedPostsView);
                },
                title: const Text('Saved Posts'),
                leading: const Icon(IconBroken.Bookmark),
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<ProfileCubit>(context).logoutUser();
                },
                title: Text(
                  'Logout',
                  style: Styles.textStyle14.copyWith(color: MyColors.myRed),
                ),
                leading: const Icon(IconBroken.Logout, color: MyColors.myRed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
