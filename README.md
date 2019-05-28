# TWUITests Example

Example of how to use [TWUITests framework](https://github.com/treatwell/twuitests).

## What was done in this example
1. Create a project.
2. Install Carthage.
3. Create Cartfile and add: `git "https://github.com/treatwell/twuitests.git”`
4. Run `carthage bootstrap --platform iOS`.
5. Add TWUITests framework to your UITests target:
  + Build settings: in Runpath Search Paths add `$(PROJECT_DIR)/Carthage/Build/iOS` to tell linker where to find frameworks.
  + Build phases: drag (from `Carthage/Build/iOS`) and drop TWUITests and Swifter frameworks into Link binaries and frameworks phase.
6. Add Xcode templates. Execute `sh add_ui_tests_templates.sh` (in "Xcode Templates" folder).
7. Create files and classes:
  + Create `Configuration` class to hold parameters and initial API stubs.
  + Create project specific parameters together with `ConfigurationKeys` to be injected into main app.
  + Create `AccessibilityIdentifiers.swift`.
8. Create API stubs: 
  + Create enum/struct `Stub.swift`. 
  + Add JSON mocks to `API-Mocks` folder. 
  + During build phase copy to working dir `LIBRARY_DIR + /Developer/CoreSimulator/Devices/+ DEVICE_ID + /data/Library/Caches/ApiStubs/`.
  + Set `NSAllowsLocalNetworking` to `true` (in App Transport Security Settings dictionary) in Info plist file. To allow loading of local resources without disabling ATS.
8. Add UITests scene (from template) to YourAppUITests. Add tests.
9. Run UITests.
10. Profit.
