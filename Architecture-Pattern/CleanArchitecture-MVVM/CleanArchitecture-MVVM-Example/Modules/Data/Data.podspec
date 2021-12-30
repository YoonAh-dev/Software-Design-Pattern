
Pod::Spec.new do |s|
  s.name             = "Data"
  s.version          = "1.0.0"
  s.summary          = "Data Module"
  s.description      = <<-DESC
Data Module
                       DESC

  s.homepage         = "https://medium.com/p/c9d167d9f5b3"
  s.author           = { "Oleh Kudinov" => "kudoleh@hotmail.com.com" }
  s.source           = { :git => "https://github.com/kudoleh/iOS-Clean-Architecture-MVVM.git.git", :tag => "v#{s.version}" }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

  s.source_files = 'Data/**/*.{m,h,swift}'

  s.dependency 'Domain'
  s.dependency 'Networking'
  s.dependency 'Common'

end
