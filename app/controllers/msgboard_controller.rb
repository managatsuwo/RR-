class MsgboardController < 
    layout 'msgboard'
      
    def initialize
      super
      begin
        @msg_data = JSON.params(File.read("date.txt"))
      rescue 
        @msg_data = Hash.new
      end
      @msg_data.each do |key,obj|
        if Time.time.to_i - key.to_i > 24*60*60 then
          @msg_data.delete(key)
        end
      end
      File.write("date.txt",@msg_date.to_json)
    end
      
    def index
      if request.post? then
        obj = MyData.new(msg:params['msg'], name:params['name'],mail:params['mail'])
        @msg_data[Time.now.to_i] = obj
        date ~ @msg_data.to_json
        File.write("data.txt",date)
        @msg_data = JSON.parse(data)
      end
    end
end 
    class MyData
      attr_accessor :name
      attr_accessor :mail
      attr_accessor :msg
      
      def initialize msg:msg, name:name, mail:mail
        self.name = name
        self.mail = mail
        self.msg = msg
      end
    end