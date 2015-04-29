require 'headquarters/api'

module Headquarters
  class Client < API
    namespace :members
    namespace :projects
    namespace :email
    namespace :github
  end
end

require 'headquarters/client/members'
require 'headquarters/client/projects'
require 'headquarters/client/email'
require 'headquarters/client/github'
