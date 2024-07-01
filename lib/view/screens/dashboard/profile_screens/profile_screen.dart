import 'package:enuaniculturalforummobile/model/local/dummy_data.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/models.dart';
import 'package:enuaniculturalforummobile/utils/alerts.dart';
import 'package:enuaniculturalforummobile/utils/enums.dart';
import 'package:enuaniculturalforummobile/utils/navigators.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';
import 'package:enuaniculturalforummobile/view/components/image_view.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/login_screen.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rebirth/rebirth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isLogOutLoading = false;

  @override
  Widget build(BuildContext context) {
    var postProvider = ref.watch(postViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                GestureDetector(
                  onTap: (){

                    // postProvider.getAllPosts(context);
                    postProvider.getAllCategories(context);
                  },
                  child:  UserAccountDetails(
                    name: DummyData.username,
                    profilePicture: null,
                    emailAddress: DummyData.emailAddress.toString(),
                    // phoneNumber: '070 1234 5678',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                settingSection(),
                SizedBox(
                  height: 20.h,
                ),
                DummyData.accessToken!=null? moreSection(): DefaultButtonMain(text: login, onPressed: (){
                  navigatePush(context, LoginScreen());
                },),
                SizedBox(height: 16.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget settingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextView(
          text: settingsText,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              singleProfileOptions(
                title: userDetailsText,
                iconPath: AppImages.userDetailsIcon,
                onTap: () {},
              ),
              divider(),
              // singleProfileOptions(
              //   title: beneficiariesText,
              //   iconPath: AppImages.beneficiariesIcon,
              //   onTap: () {},
              // ),
              // divider(),
              singleProfileOptions(
                title: changePasswordText,
                iconPath: AppImages.lockIcon,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget moreSection() {
    var themeProvider = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // singleProfileOptions(
              //   title: referralsText,
              //   iconPath: AppImages.referralsIcon,
              //   onTap: () {},
              // ),
              // divider(),
              // singleProfileOptions(
              //   title: inviteAFriendText,
              //   iconPath: AppImages.personAddIcon,
              //   onTap: () {},
              // ),
              // divider(),
              // singleProfileOptions(
              //   title: customerSupportText,
              //   iconPath: AppImages.phoneIcon,
              //   onTap: () {},
              // ),
              // divider(),
              // singleProfileOptions(
              //   title: appDetailsText,
              //   iconPath: AppImages.appDetailsIcon,
              //   onTap: () {},
              // ),
              // divider(),
              // singleProfileOptions(
              //   title: visitOurWebsiteText,
              //   iconPath: AppImages.globeIcon,
              //   onTap: () {},
              // ),
              // divider(),
               isLogOutLoading
                  ? const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimary1,

                    ),
                  ))
                  : singleProfileOptions(
                title: logoutText,
                iconPath: AppImages.logoutIcon,
                textColor: AppColors.kLogOutPrimary,
                onTap: () async {
                  displayLogoutDialog(context,
                      theme: theme,
                      themeMode: themeProvider, onTap: () async {
                        navigateBack(context);
                        setState(() {
                          isLogOutLoading = true;
                        });
                        try {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          await prefs.remove('Email');
                          await prefs.remove('Password');
                          await prefs.remove('accessToken');
                          DummyData.firstName = '';
                          DummyData.lastName = '';
                          DummyData.username = '';
                          await Future.delayed(const Duration(seconds: 2));
                          WidgetRebirth.createRebirth(context: context);


                        } catch (e) {
                          setState(() {
                            isLogOutLoading = false;
                          });
                        }
                      });


                  // await Navigator.of(context).pushAndRemoveUntil(
                  //   // the new route
                  //   MaterialPageRoute(
                  //       builder: (BuildContext context) => const  LoginScreen()
                  //   ),
                  //       (Route route) => false,
                  // );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget singleProfileOptions(
      {required String title,
      required VoidCallback onTap,
      Color? textColor,
      required String iconPath}) {
    // var paymentProvider = ref.watch(paymentViewModel);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageView.svg(iconPath),
                SizedBox(
                  width: 14.5.w,
                ),
                TextView(
                  text: title,
                  fontWeight: FontWeight.w400,
                  color: textColor ?? Theme.of(context).colorScheme.primary,
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
            )
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BunchPayDivider(),
    );
  }
}

class UserAccountDetails extends ConsumerWidget {
  const UserAccountDetails(
      {super.key,
      required this.name,
      required this.emailAddress,
      // required this.phoneNumber,
      required this.profilePicture});

  final String name;
  final String emailAddress;
  // final String phoneNumber;
  final String? profilePicture;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   radius: 24.r,
          //   backgroundImage: NetworkImage(profilePicture),
          // ),
          // ProfileImage(
          //   imageType: ProfileImageType.user,
          //   imageUrl: profilePicture,
          // ),
          ImageView.asset(AppImages.logo, width: 50.w,),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                text: DummyData.accessToken ==null ?'EnuaniCulturalForum':name,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,

              ),
              SizedBox(
                height: 4.h,
              ),
              TextView(
                text: DummyData.emailAddress == null?'':emailAddress,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlack4.withOpacity(0.4),

              ),
              // SizedBox(
              //   height: 4.h,
              // ),
              // TextView(
              //   text: phoneNumber,
              //   fontSize: 12.sp,
              //   fontWeight: FontWeight.w400,
              //   color: AppColors.kBlack4.withOpacity(0.4),
              //
              // ),
            ],
          )
        ],
      ),
    );
  }
}
