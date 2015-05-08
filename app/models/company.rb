class Company < ActiveRecord::Base

  mount_uploader :logo, LogoUploader

  validates :name, presence: true
  validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}, allow_nil: true
  validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}, allow_nil: true

  def self.coordinates
    where.not(latitude: nil, longitude: nil).map do |company|
      {
        latitude: company.latitude,
        longitude: company.longitude
      }
    end
  end

end
