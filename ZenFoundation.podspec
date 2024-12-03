Pod::Spec.new do |spec|
  spec.name             = 'ZenFoundation'
  spec.version          = '2.1.0'
  spec.swift_version    = '5.10'
  spec.summary          = 'ZenFoundation is a collection of extensions and functions for Foundation framework.'
  spec.description      = <<-DESC
ZenFoundation is a collection of convenient and concise extensions and functions for Foundation framework..
                       DESC
  spec.homepage         = 'https://github.com/roland19deschain/ZenFoundation'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Alexey Roik' => 'roland19deschain@gmail.com' }
  spec.source           = { :git => 'https://github.com/roland19deschain/ZenFoundation.git', :tag => spec.version }
  spec.requires_arc     = true
  spec.ios.deployment_target = '14.0'
  spec.osx.deployment_target = '10.15'
  spec.tvos.deployment_target = '15.0'
  spec.watchos.deployment_target = '6.0'
  spec.source_files     = 'Sources/**/*{swift}'
end
