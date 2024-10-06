import 'package:flutter/material.dart';
import 'package:flutter_project/Core/Constants/Colors.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  
  @override
  void initState() {
    super.initState();
    _navigateToPage();
  }

  // الانتقال إلى صفحة تسجيل الدخول بعد ثانيتين
  void _navigateToPage() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      GoRouter.of(context).go('/starting');  // استخدم go بدلاً من push
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,  // لون الخلفية لشاشة البداية
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/Animation - 1727792847036.json', width: 140,height: 140),
            Maintext(text: 'SHOP', fontWeight: FontWeight.w600, size: 22, color: Colors.white,),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
