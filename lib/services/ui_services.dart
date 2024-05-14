import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';

import '../styles/style.dart';

class BottomNavigationService extends StateNotifier<int> {
  BottomNavigationService() : super(0);

  void setSelectedIndex(int index) {
    state = index;
  }
}


class PhotoDetails {
  displayDetails(BuildContext context, String username) { 
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.close_rounded, size: 25,),
                  SizedBox(width: 20,),
                  Text('Option', style: AppStyle.detailsTitle,)
                ],
              ),
              const SizedBox(height: 50,),
              Text('Follow $username', style: AppStyle.detailsTitle,),
              const SizedBox(height: 20,),
              const Text('Copy Link', style: AppStyle.detailsTitle,),
              const SizedBox(height: 20,),
              const Text('Download image', style: AppStyle.detailsTitle,),
              const SizedBox(height: 20,),
              const Text('Hide Pin', style: AppStyle.detailsTitle,),
              const Text('See fewer Pins like this', style: AppStyle.detailsSubtitle),
              const SizedBox(height: 20,),
              const Text('Report Pin', style: AppStyle.detailsTitle,),
              const Text('This goes against Pinterest\'s community guidelines', style: AppStyle.detailsSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}

