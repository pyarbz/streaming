module ApiHelper
  # 文字列が整数値か判定
  def self.integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end
end
