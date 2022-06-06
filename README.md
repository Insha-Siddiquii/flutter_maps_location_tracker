# 🎯 Project Live Location Tracker 

A new Flutter application for live location tracker.

## 🗂 Features:
 - Location tracking from any point to Pickup Point
 - Location tracking from Pickup Point to Delivery Point
 - Timeline Status
 - After delivery completion rating
 - Live Stimulated GPX route is supported
 - Custom location markers
 - Map Polylines integrated
 - Integrated [Google Maps direction API](https://developers.google.com/maps/documentation/directions/start)
 - UI/UX
 - Support iOS and android

 ## 💻 Code Insights:
 - Flutter version 3.0.0
 - [Used Flutter Google Maps](https://pub.dev/packages/google_maps_flutter)
 - [Used Expandable Bottom Sheet](https://pub.dev/packages/expandable_bottom_sheet)
 - [Used Flutter Polylines](https://pub.dev/packages/flutter_polyline_points)
 - [Used Location](https://pub.dev/packages/location)
 - [Used DIO for http request](https://pub.dev/packages/dio)
 - [Used Rating Bar](https://pub.dev/packages/flutter_rating_bar)


## 🧮 Code Structure
<details>

```
📦lib
 ┣ 📂application
 ┃ ┣ 📂configs
 ┃ ┃ ┗ 📜configs.dart
 ┃ ┣ 📂map_home
 ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┗ 📜direction.dart
 ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┣ 📜delivery_rating_bar.dart
 ┃ ┃ ┃ ┣ 📜delivery_rating_submission.dart
 ┃ ┃ ┃ ┣ 📜map_info_card.dart
 ┃ ┃ ┃ ┣ 📜map_notification_alert.dart
 ┃ ┃ ┃ ┣ 📜map_timeline.dart
 ┃ ┃ ┃ ┣ 📜map_timeline_info.dart
 ┃ ┃ ┃ ┣ 📜pickup_delivery_info.dart
 ┃ ┃ ┃ ┣ 📜user_avatar.dart
 ┃ ┃ ┃ ┗ 📜user_info.dart
 ┃ ┃ ┗ 📜map_screen.dart
 ┃ ┣ 📂style
 ┃ ┃ ┗ 📜colors.dart
 ┃ ┗ 📜app.dart
 ┣ 📂data
 ┃ ┗ 📂http
 ┃ ┃ ┗ 📜map_services.dart
 ┣ 📂domain
 ┃ ┗ 📜direction_repository.dart
 ┣ 📜generated_plugin_registrant.dart
 ┗ 📜main.dart

```
</details>

## 📱 Demo

<img src="" width ="250"> <img src="" width ="250"> 
<img src="" width ="250"> <img src="" width ="250"> 
<img src="" width ="250"> 
<img src="" width ="250"> <img src="" width ="250">
  

