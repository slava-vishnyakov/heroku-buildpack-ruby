#module LanguagePack::Test::Ruby
class LanguagePack::Ruby
  def compile
    instrument 'ruby.test.compile' do
      new_app?
      Dir.chdir(build_path)
      remove_vendor_bundle
      install_ruby
      install_jvm
      setup_language_pack_environment
      setup_profiled
      allow_git do
        install_bundler_in_app
        build_bundler("development")
        post_bundler
        create_database_yml
        install_binaries
      end
      super
    end
  end
end
