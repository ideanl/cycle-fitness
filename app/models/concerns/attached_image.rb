module AttachedImage
  extend ActiveSupport::Concern

  public
    def image_path
      "/files/#{self.class.to_s.downcase.pluralize}/#{self.id}.png"
    end

  private
    def write_image
      require 'RMagick'
      tmppath = "#{Rails.root}/public#{self.image_path}.temp"
      FileUtils.cp self.image.tempfile, tmppath
      tmpimage = Magick::Image.read(tmppath).first
      tmpimage.format = 'PNG'
      tmpimage.write("#{Rails.root}/public#{self.image_path}") {
        self.quality = 0 # Max compression
      }
      FileUtils.rm tmppath
    end

    def delete_image
      FileUtils.rm "#{Rails.root}/public#{self.image_path}"
    end

  included do
    validates :image, presence: true, on: :create
    attr_accessor :image
    after_save :write_image, unless: -> { self.image.blank? }
    after_destroy :delete_image
  end
end
