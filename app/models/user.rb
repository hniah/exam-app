class User < ApplicationRecord
  extend Enumerize

  enumerize :type, in: ['Teacher', 'Student'], scope: true
end
