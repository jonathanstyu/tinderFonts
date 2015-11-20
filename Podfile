# Uncomment this line to define a global platform for your project
# platform :ios, '6.0'
use_frameworks!

target 'tinderFonts' do
    pod 'Facade'
    pod 'Koloda'
    pod 'ChameleonFramework/Swift'
    pod 'FontBlaster'
end

target 'tinderFontsTests' do

end

post_install do |installer|
    `find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end