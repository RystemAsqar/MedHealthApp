Pod::Spec.new do |s|
  s.name             = 'Other'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BottomSheet.'
  
  s.dependency 'Dashboard'
  s.dependency 'Appointment'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/RystemAsqar/MedHealthApp.git'
  s.author           = { 'Rustem' => 'bornqazaqi@gmail.com' }
  s.source           = { :git => 'https://github.com/RystemAsqar/MedHealthApp.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'

  s.source_files = ['Other/Classes/**/*.{h,m,swift,json,csv,strings,xib,storyboard, xcassets, xcdatamodeld}']
  
  s.resource_bundles = {
      'Other' => ['Other/**/*.{xcdatamodeld,csv}']
  }

  s.public_header_files = 'Pod/Classes/**/*.{h,swift}'  
  
end
