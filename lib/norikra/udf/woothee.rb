require "norikra/udf/woothee/version"

require 'java'
require 'norikra/udf'

module Norikra
  module UDF
    # class style
    class WootheeParseAgent < Norikra::UDF::Base
      def self.init
        require 'woothee.jar'
        require 'norikra-udf-woothee.jar'
      end
      def function_name
        "parseAgent"
      end
      def class_name
        "is.tagomor.norikra.udf.Woothee"
      end
      def method_name # default: same as function_name
        "parseAgent"
      end
      # "definition" also available
    end

    # udf bundle module style
    module WootheeUDF
      def self.init
        require 'woothee.jar'
        require 'norikra-udf-woothee.jar'
      end

      def self.plugins
        [IsPC, IsSmartPhone, IsMobilePhone, IsAppliance, IsMisc, IsCrawler, IsUnknown, IsIn]
      end

      class IsPC < Norikra::UDF::Base
        def definition
          ["isPC", "is.tagomor.norikra.udf.Woothee", "isPC"]
        end
      end
      class IsSmartPhone < Norikra::UDF::Base
        def definition
          ["isSmartPhone", "is.tagomor.norikra.udf.Woothee", "isSmartPhone"]
        end
      end
      class IsMobilePhone < Norikra::UDF::Base
        def definition
          ["isMobilePhone", "is.tagomor.norikra.udf.Woothee", "isMobilePhone"]
        end
      end
      class IsAppliance < Norikra::UDF::Base
        def definition
          ["isAppliance", "is.tagomor.norikra.udf.Woothee", "isAppliance"]
        end
      end
      class IsMisc < Norikra::UDF::Base
        def definition
          ["isMisc", "is.tagomor.norikra.udf.Woothee", "isMisc"]
        end
      end
      class IsCrawler < Norikra::UDF::Base
        def definition
          ["isCrawler", "is.tagomor.norikra.udf.Woothee", "isCrawler"]
        end
      end
      class IsUnknown < Norikra::UDF::Base
        def definition
          ["isUnknown", "is.tagomor.norikra.udf.Woothee", "isUnknown"]
        end
      end
      class IsIn < Norikra::UDF::Base
        def definition
          ["isIn", "is.tagomor.norikra.udf.Woothee", "isIn"]
        end
      end
    end
  end
end
