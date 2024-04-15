Pod::Spec.new do |s|
  s.name             = 'TabBar'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BottomSheet.'
  s.dependency 'SnapKit', '~> 5.0.0'
  s.dependency 'CommonUI'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/naariman/BottomSheet'
  s.author           = { 'Nariman' => 'pticafugu@gmail.com' }
  s.source           = { :git => 'https://github.com/pticafugu/BottomSheet', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'

  s.source_files = ['TabBar/Classes/**/*.{h,m,swift,json,csv,strings,xib,storyboard, xcassets, xcdatamodeld}']
  
  s.resource_bundles = {
      'TabBar' => ['TabBar/**/*.{xcdatamodeld,csv}']
  }

  s.public_header_files = 'Pod/Classes/**/*.{h,swift}'  
  
end
