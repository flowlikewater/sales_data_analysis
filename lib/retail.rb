require('pry')
require('csv')
transactions = CSV.read('TRANS.csv')


class String
  define_method(:totalKSH) do
    total_sales = 0
    total_location = {}
    CSV.foreach('TRANS.csv') do |row|
      if self.eql?(row[1])
        location = row[0]
        sales = row[2].sub(/ KSH$/,"").to_i
        total_sales += sales
        if !total_location[location]
          total_location[location] = sales
        else
          total_location[location] += sales
        end
      end
    end
    max = total_location.max_by{|key,value| value}[0]
    return {:total_KSH => total_sales, :largest => max}
  end
end
