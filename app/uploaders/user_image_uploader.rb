class UserImageUploader < ImageUploader
  version :thumb do
    process resize_to_fill: [300, 300, Magick::CenterGravity]
  end
end
