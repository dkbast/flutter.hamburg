import 'package:event_adding_gui/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: EnterEventForm(),
      ),
    );
  }
}

class EnterEventForm extends StatefulWidget {
  const EnterEventForm({
    super.key,
  });

  @override
  State<EnterEventForm> createState() => _EnterEventFormState();
}

class _EnterEventFormState extends State<EnterEventForm> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String summary;
  late List<String> description;
  bool isFeatured = true;
  late String status;
  late String location;
  late String link;
  DateTime? startDate;
  int duration = 3;
  late List<Hosts> hosts;
  late List<String> tags;

  @override
  Widget build(BuildContext context) {
// we build a form to enter the EventsModel data
    return Center(
      child: Form(
        key: _formKey,
        child: Card(
            child: ListView(
          children: [
            Row(
              children: [
                const Text('Meetup type: '),
                Expanded(
                  child: DropdownButtonFormField<String>(
                      hint: const Text('Select an event type'),
                      value: 'Meetup',
                      items: ['Meetup', 'Stammtisch'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        onMeetupTypeSet(value);
                        FocusScope.of(context).nextFocus();
                      },
                      onSaved: onMeetupTypeSet),
                ),
              ],
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter a title',
              ),
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                title = value!;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter a summary',
              ),
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                summary = value!;
              },
            ),
            // TODO(dkbast): optionally add group description to list of descriptions
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter a description',
              ),
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                description = [value!];
              },
            ),
            Row(
              children: [
                const Text('Entry fee? '),
                Expanded(
                  child: DropdownButtonFormField<String>(
                      hint: const Text('Select a status'),
                      value: 'Free',
                      items: ['Free', 'Paid', 'Donation'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        status = value!;
                        FocusScope.of(context).nextFocus();
                      }),
                ),
              ],
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter a location',
              ),
              validator: (value) {
                if (value.isNullOrEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                location = value!;
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter a link',
              ),
              validator: (value) {
                // check if the value is a valid url
                if (Uri.tryParse(value ?? '') == null) {
                  return 'Please enter a valid url';
                }
                return null;
              },
              onSaved: (value) {
                link = value!;
              },
            ),
            InputDatePickerFormField(
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSaved: (value) {
                startDate = value;
              },
              onDateSubmitted: (value) {
                startDate = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (startDate == null) {
                  startDate = DateTime.now();
                }

                showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 18, minute: 00))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      startDate = DateTime(startDate!.year, startDate!.month,
                          startDate!.day, value.hour, value.minute);
                    });
                  }
                });
              },
              child: Text(startDate == null || startDate!.hour < 1
                  ? 'Select start time'
                  : DateFormat('HH:mm').format(startDate!)),
            ),

            // integer minus and plus buttons
            NumberStepper(
              labelText: 'Duration in hours: ',
              initalValue: duration,
              minValue: 0,
              maxValue: 72,
              onSaved: (value) {
                duration = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    final event = EventsModel(
                      title: title,
                      summary: summary,
                      description: description,
                      isFeatured: isFeatured,
                      status: status,
                      location: location,
                      link: link,
                      startDateISO: startDate!.toUtc().toIso8601String(),
                      endDateISO: startDate!
                          .add(Duration(hours: duration))
                          .toUtc()
                          .toIso8601String(),
                      hosts: hosts,
                      tags: tags,
                    );
                    print(event.toJson());
                  }
                },
                child: Text('Submit')),
          ],
        )),
      ),
    );
  }

  void onMeetupTypeSet(String? value) {
    hosts = value == 'Meetup' ? meetupHosts : stammtischHosts;
    tags = value == 'Meetup' ? meetupTags : stammtischTags;
  }
}

class NumberStepper extends StatefulWidget {
  const NumberStepper({
    super.key,
    required this.initalValue,
    this.minValue,
    this.maxValue,
    required this.onSaved,
    this.labelText,
  });

  final int initalValue;
  final int? minValue;
  final int? maxValue;

  final String? labelText;

  final Function(int) onSaved;

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  late int value;
  @override
  void initState() {
    super.initState();
    value = widget.initalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormField(
        builder: (formFieldState) => Row(
          children: [
            if (widget.labelText != null) Text(widget.labelText!),
            IconButton(
              onPressed: () {
                if (widget.minValue == null || value > widget.minValue!) {
                  setState(() {
                    value--;
                  });
                  widget.onSaved(value);
                }
              },
              icon: const Icon(Icons.remove),
            ),
            Text(value.toString()),
            IconButton(
              onPressed: () {
                if (widget.maxValue == null || value < widget.maxValue!) {
                  setState(() {
                    value++;
                  });
                  widget.onSaved(value);
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

extension ObjectNullHelpers on Object? {
  bool get isNull => this == null;
}

extension IterableNullHelpers on Iterable? {
  bool get isNullOrEmpty => isNull || this!.isEmpty;
}

extension StringNullHelpers on String? {
  bool get isNullOrEmpty => isNull || this!.isEmpty;
}

final meetupHosts = [
  Hosts(
    name: 'Damian',
    role: 'co-organizer',
    image: 'damian.png',
  ),
  Hosts(
    name: 'René',
    role: 'co-organizer',
    image: 'rene.png',
  ),
  Hosts(
    name: 'Grigori',
    role: 'co-organizer',
    image: 'grigori.png',
  ),
];

final stammtischHosts = [
  Hosts(name: 'Paul', role: 'organizer', image: 'paul.png'),
];

final meetupTags = [
  'Android',
  'iOS',
  'Google Cloud',
  'Firebase',
  'Flutter',
  'Mobile Development',
  'Networking',
];

final stammtischTags = [
  'Flutter',
  'Open Source',
  'New Technology',
  'Mobile Development',
  'Computer Programming',
  'Software Development',
];
