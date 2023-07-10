# frozen_string_literal: true

#
# Add underscore method to String. Method borrowed from Rails
#
class String
  def underscore
    gsub('::', '/').
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z\d])([A-Z])/, '\1_\2').
      tr('-', '_').
      downcase
  end

  def downcase_first_letter
    self[0].downcase + self[1..-1]
  end
end
