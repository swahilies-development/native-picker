import Flutter
import UIKit
import ContactsUI

public class FlutterIsAwesomePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_is_awesome", binaryMessenger: registrar.messenger())
    let instance = FlutterIsAwesomePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getAContact" {
        getAContact(withResult: result)
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
    
    var contactPickerDelegate: ContactPickerDelegate?

    private func getAContact(withResult result: @escaping FlutterResult) {
        let contactPicker = CNContactPickerViewController()
        contactPickerDelegate = ContactPickerDelegate(onSelectContact: { contact in
            let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? ""
            let name = CNContactFormatter.string(from: contact, style: .fullName) ?? ""
            result(["name": name, "phoneNumber": phoneNumber])
            self.contactPickerDelegate = nil
        },
        onCancel: {
            result(nil)
            self.contactPickerDelegate = nil
        })
        contactPicker.delegate = contactPickerDelegate
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        let rootViewController = keyWindow?.rootViewController
        DispatchQueue.main.async {
            rootViewController?.present(contactPicker, animated: true)
        }
    }

}
