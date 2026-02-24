//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddTaskRequest {
  /// Returns a new [AddTaskRequest] instance.
  AddTaskRequest({
    required this.name,
    required this.priority,
  });

  String name;

  AddTaskRequestPriorityEnum priority;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddTaskRequest &&
    other.name == name &&
    other.priority == priority;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (priority.hashCode);

  @override
  String toString() => 'AddTaskRequest[name=$name, priority=$priority]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'priority'] = this.priority;
    return json;
  }

  /// Returns a new [AddTaskRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddTaskRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddTaskRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddTaskRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddTaskRequest(
        name: mapValueOfType<String>(json, r'name')!,
        priority: AddTaskRequestPriorityEnum.fromJson(json[r'priority'])!,
      );
    }
    return null;
  }

  static List<AddTaskRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddTaskRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddTaskRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddTaskRequest> mapFromJson(dynamic json) {
    final map = <String, AddTaskRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddTaskRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddTaskRequest-objects as value to a dart map
  static Map<String, List<AddTaskRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddTaskRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddTaskRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'priority',
  };
}


class AddTaskRequestPriorityEnum {
  /// Instantiate a new enum with the provided [value].
  const AddTaskRequestPriorityEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const LOW = AddTaskRequestPriorityEnum._(r'LOW');
  static const NORMAL = AddTaskRequestPriorityEnum._(r'NORMAL');
  static const URGENT = AddTaskRequestPriorityEnum._(r'URGENT');

  /// List of all possible values in this [enum][AddTaskRequestPriorityEnum].
  static const values = <AddTaskRequestPriorityEnum>[
    LOW,
    NORMAL,
    URGENT,
  ];

  static AddTaskRequestPriorityEnum? fromJson(dynamic value) => AddTaskRequestPriorityEnumTypeTransformer().decode(value);

  static List<AddTaskRequestPriorityEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddTaskRequestPriorityEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddTaskRequestPriorityEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AddTaskRequestPriorityEnum] to String,
/// and [decode] dynamic data back to [AddTaskRequestPriorityEnum].
class AddTaskRequestPriorityEnumTypeTransformer {
  factory AddTaskRequestPriorityEnumTypeTransformer() => _instance ??= const AddTaskRequestPriorityEnumTypeTransformer._();

  const AddTaskRequestPriorityEnumTypeTransformer._();

  String encode(AddTaskRequestPriorityEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AddTaskRequestPriorityEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AddTaskRequestPriorityEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'LOW': return AddTaskRequestPriorityEnum.LOW;
        case r'NORMAL': return AddTaskRequestPriorityEnum.NORMAL;
        case r'URGENT': return AddTaskRequestPriorityEnum.URGENT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AddTaskRequestPriorityEnumTypeTransformer] instance.
  static AddTaskRequestPriorityEnumTypeTransformer? _instance;
}


