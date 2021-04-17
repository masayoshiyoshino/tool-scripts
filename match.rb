# file match checker
# usage : ruby match.rb file_path1 file_path2

class MatchText
  #const
  FILE_BASE = ARGV[0]
  FILE_CHECKER = ARGV[1]

  class Init
    def checkFile (file_name)
      # file check
      if !File.exist?(file_name)
        puts "no file exist: " + file_name
        exit(1)
      end
    end
  end

  class Match
    def runMatchChecker
      # get checker data from file
      checker_data = []
      File.open(FILE_CHECKER, "r") do |f|
        while line  = f.gets
          checker_data.push(line)
        end
      end

      # check base data included in checker data
      base_data = []
      File.open(FILE_BASE, "r") do |f|
        while line  = f.gets
          if checker_data.include?(line)
            puts line
          end
        end
      end
    end
  end

  # run main
  def main
    obj_init = Init.new
    obj_init.checkFile(FILE_BASE)
    obj_init.checkFile(FILE_CHECKER)
  
    obj_diff = Match.new
    obj_diff.runMatchChecker  
  end
end

obj_difftext = MatchText.new
obj_difftext.main