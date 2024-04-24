// ignore_for_file: constant_identifier_names

/// A list of the Required Reason API types defined by Apple.
enum RequiredReasonAPIType {
  NSPrivacyAccessAPICategoryFileTimestamp,
  NSPrivacyAccessedAPICategorySystemBootTime,
  NSPrivacyAccessedAPICategoryDiskSpace,
  NSPrivacyAccessedAPICategoryActiveKeyboards,
  NSPrivacyAccessedAPICategoryUserDefaults
}

typedef RequiredReasonAPI = ({RequiredReasonAPIType type, String api});

// Now create a map of the Required Reason API types to the declarations of the APIs.
const requiredReasonApiDeclarations = <RequiredReasonAPIType, List<RequiredReasonAPI>>{
  // creationDate
  // modificationDate
  // fileModificationDate
  // contentModificationDateKey
  // creationDateKey
  // getattrlist(_:_:_:_:_:)
  // getattrlistbulk(_:_:_:_:_:)
  // fgetattrlist(_:_:_:_:_:)
  // stat
  // fstat(_:_:)
  // fstatat(_:_:_:_:)
  // lstat(_:_:)
  // getattrlistat(_:_:_:_:_:_:)
  RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp: [
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'creationDate'),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'modificationDate'),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'fileModificationDate'),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'contentModificationDateKey'),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'creationDateKey'),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'getattrlist('),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'getattrlistbulk('),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'fgetattrlist('),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'stat'),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'fstat('),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'fstatat('),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'lstat('),
    (type: RequiredReasonAPIType.NSPrivacyAccessAPICategoryFileTimestamp, api: 'getattrlistat('),
  ],

  // systemUptime
  // mach_absolute_time()
  RequiredReasonAPIType.NSPrivacyAccessedAPICategorySystemBootTime: [
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategorySystemBootTime, api: 'systemUptime'),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategorySystemBootTime, api: 'mach_absolute_time('),
  ],

  // volumeAvailableCapacityKey
  // volumeAvailableCapacityForImportantUsageKey
  // volumeAvailableCapacityForOpportunisticUsageKey
  // volumeTotalCapacityKey
  // systemFreeSize
  // systemSize
  // statfs(_:_:)
  // statvfs(_:_:)
  // fstatfs(_:_:)
  // fstatvfs(_:_:)
  // getattrlist(_:_:_:_:_:)
  // fgetattrlist(_:_:_:_:_:)
  // getattrlistat(_:_:_:_:_:_:)
  RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace: [
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'volumeAvailableCapacityKey'),
    (
      type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace,
      api: 'volumeAvailableCapacityForImportantUsageKey'
    ),
    (
      type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace,
      api: 'volumeAvailableCapacityForOpportunisticUsageKey'
    ),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'volumeTotalCapacityKey'),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'systemFreeSize'),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'systemSize'),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'statfs('),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'statvfs('),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'fstatfs('),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'fstatvfs('),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'getattrlist('),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'fgetattrlist('),
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryDiskSpace, api: 'getattrlistat('),
  ],

  // activeInputModes
  RequiredReasonAPIType.NSPrivacyAccessedAPICategoryActiveKeyboards: [
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryActiveKeyboards, api: 'activeInputModes'),
  ],

  // UserDefaults
  RequiredReasonAPIType.NSPrivacyAccessedAPICategoryUserDefaults: [
    (type: RequiredReasonAPIType.NSPrivacyAccessedAPICategoryUserDefaults, api: 'UserDefaults'),
  ],
};
