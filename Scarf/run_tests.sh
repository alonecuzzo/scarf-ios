xctool -workspace Scarf.xcworkspace \
       -scheme ScarfTests \
       -sdk iphonesimulator \
       clean build test \
       ONLY_ACTIVE_ARCH=NO
