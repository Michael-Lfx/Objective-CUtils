Pod::Spec.new do |s|
  s.name     = 'Objective-C Army Knife'
  s.version  = '0.1'
  s.author   =  { 'Michael-lfx' => 'cihv2@163.com' }
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/Michael-Lfx/Objective-CArmyKnife'
  s.summary  = '收录oc常用工具方法，提高开发效率，避免重复造轮子，欢迎分享代码'
  s.source   = { :git => '收集oc常用工具方法，提高开发效率，避免重复造轮子，欢迎分享代码.git', :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files = 'Objective-CArmyKnife/*.{h,m}'

  s.ios.deployment_target = '7.0'
end
