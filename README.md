# CSE 4283 - Assignment 2

The purpose of the CSE4283Assignment2 commandline tool is to demonstrate the use of Test Driven Development (TDD).

## Requirements
This project requires the following tools.
- Xcode 12.0 or later
- MacOS 11.0 or later
- Swift 5.3

## Build Instructions

### Using Xcode IDE
1. Open the `CSE4283Assignment2.xcodeproj` file with Xcode.
2.  Ensure that the Scheme is set to `CSE4283Assignment2`.
3. Build (⌘B)  or Run (⌘R) the project by clicking the Play button on the top left corner of the Xcode window.

### Using Xcode Commandline Tool
1. Open the root project directory in Terminal
2. Run the following command to build the project
`xcodebuild build -scheme CSE4283Assignment2`

## Unit Test Instructions

### Using Xcode IDE
1. Open the `CSE4283Assignment2.xcodeproj` file with Xcode.
2.  Ensure that the Scheme is set to `CSE4283Assignment2`.
3. Click and hold the Play button located on the top left corner of the XCode window (or press ⌘U).
4. Upon hold, select **Test** to switch to the Test target.
5. Click the play button again to run all tests.

### Using Xcode Commandline Tool
1. Open the root project directory in Terminal
2. Run the following command to build the project
`xcodebuild test -scheme CSE4283Assignment2`

## Run Instructions

### Using Xcode IDE
1. Open the `CSE4283Assignment2.xcodeproj` file with Xcode.
2. Ensure that the Scheme is set to `CSE4283Assignment2`.
3. Run (⌘R) the project by clicking the Play button on the top left corner of the Xcode window.
4. Xcode will run the project in the Terminal window on the bottom righthand side of the IDE.

### Using Xcode Commandline Tool
1. Navigate to root project directory using Terminal
2. Run `xcodebuild -target CSE4283Assignment2`
3. Navigate to `/CSE4283Assignment2/build/Release` directory.
4. Run the Unix Executable File using the following command: `./CSE4283Assignment2`

## BMI Calculation Formula

An explanation for the formula used to determine the BMI with the Imperial system can be found [here](http://extoxnet.orst.edu/faqs/dietcancer/web2/twohowto.html).
