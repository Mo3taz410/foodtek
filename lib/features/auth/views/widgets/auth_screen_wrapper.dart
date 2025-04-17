import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/constants/app_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';

class AuthScreenWrapper extends StatelessWidget {
  final Widget child;

  const AuthScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppImageStrings.backgroundPattern,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(context, 24),
                  ),
                  child: Text(
                    AppStrings.logo,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 43.5),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context, 24),
                            vertical: responsiveHeight(context, 24),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
