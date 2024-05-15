import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_repo/screens/log_in.dart';

import '../provider/api_providers.dart';
import '../provider/ui_providers.dart';
import '../styles/style.dart';
import 'sign_up/sign_up.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosAsyncValue = ref.watch(randomPhotoProvider);
    final uiService = ref.watch(uiServiceProvider);  
    return Scaffold(
      body: Stack(
        children: [
          photosAsyncValue.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
              data: (photos) {
                return MasonryGridView.builder(
                  itemCount: photos.length,
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                  ),
                  itemBuilder: (context,index) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              photos[index]['urls']['regular'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), 
                );
              },
            ),
          const Positioned(
              bottom: 0, 
              child: displayBanner(), 
            ),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [Colors.black.withOpacity(0), Colors.white],
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width/2) - 60,
              bottom: (MediaQuery.of(context).size.height / 3) - 60,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/pinterest_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            )
        ],
      ),
    );
  }
}



class displayBanner extends StatelessWidget {
  const displayBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: const BoxDecoration(
          color: AppStyle.colorWhite
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Text('Welcome to Pinterest', style: AppStyle.landingHeader,),
            const SizedBox(height: 20,),
            MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpNavigation()));
              },
              minWidth: MediaQuery.of(context).size.width - 80,
              height: 50,
              color: AppStyle.colorRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('Sign up', style: AppStyle.landingSignUpButton,),
            ),
            const SizedBox(height: 10,),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
              },
              minWidth: MediaQuery.of(context).size.width - 80,
              height: 50,
              color: AppStyle.isInactive,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('Log in', style: AppStyle.landingLogInButton,),
            ),
            const SizedBox(height: 15,),
            const Text('By continuing, you agree to Pinterest’s Terms od Service and acknowledge you\’ve read our Privacy Policy. Notice at collection', textAlign: TextAlign.center,),
          ],
        ),
      );
  }
}