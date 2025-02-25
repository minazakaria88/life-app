// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// ` phone number`
  String get phoneNumber {
    return Intl.message(
      ' phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid phone number`
  String get PleaseEnterValidPhoneNumber {
    return Intl.message(
      'Please enter valid phone number',
      name: 'PleaseEnterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get PleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'PleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid password`
  String get PleaseEnterValidPassword {
    return Intl.message(
      'Please enter valid password',
      name: 'PleaseEnterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get PleaseEnterYourFullName {
    return Intl.message(
      'Please enter your full name',
      name: 'PleaseEnterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid full name`
  String get PleaseEnterValidFullName {
    return Intl.message(
      'Please enter valid full name',
      name: 'PleaseEnterValidFullName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get PleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'PleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get PleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'PleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `National iqama id`
  String get national_iqama_id {
    return Intl.message(
      'National iqama id',
      name: 'national_iqama_id',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your national iqama id`
  String get PleaseEnterYourNationalIqamaId {
    return Intl.message(
      'Please enter your national iqama id',
      name: 'PleaseEnterYourNationalIqamaId',
      desc: '',
      args: [],
    );
  }

  /// `must be more than 8 ,less than 11`
  String get PleaseEnterValidNationalIqamaId {
    return Intl.message(
      'must be more than 8 ,less than 11',
      name: 'PleaseEnterValidNationalIqamaId',
      desc: '',
      args: [],
    );
  }

  /// `Please enter national-iqama number`
  String get msg_plz_enter_iqama_number {
    return Intl.message(
      'Please enter national-iqama number',
      name: 'msg_plz_enter_iqama_number',
      desc: '',
      args: [],
    );
  }

  /// `iqama`
  String get iqama {
    return Intl.message(
      'iqama',
      name: 'iqama',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `By clicking on create an account, you agree to the`
  String get by_clicking_on_create {
    return Intl.message(
      'By clicking on create an account, you agree to the',
      name: 'by_clicking_on_create',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get createYourAccount {
    return Intl.message(
      'Create Your Account',
      name: 'createYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get pleaseCheckYourInternetConnection {
    return Intl.message(
      'Please check your internet connection',
      name: 'pleaseCheckYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Login Successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login Successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get loginFailed {
    return Intl.message(
      'Login Failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send Verification Code`
  String get sendVerificationCode {
    return Intl.message(
      'Send Verification Code',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Back To Login`
  String get backToLogin {
    return Intl.message(
      'Back To Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get verification_code {
    return Intl.message(
      'Enter Verification Code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message(
      'Verify Code',
      name: 'verifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is not correct !`
  String get msg_verification_code_is_invalid {
    return Intl.message(
      'Verification code is not correct !',
      name: 'msg_verification_code_is_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get did_not_receive_the_code {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'did_not_receive_the_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `life`
  String get appTitle {
    return Intl.message(
      'life',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Delegation`
  String get delegation {
    return Intl.message(
      'Delegation',
      name: 'delegation',
      desc: '',
      args: [],
    );
  }

  /// `My addresses`
  String get location {
    return Intl.message(
      'My addresses',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Complaints`
  String get tickets {
    return Intl.message(
      'Complaints',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Service Terms`
  String get service_terms {
    return Intl.message(
      'Service Terms',
      name: 'service_terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Save Updates`
  String get save_updates {
    return Intl.message(
      'Save Updates',
      name: 'save_updates',
      desc: '',
      args: [],
    );
  }

  /// `Update success`
  String get msg_update_success {
    return Intl.message(
      'Update success',
      name: 'msg_update_success',
      desc: '',
      args: [],
    );
  }

  /// `Update failed`
  String get msg_update_failed {
    return Intl.message(
      'Update failed',
      name: 'msg_update_failed',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `what's app`
  String get whats_app {
    return Intl.message(
      'what\'s app',
      name: 'whats_app',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `About Life`
  String get about_life {
    return Intl.message(
      'About Life',
      name: 'about_life',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support`
  String get technical_support {
    return Intl.message(
      'Technical Support',
      name: 'technical_support',
      desc: '',
      args: [],
    );
  }

  /// `Profile Update Successfully`
  String get profileUpdateSuccessfully {
    return Intl.message(
      'Profile Update Successfully',
      name: 'profileUpdateSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get see_all {
    return Intl.message(
      'See all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Add Order`
  String get add_order {
    return Intl.message(
      'Add Order',
      name: 'add_order',
      desc: '',
      args: [],
    );
  }

  /// `New Order`
  String get new_order {
    return Intl.message(
      'New Order',
      name: 'new_order',
      desc: '',
      args: [],
    );
  }

  /// `Contracts`
  String get contract {
    return Intl.message(
      'Contracts',
      name: 'contract',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Request Service`
  String get service_request {
    return Intl.message(
      'Request Service',
      name: 'service_request',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home`
  String get back_to_home {
    return Intl.message(
      'Back To Home',
      name: 'back_to_home',
      desc: '',
      args: [],
    );
  }

  /// `Moquima`
  String get moquima {
    return Intl.message(
      'Moquima',
      name: 'moquima',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Mediation`
  String get mediation {
    return Intl.message(
      'Mediation',
      name: 'mediation',
      desc: '',
      args: [],
    );
  }

  /// `Reliable, certified nurses available to visit your home`
  String get getYourNurse {
    return Intl.message(
      'Reliable, certified nurses available to visit your home',
      name: 'getYourNurse',
      desc: '',
      args: [],
    );
  }

  /// `🎗️ Stay-In offers 🗓️`
  String get staying_offers {
    return Intl.message(
      '🎗️ Stay-In offers 🗓️',
      name: 'staying_offers',
      desc: '',
      args: [],
    );
  }

  /// ` For resident nurse is 3-month package`
  String get month_nurse {
    return Intl.message(
      ' For resident nurse is 3-month package',
      name: 'month_nurse',
      desc: '',
      args: [],
    );
  }

  /// `choose service you desire `
  String get choose_service {
    return Intl.message(
      'choose service you desire ',
      name: 'choose_service',
      desc: '',
      args: [],
    );
  }

  /// `Check Service`
  String get check_service {
    return Intl.message(
      'Check Service',
      name: 'check_service',
      desc: '',
      args: [],
    );
  }

  /// `Specified stay-in services starting from a month up to 2 years with monthly installments`
  String get staying_service_desc {
    return Intl.message(
      'Specified stay-in services starting from a month up to 2 years with monthly installments',
      name: 'staying_service_desc',
      desc: '',
      args: [],
    );
  }

  /// `Stay-In Service`
  String get staying_service {
    return Intl.message(
      'Stay-In Service',
      name: 'staying_service',
      desc: '',
      args: [],
    );
  }

  /// `Filter menu due to`
  String get filter_menu_due_to {
    return Intl.message(
      'Filter menu due to',
      name: 'filter_menu_due_to',
      desc: '',
      args: [],
    );
  }

  /// `Marital status`
  String get marital_status {
    return Intl.message(
      'Marital status',
      name: 'marital_status',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Choose at least one option`
  String get choose_atleast_one {
    return Intl.message(
      'Choose at least one option',
      name: 'choose_atleast_one',
      desc: '',
      args: [],
    );
  }

  /// `My Contracts`
  String get my_contracts {
    return Intl.message(
      'My Contracts',
      name: 'my_contracts',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all_contracts {
    return Intl.message(
      'All',
      name: 'all_contracts',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Package Name`
  String get package_name {
    return Intl.message(
      'Package Name',
      name: 'package_name',
      desc: '',
      args: [],
    );
  }

  /// `Contract Details`
  String get contract_details {
    return Intl.message(
      'Contract Details',
      name: 'contract_details',
      desc: '',
      args: [],
    );
  }

  /// `If the contract is cancelled before benefiting from the service, the client will be charged a cancellation fee of 2.5% of the total price of the contract.`
  String get if_the_contract_is_cancelled {
    return Intl.message(
      'If the contract is cancelled before benefiting from the service, the client will be charged a cancellation fee of 2.5% of the total price of the contract.',
      name: 'if_the_contract_is_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel the contract`
  String get cancel_the_contract {
    return Intl.message(
      'Cancel the contract',
      name: 'cancel_the_contract',
      desc: '',
      args: [],
    );
  }

  /// `Contract Renewal`
  String get contract_renewal {
    return Intl.message(
      'Contract Renewal',
      name: 'contract_renewal',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get sar {
    return Intl.message(
      'SAR',
      name: 'sar',
      desc: '',
      args: [],
    );
  }

  /// `No contracts yet`
  String get no_contracts {
    return Intl.message(
      'No contracts yet',
      name: 'no_contracts',
      desc: '',
      args: [],
    );
  }

  /// `No active contracts yet`
  String get no_active_contracts {
    return Intl.message(
      'No active contracts yet',
      name: 'no_active_contracts',
      desc: '',
      args: [],
    );
  }

  /// `No expired contracts yet`
  String get no_expired_contracts {
    return Intl.message(
      'No expired contracts yet',
      name: 'no_expired_contracts',
      desc: '',
      args: [],
    );
  }

  /// `Contract Number`
  String get contract_number {
    return Intl.message(
      'Contract Number',
      name: 'contract_number',
      desc: '',
      args: [],
    );
  }

  /// `Nurse Details`
  String get nurse_details {
    return Intl.message(
      'Nurse Details',
      name: 'nurse_details',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Client Details`
  String get client_details {
    return Intl.message(
      'Client Details',
      name: 'client_details',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `View Resume`
  String get view_resume {
    return Intl.message(
      'View Resume',
      name: 'view_resume',
      desc: '',
      args: [],
    );
  }

  /// `Via`
  String get via {
    return Intl.message(
      'Via',
      name: 'via',
      desc: '',
      args: [],
    );
  }

  /// `Complaint`
  String get ticket {
    return Intl.message(
      'Complaint',
      name: 'ticket',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Contract ID`
  String get contract_id {
    return Intl.message(
      'Contract ID',
      name: 'contract_id',
      desc: '',
      args: [],
    );
  }

  /// ` Type`
  String get type {
    return Intl.message(
      ' Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Title`
  String get ticket_name {
    return Intl.message(
      'Complaint Title',
      name: 'ticket_name',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Details`
  String get ticket_details {
    return Intl.message(
      'Complaint Details',
      name: 'ticket_details',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Priority`
  String get ticket_priority {
    return Intl.message(
      'Complaint Priority',
      name: 'ticket_priority',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Status`
  String get ticket_status {
    return Intl.message(
      'Complaint Status',
      name: 'ticket_status',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Type`
  String get ticket_type {
    return Intl.message(
      'Complaint Type',
      name: 'ticket_type',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Importance`
  String get ticket_importance {
    return Intl.message(
      'Complaint Importance',
      name: 'ticket_importance',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get upload_file {
    return Intl.message(
      'Upload File',
      name: 'upload_file',
      desc: '',
      args: [],
    );
  }

  /// `Add Complaint`
  String get add_ticket {
    return Intl.message(
      'Add Complaint',
      name: 'add_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `You should upload file`
  String get msg_your_should_upload_file {
    return Intl.message(
      'You should upload file',
      name: 'msg_your_should_upload_file',
      desc: '',
      args: [],
    );
  }

  /// `Ticket sent successfully`
  String get msg_ticket_success {
    return Intl.message(
      'Ticket sent successfully',
      name: 'msg_ticket_success',
      desc: '',
      args: [],
    );
  }

  /// `Ticket title is required`
  String get msg_ticket_title_required {
    return Intl.message(
      'Ticket title is required',
      name: 'msg_ticket_title_required',
      desc: '',
      args: [],
    );
  }

  /// `Ticket title must be more than 6 characters`
  String get msg_ticket_title_most_by_more_than_6_characters {
    return Intl.message(
      'Ticket title must be more than 6 characters',
      name: 'msg_ticket_title_most_by_more_than_6_characters',
      desc: '',
      args: [],
    );
  }

  /// `Ticket note is required`
  String get msg_ticket_note_required {
    return Intl.message(
      'Ticket note is required',
      name: 'msg_ticket_note_required',
      desc: '',
      args: [],
    );
  }

  /// `Ticket title must be more than 16 characters`
  String get msg_ticket_note_most_by_more_than_16_characters {
    return Intl.message(
      'Ticket title must be more than 16 characters',
      name: 'msg_ticket_note_most_by_more_than_16_characters',
      desc: '',
      args: [],
    );
  }

  /// `There are no results`
  String get there_are_no_results {
    return Intl.message(
      'There are no results',
      name: 'there_are_no_results',
      desc: '',
      args: [],
    );
  }

  /// `Please , select priority`
  String get select_priority {
    return Intl.message(
      'Please , select priority',
      name: 'select_priority',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Package`
  String get package {
    return Intl.message(
      'Package',
      name: 'package',
      desc: '',
      args: [],
    );
  }

  /// `Please select Package!`
  String get msg_select_package {
    return Intl.message(
      'Please select Package!',
      name: 'msg_select_package',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Pickup branch`
  String get pick_up_branch {
    return Intl.message(
      'Pickup branch',
      name: 'pick_up_branch',
      desc: '',
      args: [],
    );
  }

  /// `Rent ended`
  String get rent_ended {
    return Intl.message(
      'Rent ended',
      name: 'rent_ended',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Choose your package`
  String get choose_your_package {
    return Intl.message(
      'Choose your package',
      name: 'choose_your_package',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Employee Details`
  String get employee_details {
    return Intl.message(
      'Employee Details',
      name: 'employee_details',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get client_name {
    return Intl.message(
      'Client Name',
      name: 'client_name',
      desc: '',
      args: [],
    );
  }

  /// `Price Details`
  String get price_details {
    return Intl.message(
      'Price Details',
      name: 'price_details',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Order Not Submitted`
  String get order_not_submit {
    return Intl.message(
      'Order Not Submitted',
      name: 'order_not_submit',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message(
      'Try Again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `sorry! you have an order`
  String get sorry_order {
    return Intl.message(
      'sorry! you have an order',
      name: 'sorry_order',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Your Data`
  String get your_data {
    return Intl.message(
      'Your Data',
      name: 'your_data',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue1 {
    return Intl.message(
      'Continue',
      name: 'continue1',
      desc: '',
      args: [],
    );
  }

  /// `Make Order`
  String get makeOrder {
    return Intl.message(
      'Make Order',
      name: 'makeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clear_all {
    return Intl.message(
      'Clear All',
      name: 'clear_all',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delegate Client`
  String get delegate_client {
    return Intl.message(
      'Delegate Client',
      name: 'delegate_client',
      desc: '',
      args: [],
    );
  }

  /// `Add New Delegation`
  String get add_delegation {
    return Intl.message(
      'Add New Delegation',
      name: 'add_delegation',
      desc: '',
      args: [],
    );
  }

  /// `Update Delegation`
  String get update_delegation {
    return Intl.message(
      'Update Delegation',
      name: 'update_delegation',
      desc: '',
      args: [],
    );
  }

  /// `Edit Delegation`
  String get edit_delegation {
    return Intl.message(
      'Edit Delegation',
      name: 'edit_delegation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Delegation`
  String get cancel_delegation {
    return Intl.message(
      'Cancel Delegation',
      name: 'cancel_delegation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Delegation`
  String get delete_delegation {
    return Intl.message(
      'Delete Delegation',
      name: 'delete_delegation',
      desc: '',
      args: [],
    );
  }

  /// `Hey! The authorization will be permanently deleted Are you sure?`
  String get delete_delegation_content {
    return Intl.message(
      'Hey! The authorization will be permanently deleted Are you sure?',
      name: 'delete_delegation_content',
      desc: '',
      args: [],
    );
  }

  /// `Select Nationality`
  String get select_nationality {
    return Intl.message(
      'Select Nationality',
      name: 'select_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Delegation created Successfully`
  String get msg_delegation_created {
    return Intl.message(
      'Delegation created Successfully',
      name: 'msg_delegation_created',
      desc: '',
      args: [],
    );
  }

  /// `Order submitted successfully`
  String get msg_order_success {
    return Intl.message(
      'Order submitted successfully',
      name: 'msg_order_success',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Select Branch`
  String get selectBranch {
    return Intl.message(
      'Select Branch',
      name: 'selectBranch',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get selectCity {
    return Intl.message(
      'Select City',
      name: 'selectCity',
      desc: '',
      args: [],
    );
  }

  /// `Select Location`
  String get selectLocation {
    return Intl.message(
      'Select Location',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Package`
  String get selectPackage {
    return Intl.message(
      'Select Package',
      name: 'selectPackage',
      desc: '',
      args: [],
    );
  }

  /// `Resume not found`
  String get resume_not_found {
    return Intl.message(
      'Resume not found',
      name: 'resume_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Add Location`
  String get add_location {
    return Intl.message(
      'Add Location',
      name: 'add_location',
      desc: '',
      args: [],
    );
  }

  /// `Edit Location`
  String get edit_location {
    return Intl.message(
      'Edit Location',
      name: 'edit_location',
      desc: '',
      args: [],
    );
  }

  /// `the location will be permanently deleted are you sure?`
  String get do_you_want_to_delete_location {
    return Intl.message(
      'the location will be permanently deleted are you sure?',
      name: 'do_you_want_to_delete_location',
      desc: '',
      args: [],
    );
  }

  /// `Location Name`
  String get location_name {
    return Intl.message(
      'Location Name',
      name: 'location_name',
      desc: '',
      args: [],
    );
  }

  /// `Delete Location`
  String get delete_location {
    return Intl.message(
      'Delete Location',
      name: 'delete_location',
      desc: '',
      args: [],
    );
  }

  /// `Location Address`
  String get location_address {
    return Intl.message(
      'Location Address',
      name: 'location_address',
      desc: '',
      args: [],
    );
  }

  /// `Select Location`
  String get select_location {
    return Intl.message(
      'Select Location',
      name: 'select_location',
      desc: '',
      args: [],
    );
  }

  /// `Other Details`
  String get other_details {
    return Intl.message(
      'Other Details',
      name: 'other_details',
      desc: '',
      args: [],
    );
  }

  /// `Address deleted successfully `
  String get address_deleted_success {
    return Intl.message(
      'Address deleted successfully ',
      name: 'address_deleted_success',
      desc: '',
      args: [],
    );
  }

  /// `please, enter building number`
  String get please_enter_building_number {
    return Intl.message(
      'please, enter building number',
      name: 'please_enter_building_number',
      desc: '',
      args: [],
    );
  }

  /// `please, enter floor number`
  String get please_enter_floor_number {
    return Intl.message(
      'please, enter floor number',
      name: 'please_enter_floor_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Address Title`
  String get please_enter_title {
    return Intl.message(
      'Please enter Address Title',
      name: 'please_enter_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter notes, Building number, Floor number, etc.`
  String get please_enter_notes {
    return Intl.message(
      'Please enter notes, Building number, Floor number, etc.',
      name: 'please_enter_notes',
      desc: '',
      args: [],
    );
  }

  /// `Building Number`
  String get building_number {
    return Intl.message(
      'Building Number',
      name: 'building_number',
      desc: '',
      args: [],
    );
  }

  /// `Floor Number`
  String get floor_number {
    return Intl.message(
      'Floor Number',
      name: 'floor_number',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete location?`
  String get are_you_sure_you_want_to_delete_location {
    return Intl.message(
      'Are you sure you want to delete location?',
      name: 'are_you_sure_you_want_to_delete_location',
      desc: '',
      args: [],
    );
  }

  /// `Location added successfully`
  String get msg_location_added_successfully {
    return Intl.message(
      'Location added successfully',
      name: 'msg_location_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete Location Fail`
  String get delete_location_fail {
    return Intl.message(
      'Delete Location Fail',
      name: 'delete_location_fail',
      desc: '',
      args: [],
    );
  }

  /// `Add Location Failed`
  String get add_location_failed {
    return Intl.message(
      'Add Location Failed',
      name: 'add_location_failed',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `There are no packages`
  String get there_are_no_packages {
    return Intl.message(
      'There are no packages',
      name: 'there_are_no_packages',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otp_verification {
    return Intl.message(
      'OTP Verification',
      name: 'otp_verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to`
  String get enter_the_code_sent_to {
    return Intl.message(
      'Enter the code sent to',
      name: 'enter_the_code_sent_to',
      desc: '',
      args: [],
    );
  }

  /// `Visa Number`
  String get visaNumber {
    return Intl.message(
      'Visa Number',
      name: 'visaNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Visa Number`
  String get pleaseEnterVisaNumber {
    return Intl.message(
      'Please Enter Visa Number',
      name: 'pleaseEnterVisaNumber',
      desc: '',
      args: [],
    );
  }

  /// `Add Mediation`
  String get add_mediation {
    return Intl.message(
      'Add Mediation',
      name: 'add_mediation',
      desc: '',
      args: [],
    );
  }

  /// `Add Mediation Successfully`
  String get add_mediation_successfully {
    return Intl.message(
      'Add Mediation Successfully',
      name: 'add_mediation_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password Successfully`
  String get resetPasswordSuccessfully {
    return Intl.message(
      'Reset Password Successfully',
      name: 'resetPasswordSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Type your question here...`
  String get typeYourQuestionHere {
    return Intl.message(
      'Type your question here...',
      name: 'typeYourQuestionHere',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete account?`
  String get are_you_sure_you_want_to_delete_account {
    return Intl.message(
      'Are you sure you want to delete account?',
      name: 'are_you_sure_you_want_to_delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Send Money To This Number`
  String get sendMoneyToThisNumber {
    return Intl.message(
      'Send Money To This Number',
      name: 'sendMoneyToThisNumber',
      desc: '',
      args: [],
    );
  }

  /// `Amount To Pay`
  String get amountToPay {
    return Intl.message(
      'Amount To Pay',
      name: 'amountToPay',
      desc: '',
      args: [],
    );
  }

  /// `Mediation Service`
  String get mediation_service {
    return Intl.message(
      'Mediation Service',
      name: 'mediation_service',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get greeting_morning {
    return Intl.message(
      'Good Morning',
      name: 'greeting_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get greeting_afternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'greeting_afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get greeting_evening {
    return Intl.message(
      'Good Evening',
      name: 'greeting_evening',
      desc: '',
      args: [],
    );
  }

  /// `Good Night`
  String get greeting_night {
    return Intl.message(
      'Good Night',
      name: 'greeting_night',
      desc: '',
      args: [],
    );
  }

  /// `Update Location`
  String get updateLocation {
    return Intl.message(
      'Update Location',
      name: 'updateLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location updated successfully`
  String get msg_location_updated_successfully {
    return Intl.message(
      'Location updated successfully',
      name: 'msg_location_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Enter Nurse Name`
  String get enterNurseName {
    return Intl.message(
      'Enter Nurse Name',
      name: 'enterNurseName',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password Reset Successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get some_thing_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'some_thing_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get close {
    return Intl.message(
      'Cancelled',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `opened`
  String get opened {
    return Intl.message(
      'opened',
      name: 'opened',
      desc: '',
      args: [],
    );
  }

  /// `closed`
  String get closed {
    return Intl.message(
      'closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete delegation?`
  String get are_you_sure_you_want_to_delete_delegation {
    return Intl.message(
      'Are you sure you want to delete delegation?',
      name: 'are_you_sure_you_want_to_delete_delegation',
      desc: '',
      args: [],
    );
  }

  /// `Life App is your trusted platform for professional nursing and healthcare services. We connect you with highly qualified nurses and healthcare providers to ensure the best care for you and your loved ones. Whether you need home nursing, elderly care, post-surgery support, or specialized medical assistance, Life App is here to help—anytime, anywhere.`
  String get life_description {
    return Intl.message(
      'Life App is your trusted platform for professional nursing and healthcare services. We connect you with highly qualified nurses and healthcare providers to ensure the best care for you and your loved ones. Whether you need home nursing, elderly care, post-surgery support, or specialized medical assistance, Life App is here to help—anytime, anywhere.',
      name: 'life_description',
      desc: '',
      args: [],
    );
  }

  /// `Select Image Source`
  String get select_image_source {
    return Intl.message(
      'Select Image Source',
      name: 'select_image_source',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
