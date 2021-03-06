Pod::Spec.new do |spec|
    spec.name         = 'ZRAlertController'
    spec.version      = '2.3.1'
    spec.license      = "MIT"
    spec.homepage     = 'https://github.com/VictorZhang2014/ZRAlertController'
    spec.author       = { "Victor Zhang" => "victorzhangq@gmail.com" }
    spec.summary      = 'UIAlertController provides alert view functions.'
    spec.source       = { :git => 'https://github.com/VictorZhang2014/ZRAlertController.git', :tag => spec.version.to_s }
    spec.platform = :ios
    spec.source_files = 'Classes/ZRAlertController.{h,m}'
    spec.framework    = 'UIKit'
    spec.requires_arc = true
end
