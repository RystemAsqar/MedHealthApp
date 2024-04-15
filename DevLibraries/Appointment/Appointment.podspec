Pod::Spec.new do |s|
  s.name             = 'Appointment'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BottomSheet.'
  
  s.dependency 'Dashboard'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/RystemAsqar/MedHealthApp.git'
  s.author           = { 'Rustem' => 'bornqazaqi@gmail.com' }
  s.source           = { :git => 'https://github.com/RystemAsqar/MedHealthApp.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'

  s.source_files = ['Appointment/Classes/**/*.{h,m,swift,json,csv,strings,xib,storyboard, xcassets, xcdatamodeld}']
  
  s.resource_bundles = {
      'Appointment' => ['Appointment/**/*.{xcdatamodeld,csv}']
  }

  s.public_header_files = 'Pod/Classes/**/*.{h,swift}'  
  
end
