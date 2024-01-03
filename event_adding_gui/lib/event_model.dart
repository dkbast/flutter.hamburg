import 'package:freezed_annotation/freezed_annotation.dart';
/* Event json
     {
    "title": "Flutter Hamburg 2023/12 - Glögg Special",
    "summary": "You read it, loved it, clicked it - we get it. Flutter + Glögg has proven to be a wonderful combination and we are able to host another event like this! Those who attendeed in previous Glögg Specials know what you don't want to miss.. the awesome Flutter Hamburg community! :) ",
    "description": [
      "Our goal is to connect people who love to build great software with Flutter/Dart, people who want to exchange about their learnings and failures, about best practices and about strategies to adapt disciplines like Domain Driven Design, Service Oriented Architecture and more.Get togethers, talks, hacking - everything is possible ;-)",
      "Flutter + Glögg has proven to be a wonderful combination and we are able to host another event like this!",
      "We have two amazing speakers for this event: Ole from Netlight and Sylvia who is a Flutter Google Developer Expert visiting us from Cape Town, South Africa! Don’t miss it!"
    ],
    "isFeatured": true,
    "status": "Free",
    "location": "Netlight Consulting GmbH, Große Bleichen 23-27",
    "link": "https://www.meetup.com/de-DE/flutter-meetup-hamburg/events/296945911/",
    "startDateISO": "2023-12-12T18:00:00Z",
    "endDateISO": "2023-12-12T21:00:00Z",
    "hosts": [
      {
        "name": "Damian",
        "role": "co-organizer",
        "image": "damian.png"
      },
      {
        "name": "René",
        "role": "organizer",
        "image": "rene.png"
      },
      {
        "name": "Grigori",
        "role": "organizer",
        "image": "grigori.png"
      }
    ],
    "tags": [
      "Android",
      "iOS",
      "Google Cloud",
      "Firebase",
      "Flutter",
      "Mobile Development",
      "Networking"
    ]
  },
*/

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventsModel with _$EventsModel {
  const factory EventsModel({
    required String title,
    required String summary,
    required List<String> description,
    required bool isFeatured,
    required String status,
    required String location,
    required String link,
    required String startDateISO,
    required String endDateISO,
    required List<Hosts> hosts,
    required List<String> tags,
  }) = _EventsModel;

  factory EventsModel.fromJson(Map<String, dynamic> json) =>
      _$EventsModelFromJson(json);
}

@freezed
class Hosts with _$Hosts {
  const factory Hosts({
    required String name,
    required String role,
    required String image,
  }) = _Hosts;

  factory Hosts.fromJson(Map<String, dynamic> json) => _$HostsFromJson(json);
}
