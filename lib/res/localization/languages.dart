import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': "Enter Email",
          'username_hint': "Enter Username",
          'password_hint': "Enter Password",
          'registration_question': "Don't Have An Account?",
          'register_now': "Signup Now!",
          'welcome_text': "Welcome\nTo The\nFuture of FLUTTER!",
          'login_now': "LOGIN",
          'user_name_not_found': "You didn't provide any username",
          'password_not_found': "You didn't provide any password",
          "authentication_error":
              "Please provide your username and password properly.",
          "recheck_logout_content": "Please confirm if you want to logout",
          "recheck_msg": "Are You Sure?",
          "home": "Home",
          "notification": "Notification",
          "favourites": "Favourites",
          "cart": "Cart",
          "settings": "Settings",
          "logout": "Logout",
          "confirm": "Confirm",
          "cancel": "Cancel"
        },
        'bn_BD': {
          'email_hint': "ইমেইল প্রদান করুন",
          'password_hint': "পাসওয়ার্ড লিখুন",
          'registration_question': "আপনার কি একাউন্ট নেই?",
          'register_now': "সাইন আপ করতে এখানে ক্লিক করুন"
        }
      };
}
