class ApplicationController < ActionController::Base
    helper_method :parse_text

    def home
    end

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

        return {source_ip: source_ip, dest_ip: dest_ip, source_ip_private: source_ip_private, dest_ip_private: dest_ip_private, source_ip_valid: source_ip_valid, dest_ip_valid: dest_ip_valid}
    end
end



# 1. As a user, I want to parse event logs by submitting them one-by-one through a form
# 2. As a user, I want to be able to see the following information about each event log:
# a. Source IP address
# b. Destination IP address
# 3. As a user, I want to be able to see all logs that have been parsed
# 4. As a user, I want to be able to delete logs that have been parsed

# Bonus Requirements
# 1. As a user, I want to be able to add one or more comments to each parsed event log
# 2. As a user, I want to be able to edit and delete comments for parsed event logs
# 3. As a user, I want to be able to see the following additional data for each parsed event log (you
# can display these additional data alongside the data displayed in Core Requirement 2)
# a. Source IP address is valid (true/ false)
# b. Source IP address is private (true/ false)
# c. Destination IP is valid (true/ false)
# d. Destination IP is private (true/ false)


# <37>CEF:0|TippingPoint|UnityOne|1.0.0.17|7610|Adlumin RepDV Manual Block|1|app=IP
# cnt=3 dst=52.10.98.6 dpt=443 act=Block cn1=0 cn1Label=VLAN ID cn2=33554431
# cn2Label=Taxonomy cn3=0 cn3Label=Packet Trace cs1=WCU-External-Outbound
# cs1Label=Profile Name cs2=6e664408-b90a-48e2-9a2d-c01cb9258381 cs2Label=Policy UUID
# cs3=00000001-0001-0001-0001-000000007610 cs3Label=Signature UUID cs4=1-1B 1-1A
# cs4Label=ZoneNames cs5=TipSMS cs5Label=SMS Name dvchost=PAS-TIP2600NX-01
# cs6=50.227.44.198 cs6Label=Filter Message Parms src=50.227.44.198 spt=10162
# externalId=19278229 rt=1539348361056 cat=Reputation proto=IP deviceInboundInterface=3
# c6a2= c6a2Label=Source IPv6 c6a3= c6a3Label=Destination IPv6 request= requestMethod=
# dhost= sourceTranslatedAddress=50.227.44.198 c6a1= c6a1Label=Client IPv6 suser=
# sntdom= duser= dntdom=