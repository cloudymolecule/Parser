class ApplicationController < ActionController::Base
    helper_method :parse_text

    def parse_text(string)

        def check_ip(ip)
            ip_valid = 0
            arr = ip.split('.')
            arr.each do |n|
                if n.to_i <= 255 && n.to_i >= 0
                    ip_valid = ip_valid +1 
                end
            end

            ip_valid == 4 ? true : false
        end
        
        logArr = string.split(' ')
        
        source_ip = ''
        dest_ip = ''
        source_ip_private = false
        dest_ip_private = false
        source_ip_valid = false
        dest_ip_valid = false

        logArr.each do |s|
            if s.match('dst') 
                dest_ip = s[4..-1]
                dest_ip_valid = check_ip(dest_ip)
            end
            if s.match('sourceTranslatedAddress') 
                source_ip = s[24..-1]
                source_ip_valid = check_ip(source_ip)
            end
            if s.match('dhost=DTM-AdluminMBP') 
                source_ip_private = true
            end
            if s.match('cs1=WCU-External-Inbound')
                dest_ip_private = true
            end
           
            
        end

        return {
            source_ip: source_ip, 
            dest_ip: dest_ip, 
            source_ip_private: source_ip_private, 
            dest_ip_private: dest_ip_private, 
            source_ip_valid: source_ip_valid, 
            dest_ip_valid: dest_ip_valid
        }
    end
end