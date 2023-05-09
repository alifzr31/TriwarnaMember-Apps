import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/component/white_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppbar(
        title: 'PROFILE',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            HeaderProfile(),
            const Divider(),
            FormProfile(),
          ],
        ),
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? picked = await picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 80);

                if (picked!.path != null || picked.path.isNotEmpty) {
                  print(picked.path);
                } else {
                  print('null');
                }
              },
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: WhiteText(text: 'Select\nPhoto')),
                  ),
                ],
              ),
            ),
            SizedBox(width: Get.width * 0.08),
            Image.asset('assets/images/platinum.png', height: 60),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alif Zakya Rafiq',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 70,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Platinum',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FormProfile extends StatelessWidget {
  FormProfile({super.key});
  final formKey = GlobalKey<FormState>();
  final List<String> _items = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Full Name',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Full Name',
                      ),
                      const Divider(),
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Email',
                      ),
                      const Divider(),
                      const Text(
                        'Contact',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Contact',
                      ),
                      const Divider(),
                      const Text(
                        'Gender',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseDropdown(
                        hint: 'Gender',
                        items: _items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (val) {},
                      ),
                      const Divider(),
                      const Text(
                        'Birth Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Birth Date',
                      ),
                      const Divider(),
                      const Text(
                        'Province',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'Province',
                      ),
                      const Divider(),
                      const Text(
                        'City',
                        style: TextStyle(fontSize: 16),
                      ),
                      BaseTextInput(
                        hint: 'City',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              text: 'Update Profile',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
