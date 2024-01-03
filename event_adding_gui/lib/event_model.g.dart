// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsModelImpl _$$EventsModelImplFromJson(Map<String, dynamic> json) =>
    _$EventsModelImpl(
      title: json['title'] as String,
      summary: json['summary'] as String,
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isFeatured: json['isFeatured'] as bool,
      status: json['status'] as String,
      location: json['location'] as String,
      link: json['link'] as String,
      startDateISO: json['startDateISO'] as String,
      endDateISO: json['endDateISO'] as String,
      hosts: (json['hosts'] as List<dynamic>)
          .map((e) => Hosts.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$EventsModelImplToJson(_$EventsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'description': instance.description,
      'isFeatured': instance.isFeatured,
      'status': instance.status,
      'location': instance.location,
      'link': instance.link,
      'startDateISO': instance.startDateISO,
      'endDateISO': instance.endDateISO,
      'hosts': instance.hosts,
      'tags': instance.tags,
    };

_$HostsImpl _$$HostsImplFromJson(Map<String, dynamic> json) => _$HostsImpl(
      name: json['name'] as String,
      role: json['role'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$HostsImplToJson(_$HostsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'image': instance.image,
    };
