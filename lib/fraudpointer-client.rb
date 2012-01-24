require 'active_support'
require 'active_resource'

module Fraudpointer
  require "fraudpointer/client/version"
  require "fraudpointer/client/config"

  extend ActiveSupport::Autoload
  autoload :Resource
  autoload :AssessmentSession
end
