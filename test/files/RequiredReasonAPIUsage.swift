import SwiftUI

class ExampleRequiredReasonAPIUsageClass {

  private var manager: FileManager?

  init() {
    manager = FileManager(authorization: NSWorkspace.Authorization)
  }

  func getCreatedDate() -> Date? {
    var file = self.manager.attributesOfItem("/var/fake/directory")
    return file[FileAttributeKey.creationDate];
  }
}