import Flutter
import UIKit

@objc(ReaderFlutterViewController)
final class ReaderFlutterViewController: FlutterViewController {
  private var readerImmersiveEnabled = false {
    didSet {
      guard oldValue != readerImmersiveEnabled else { return }
      refreshImmersiveUI()
    }
  }

  override var prefersHomeIndicatorAutoHidden: Bool {
    readerImmersiveEnabled
  }

  override var prefersStatusBarHidden: Bool {
    readerImmersiveEnabled
  }

  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    .fade
  }

  override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
    []
  }

  func setReaderImmersiveEnabled(_ enabled: Bool) {
    readerImmersiveEnabled = enabled
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if readerImmersiveEnabled {
      refreshImmersiveUI()
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if readerImmersiveEnabled {
      refreshImmersiveUI()
    }
  }

  private func refreshImmersiveUI() {
    setNeedsStatusBarAppearanceUpdate()
    setNeedsUpdateOfHomeIndicatorAutoHidden()
    setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
  }
}

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var readerImmersiveEnabled = false
  private var readerUIChannel: FlutterMethodChannel?
  private var readerStatusChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    guard let registrar = engineBridge.pluginRegistry.registrar(
      forPlugin: "LocalReaderPlatformBridge"
    ) else {
      NSLog("Local reader platform bridge unavailable")
      return
    }
    installReaderChannels(messenger: registrar.messenger())
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    super.applicationDidBecomeActive(application)
    applyReaderImmersiveIfPossible()
  }

  private func installReaderChannels(messenger: FlutterBinaryMessenger) {
    let readerUIChannel = FlutterMethodChannel(
      name: "org.example.xxread/reader_ui",
      binaryMessenger: messenger
    )
    readerUIChannel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "setReaderImmersive" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard
        let arguments = call.arguments as? [String: Any],
        let enabled = arguments["enabled"] as? Bool
      else {
        result(
          FlutterError(
            code: "invalid_args",
            message: "expected {enabled: bool}",
            details: nil
          )
        )
        return
      }
      self?.readerImmersiveEnabled = enabled
      self?.applyReaderImmersiveIfPossible()
      result(nil)
    }
    self.readerUIChannel = readerUIChannel

    let readerStatusChannel = FlutterMethodChannel(
      name: "org.example.xxread/reader_status",
      binaryMessenger: messenger
    )
    readerStatusChannel.setMethodCallHandler { call, result in
      guard call.method == "getBatteryStatus" else {
        result(FlutterMethodNotImplemented)
        return
      }
      UIDevice.current.isBatteryMonitoringEnabled = true
      let level = UIDevice.current.batteryLevel
      guard level >= 0 else {
        result(nil)
        return
      }
      let state = UIDevice.current.batteryState
      result([
        "level": Int((level * 100).rounded()),
        "charging": state == .charging || state == .full,
      ])
    }
    self.readerStatusChannel = readerStatusChannel
  }

  private func applyReaderImmersiveIfPossible() {
    currentReaderController()?.setReaderImmersiveEnabled(readerImmersiveEnabled)
  }

  private func currentReaderController() -> ReaderFlutterViewController? {
    for case let scene as UIWindowScene in UIApplication.shared.connectedScenes {
      let window = scene.windows.first(where: { $0.isKeyWindow }) ?? scene.windows.first
      if let controller = findReaderController(in: window?.rootViewController) {
        return controller
      }
    }
    return findReaderController(in: window?.rootViewController)
  }

  private func findReaderController(
    in viewController: UIViewController?
  ) -> ReaderFlutterViewController? {
    guard let viewController else { return nil }
    if let reader = viewController as? ReaderFlutterViewController {
      return reader
    }
    if let presented = viewController.presentedViewController,
       let reader = findReaderController(in: presented) {
      return reader
    }
    if let navigation = viewController as? UINavigationController {
      for child in navigation.viewControllers {
        if let reader = findReaderController(in: child) {
          return reader
        }
      }
    }
    if let tabs = viewController as? UITabBarController {
      for child in tabs.viewControllers ?? [] {
        if let reader = findReaderController(in: child) {
          return reader
        }
      }
    }
    for child in viewController.children {
      if let reader = findReaderController(in: child) {
        return reader
      }
    }
    return nil
  }
}
