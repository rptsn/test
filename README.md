# august_test

Test build
-@Roberts-Mac-mini august_test % flutter build appbundle

💪 Building with sound null safety 💪

WARNING: [Processor] Library '/Users/-/.gradle/caches/modules-2/files-2.1/androidx.media2/media2-session/1.1.0-alpha01/cb362343364a365e7eba3f4476c8a9e04d413870/media2-session-1.1.0-alpha01.aar' contains references to both AndroidX and old support library. This seems like the library is partially migrated. Jetifier will try to rewrite the library anyway.
 Example of androidX reference: 'androidx/media2/session/MediaBrowser$Builder'
 Example of support library reference: 'android/support/v4/media/session/MediaSessionCompat$Token'
/Users/-/Developer/flutter/.pub-cache/hosted/pub.dartlang.org/audio_session-0.1.5/android/src/main/java/com/ryanheise/audio_session/AndroidAudioManager.java:42: error: cannot find symbol
        instance.add(this);                                             
        ^                                                               
  symbol:   variable instance                                           
  location: class AndroidAudioManager                                   
/Users/-/Developer/flutter/.pub-cache/hosted/pub.dartlang.org/audio_session-0.1.5/android/src/main/java/com/ryanheise/audio_session/AndroidAudioManager.java:287: error: cannot find symbol
            audioManager.registerAudioDeviceCallback((AudioDeviceCallback)audioDeviceCallback, handler);
                                                                                               ^
  symbol:   variable handler                                            
  location: class Singleton                                             
Note: /Users/r-n/Developer/flutter/.pub-cache/hosted/pub.dartlang.org/audio_session-0.1.5/android/src/main/java/com/ryanheise/audio_session/AndroidAudioManager.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.                      
2 errors                                                                
                                                                        
FAILURE: Build failed with an exception.                                
                                                                        
* What went wrong:                                                      
Execution failed for task ':audio_session:compileReleaseJavaWithJavac'. 
> Compilation failed; see the compiler error output for details.        
                                                                        
* Try:                                                                  
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.
                                                                        
* Get more help at https://help.gradle.org                              
                                                                        
BUILD FAILED in 50s                                                     
Running Gradle task 'bundleRelease'...                                  
Running Gradle task 'bundleRelease'... Done                        51.5s
The build failed likely due to AndroidX incompatibilities in a plugin. The tool is about to try using Jetifier to solve the
incompatibility.
✏️  Creating `android/settings_aar.gradle`...                        1ms
✓ `android/settings_aar.gradle` created successfully.
Building plugin audio_session...
Running Gradle task 'assembleAarRelease'...                             
Running Gradle task 'assembleAarRelease'... Done                    8.2s


FAILURE: Build failed with an exception.

* What went wrong:
Task 'assembleAarRelease' not found in root project 'audio_session'.

* Try:
Run gradlew tasks to get a list of available tasks. Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 7s


The plugin audio_session could not be built due to the issue above.
-@Roberts-Mac-mini august_test % 
