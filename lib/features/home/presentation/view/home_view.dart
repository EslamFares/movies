import 'package:flutter/material.dart';
import 'package:movies/core/utils/app/app_text_styles.dart';
import 'package:movies/core/widgets/share_button.dart';
import 'package:movies/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Movies Club', style: AppTextStyles.font22BlueDarkW900),
        centerTitle: true,
        actions: const [ShareButton(text: 'eslamfares.com/')],
      ),
      body: const HomeViewBody(),
    );
  }
}
