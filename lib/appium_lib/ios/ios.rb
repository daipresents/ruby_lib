# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative 'common/helper'
require_relative 'common/errors'

require_relative 'element/alert'
require_relative 'element/button'
require_relative 'element/generic'
require_relative 'element/textfield'
require_relative 'element/text'

require_relative 'xcuitest'

module Appium
  module Ios
    class Bridge
      def self.for(target)
        target.extend Appium::Ios
      end
    end
  end
end
