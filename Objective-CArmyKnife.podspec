Pod::Spec.new do |s|
  s.name         = "Objective-CArmyKnife"
  s.version      = "v0.4-animation.alpha.1"
  s.summary      = "收录oc常用工具方法，提高开发效率，避免重复造轮子，欢迎分享代码"
  s.homepage     = "http://github.com/Michael-Lfx/Objective-CArmyKnife"
  s.license      = "MIT"
  s.author       = { "Michael-LFX" => "cihv2@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Michael-Lfx/Objective-CArmyKnife.git", :tag => s.version.to_s }
  s.source_files = "Objective-CArmyKnife", "Objective-CArmyKnife/**/*.{h,m}"
  s.requires_arc = true

end
