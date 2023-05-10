import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';

class ProfileController extends GetxController {
  final ProfileProvider profileProvider;

  ProfileController({required this.profileProvider});

  var isLoading = true.obs;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  
}