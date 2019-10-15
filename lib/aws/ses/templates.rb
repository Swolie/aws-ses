module AWS
  module SES
    # AWS::SES::Addresses provides for:
    # * Listing verified e-mail addresses
    # * Adding new e-mail addresses to verify
    # * Deleting verified e-mail addresses
    #
    # You can access these methods as follows:
    #
    #   ses = AWS::SES::Base.new( ... connection info ... )
    #
    #   # Get a list of verified addresses
    #   ses.addresses.list.result
    #
    #   # Add a new e-mail address to verify
    #   ses.addresses.verify('jon@example.com')
    #
    #   # Delete an e-mail address
    #   ses.addresses.delete('jon@example.com')
    class Templates < Base
      def initialize(ses)
        @ses = ses
      end

      # List all verified e-mail addresses
      # 
      # Usage:
      # ses.addresses.list.result
      # =>
      # ['email1@example.com', email2@example.com']
      def list
        raise 'h'
        @ses.request('ListVerifiedEmailAddresses')
      end
      
      def verify(email)
        @ses.request('VerifyEmailAddress',
          'EmailAddress' => email
        )
      end
      
      def delete(email)
        @ses.request('DeleteVerifiedEmailAddress',
          'EmailAddress' => email
        )
      end
    end
    
   
    
    class Base
      def templates
        @templates ||= Templates.new(self)
      end
    end
    
  end
end