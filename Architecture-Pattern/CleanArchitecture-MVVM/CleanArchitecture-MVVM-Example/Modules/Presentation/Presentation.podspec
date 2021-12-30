
Pod::Spec.new do |s|
  s.name             = "Presentation"
  s.version          = "1.0.0"
  s.summary          = "Presentation Module"
  s.description      = <<-DESC
Presentation Module
                       DESC

  s.homepage         = "https://medium.com/p/c9d167d9f5b3"
  s.author           = { "Oleh Kudinov" => "kudoleh@hotmail.com.com" }
  s.source           = { :git => "https://github.com/kudoleh/iOS-Clean-Architecture-MVVM.git.git", :tag => "v#{s.version}" }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

  s.source_files = 'Presentation/**/*.{m,h,swift}'
  s.resources = "Presentation/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'PresentationTests/**/*.{m,h,swift}'
  end 

  s.dependency 'Domain'
  s.dependency 'Common'

end
