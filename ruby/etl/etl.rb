#  ETL
class ETL
  def self.transform(old)
    old.each_with_object({}) do |(k, arr), acc|
      arr.each { |v| acc[v.downcase] = k }
    end
  end
end
