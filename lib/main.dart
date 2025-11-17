import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/routing/app_router.dart';

void main() {
  runApp(LodgiTech(appRouter: AppRouter()));
}

class LodgiTech extends StatelessWidget {
  final AppRouter appRouter;
  const LodgiTech({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: AppRoutes.dashboard,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
