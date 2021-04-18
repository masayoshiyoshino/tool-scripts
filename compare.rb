# compare file tool
# usage   : ruby compare.rb :file_path1 :file_path2 :mode(1:diff, 2:match)
# example : ruby compare.rb file_path1 file_path2 1

class CompareText
  #const
  FILE_BASE = ARGV[0]
  FILE_CHECKER = ARGV[1]
  COMPARE_MODE = ARGV[2]

  class Init
    def checkMode (mode)
      if !(mode == "1" || mode == "2")
        puts "not correct mode"
        exit(1)
      end
    end

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
      File.open(FILE_BASE, "r") do |f|
        while line  = f.gets
          if checker_data.include?(line)
            puts line
          end
        end
      end
    end
  end

  class Diff
    def runDiffChecker
      # get base data from file
      base_data = []
      File.open(FILE_BASE, "r") do |f|
        while line  = f.gets
          base_data.push(line)
        end
      end

      # check base data included in checker data
      File.open(FILE_CHECKER, "r") do |f|
        while line  = f.gets
          if !base_data.include?(line)
            puts line
          end
        end
      end
    end
  end

  # run main
  def main
    obj_init = Init.new
    obj_init.checkMode(COMPARE_MODE)
    obj_init.checkFile(FILE_BASE)
    obj_init.checkFile(FILE_CHECKER)
  
    if COMPARE_MODE == "1"
      obj_compare = Match.new
      obj_compare.runMatchChecker
    else
      obj_compare = Diff.new
      obj_compare.runDiffChecker
    end
  end
end

obj_comparetext = CompareText.new
obj_comparetext.main