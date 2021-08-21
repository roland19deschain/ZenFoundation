Pod::Spec.new do |s|
  s.name             = 'ZenFoundation'
  s.version          = '1.3.0'
  s.swift_version    = '5.0'
  s.summary          = 'ZenFoundation is a collection of extensions and functions for Foundation framework.'
  s.description      = <<-DESC
ZenFoundation is a collection of convenient and concise extensions and functions for Foundation framework..
                       DESC
  s.homepage         = 'https://github.com/roland19deschain/ZenFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexey Roik' => 'roland19deschain@gmail.com' }
  s.source           = { :git => 'https://github.com/roland19deschain/ZenFoundation.git', :tag => s.version }
  s.requires_arc     = true
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '2.0'
  s.source_files     = 'ZenFoundation/**/*{swift}'
end
