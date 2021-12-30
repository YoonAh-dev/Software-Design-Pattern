
Pod::Spec.new do |s|
  s.name             = "Domain"
  s.version          = "1.0.0"
  s.summary          = "Domain Module"
  s.description      = <<-DESC
Domain Module
                       DESC

  s.homepage         = "https://medium.com/p/c9d167d9f5b3"
  s.author           = { "Oleh Kudinov" => "kudoleh@hotmail.com.com" }
  s.source           = { :git => "https://github.com/kudoleh/iOS-Clean-Architecture-MVVM.git.git", :tag => "v#{s.version}" }

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

  s.source_files = 'Domain/**/*.{m,h,swift}'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'DomainTests/**/*.{m,h,swift}'
  end 
  s.dependency 'Common'

end
