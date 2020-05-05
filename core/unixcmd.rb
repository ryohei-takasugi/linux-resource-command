# =====================
# 
# @os: CentOS Linux release 7.7.1908 (Core) 
# @ruby-version: ruby-2.7.1
# @version: 0.1
# 
# =====================

module LinuxCommand
  module CommonConvert
    def self.text_to_array(command)
      command_a = Array.new
      command.each_line.with_index { |line, index| command_a[index] = line.split(" ") }
      return command_a
    end

    def self.convert_by_type(key, value)
      tmp = Hash.new
      case value
      when /^[0-9]+$/
        tmp.store(key, value.to_i)
      when /^[0-9]+\%$/
        tmp.store(key, value.delete("%").to_i)
      else
        tmp.store(key, value)
      end
      return tmp
    end
  end

  class Free
    def get(opt = nil)
      if feasible?(opt)
        convert(CommonConvert::text_to_array(`free #{opt}`))
      else
        puts "error: This options cannot be used."
        puts "       -s N, --seconds N  repeat printing every N seconds"
        puts "       -c N, --count N    repeat printing N times, then exit"
        puts "       --version          output version information and exit"
        puts "       --help"
      end
    end

    def convert(free_a)
      result_h = Hash.new
      key = free_a.first
      key.each_with_index do |head, col|
        tmp = Hash.new
        free_a.each_with_index do |data, row|
          value = data[col + 1]
          tmp.update(CommonConvert::convert_by_type(data.first, value)) if target_line?(value, row)
        end
        result_h.store(head, tmp)
      end
      return result_h
    end

    def feasible?(opt)
      !(opt.include?("s") || opt.include?("c") || opt.include?("v") || opt.include?("help"))
    end

    def target_line?(value, index)
      value.nil? == false and index != 0
    end
  end

  class Df
    def get(opt = nil)
      convert(CommonConvert::text_to_array(`df #{opt}`))
    end

    def convert(df_a)
      result_h = Hash.new
      key = df_a.transpose.last[1..df_a.transpose.last.length]
      key.each_with_index do |head, col|
        tmp = Hash.new
        df_a.each.select{ |l| l.last == head }.flatten.each_with_index do |data, row|
          value = data
          tmp.update(CommonConvert::convert_by_type(df_a.first[row], data)) if target_line?(value)
        end
        result_h.store(head, tmp)
      end
      return result_h
    end

    def target_line?(value)
      value.nil? == false
    end
  end
end

