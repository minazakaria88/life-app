import 'package:flutter/material.dart';
import 'package:life/constant.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/core/widgets/logo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/helpers/notification_services.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(
                color: Colors.white, size: 30, grade: 60, weight: 50),
            expandedHeight: MediaQuery.of(context).size.width / 1.1,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              title: Text(
                S.of(context).about_us,
                style: const TextStyle(
                  color: Colors.yellowAccent,
                ),
              ),
              background: Image.asset(
                Assets.imagesMainNurse,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
                children: [
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              const LogoImage(),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(privacyPolicyLink));
                    },
                    child: Text(S.of(context).privacy_policy),
                  ),
                  TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(termsAndConditionsLink));
                    },
                    child: Text(S.of(context).terms_and_conditions),
                  ),
                ],
              ),
              20.height,
              ElevatedButton(
                  onPressed: () {
                    NotificationServices.showNotification(
                      payload: 'hi have a good day',
                      title: 'hi have a good day',
                      body: 'This is Life App',
                    );
                  },
                  child: Text(S.of(context).contact_us)),
            ]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).life_description,
                style: const TextStyle(height: 2),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverGrid.builder(
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor.withOpacity(0.9),
                      AppColors.primaryColor.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.widgets, // Change icon as per your service
                      color: Colors.white,
                      size: 28,
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        services[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height / 1.3,
          //   ),
          // ),
        ],
      ),
    );
  }
}

/*
 appBar: AppBar(
        title: Text(S.of(context).about_us),
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
          width: double.infinity,
        ),
        const LogoImage(),
        20.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                launchUrl(Uri.parse(privacyPolicyLink));
              },
              child: Text(S.of(context).privacy_policy),
            ),
            TextButton(
              onPressed: () {
                launchUrl(Uri.parse(termsAndConditionsLink));

              },
              child: Text(S.of(context).terms_and_conditions),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              NotificationServices.showNotification(
                payload: 'hi have a good day',
                title: 'hi have a good day',
                body: 'This is Life App',
              );
            },
            child: Text(S.of(context).contact_us)),
      ]),



 */
