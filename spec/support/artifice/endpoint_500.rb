# frozen_string_literal: true

require File.expand_path("../../path.rb", __FILE__)
include Spec::Path

$LOAD_PATH.unshift(*Dir[Spec::Path.base_system_gems.join("gems/{rack,tilt,sinatra}-*/lib")].map(&:to_s))

require File.expand_path("../../artifice.rb", __FILE__)
require "sinatra/base"

Artifice.deactivate

class Endpoint500 < Sinatra::Base
  before do
    halt 500
  end
end

Artifice.activate_with(Endpoint500)
