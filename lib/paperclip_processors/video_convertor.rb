module Paperclip
  
  class VideoConvertor < Processor

    class Error < StandardError; end

    def self.load_config_files
      Dir.glob(File.join(Rails.root,'config','ffmpeg','*')).inject({}) do |hash, file_path|
        hash[File.basename(file_path).gsub(/\..*/,'').to_sym] =
          File.read(file_path).
            split(/\n/).
            reject {|line| line.match(/#/) or line.blank?}.
            collect{|prop| ' -'+ prop.gsub('=',' ') }.
            to_s
        hash
      end
    end

    CONFIG = load_config_files


    def command(input_path,output_path)
      "ffmpeg -i #{input_path} #{@options[:vopt]} #{CONFIG[@options[:vconfig].to_sym] if @options[:vconfig]} -y #{output_path}".gsub(/\s\s+/,' ')
    end
    
    def make
      #copié collé depuis les thumbs
      tmp_file = Tempfile.new([File.basename(@file.path, @options[:format]),@options[:format]].compact.join("."))
      tmp_file.binmode
        begin
#        SystemTimer.timeout_after(4) do

        #CONFIG = self.class.load_config_files
#        debugger

          output = `#{command @file.path, tmp_file.path }`
        output = `#{command @file.path, tmp_file.path } 2>&1`

          #cmd = "ffmpeg -i #{ @file.path } -acodec aac -ar 48000 -ab 128k -ac 2 -s 1024×768 -vcodec libx264 -b 1200k -flags +loop+mv4 -cmp 256 -partitions +parti4x4+partp8x8+partb8x8 -subq 7 -trellis 1 -refs 5 -coder 0 -me_range 16 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -bt 1200k -maxrate 1200k -bufsize 1200k -rc_eq 'blurCplx^(1-qComp)' -qcomp 0.6 -qmin 10 -qmax 51 -qdiff 4 -level 30 -aspect 16:9 -r 30 -g 90 -async 2 -y #{ tmp_file.path  }"
          #output = `#{cmd}`

#          unless output.split(/\n/).last.include?("video")
#            raise Error, "Echec de la convertion de #{@basename} en #{@options[:f]}"
#          end
#        end
      rescue Exception => e
        if e.is_a?(Timeout::Error)
          raise Error, "Conversion trop longue en #{@options[:format]}"
          #Il faudrait killer le process ffmpeg démmaré préalablement
          #`killall ffmpeg`
        else
          raise e
        end
      end
      tmp_file
    end
  end
end