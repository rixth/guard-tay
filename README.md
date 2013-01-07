# Guard::Tay

Lets you configure a Guard that will run [Tay](https://github.com/rixth/tay) whenever a change is detected in your extension's source.

## Installation

Add `gem guard-tay` to your Gemfile and run `bundle install`

## Guardfile

You can adapt your Guardfiles like you want. Please read the [Guard docs](http://github.com/guard/guard) for more info about Guardfile DSL. Only two options are supported at this stage, `:build_directory` (the subdirectory to build to) and `:tayfile` (the name of the Tayfile you want to use). The defaults are shown below.

    guard :tay, :build_directory => 'build', :tayfile => 'Tayfile' do
      watch(%r{^Tayfile$})
      watch(%r{^lib/.+$})
      watch(%r{^src/.+$})
      watch(%r{^vendor/.+$})
      watch(%r{^browser_modules/.+$})
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
