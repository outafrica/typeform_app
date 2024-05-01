// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/app_colors.dart';
import 'package:typeform_app/core/platform/size_config.dart';
import 'tap_outside_unfocus.dart';

class PageMargin extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool resizeToAvoidBottomInset;
  final bool showBottomNav;
  final ValueChanged<int>? onNavItemTap;
  final int selectedIndex;
  final Color? backgroundColor;
  final Color? backgroundOverlayColor;
  final bool colorBlack;
  final Widget? floatingButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;

  const PageMargin({
    Key? key,
    required this.child,
    this.scaffoldKey,
    this.padding,
    this.resizeToAvoidBottomInset = true,
    this.showBottomNav = false,
    this.onNavItemTap,
    this.floatingButton,
    this.colorBlack = false,
    this.selectedIndex = -1,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.appBar,
    this.backgroundOverlayColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    if (showBottomNav && selectedIndex == -1) {
      throw Exception("selectedIndex cannot be null when showing bottom nav");
    }
    if (showBottomNav && onNavItemTap == null) {
      throw Exception("onNavItemTap cannot be null when showing bottom nav");
    }

    return TapOutSideUnfocus(
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor:
            backgroundOverlayColor ?? backgroundColor ?? AppColors.primaryBlue,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: showBottomNav
            ? BottomNavigationBar(
                backgroundColor: AppColors.deepBlue,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: AppColors.fadedBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.only(
                        bottom: _sc.heightScaledSize(7)!,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: _sc.heightScaledSize(30)!,
                        vertical: _sc.heightScaledSize(7)!,
                      ),
                      child: Icon(
                        Icons.home,
                        size: 20.0.sp,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      // height: _sc.heightScaledSize(60),
                      // width: _sc.heightScaledSize(90),
                      padding: EdgeInsets.all(_sc.heightScaledSize(16)!),
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send,
                        size: 20.0.sp,
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 20.sp,
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: selectedIndex,
                selectedItemColor: Colors.white,
                onTap: onNavItemTap,
                unselectedItemColor: AppColors.silver,
              )
            : null,
        body: SafeArea(
          child: Padding(
            padding: padding ??
                EdgeInsets.only(
                  left: _sc.heightScaledSize(20)!,
                  right: _sc.heightScaledSize(20)!,
                  top: _sc.heightScaledSize(20)!,
                ),
            child: Container(
              color: backgroundColor ?? AppColors.primaryBlue,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
