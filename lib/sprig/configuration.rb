module Sprig
  class Configuration

    attr_writer :directory, :logger, :shared

    def directory
      Rails.root.join(@directory || default_directory, environment_directory)
    end

    def shared
      @shared ||= false
    end

    def logger
      @logger ||= Logger.new($stdout)
    end

    private

    def environment_directory
      shared ? '' : Rails.env
    end

    def default_directory
      'db/seeds'
    end
  end
end
