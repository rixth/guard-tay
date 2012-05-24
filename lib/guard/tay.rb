require 'guard'
require 'guard/guard'
require 'tay'
require 'tay/cli/helpers'

module Guard
  class Tay < Guard
    include ::Tay::CLI::Helpers

    def initialize(watchers = [], options = {})
      options = munge_options(options)
      super
    end

    ##
    # Run all simply recompiles all the things
    def run_all
      build_extension
    end

    ##
    # Recompile the current extension when a file is changed. If the Tayfile
    # was changed, validate it too.
    def run_on_change(paths)
      build_extension
    end

    ##
    # Recompile the current extension when a file is deleted
    def run_on_deletion(paths)
      build_extension
    end

    private

    def build_extension
      begin
        ::Tay::Builder.new(spec, base_dir, build_dir).build!
        UI.info "compiled #{spec.name} to #{build_dir}"
      rescue ::Tay::InvalidSpecification => e
        UI.error "invalid specification in #{tayfile_path.relative_path_from(Pathname.new(Dir.pwd))}: #{e}"
        false
      rescue Exception => e
        UI.error "compilation of #{spec.name} failed: #{e}"
        false
      end
    end

    ##
    # We're using Tay's CLI helpers and they expect string optiopns with
    # dashes, rather than symbols and underscores. So munge!
    def munge_options(options)
      keys_to_munge = [:build_directory, :tayfile]
      munged = {}
      options.keys.each do |key|
        if keys_to_munge.include?(key)
          new_key = key.to_s.gsub(/_/, '-')
        end
        munged[new_key || key] = options[key]
      end
      munged
    end
  end
end
