class StoreImageSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :category,:image, :date


    # DateTime.parse(place["Date"]).strftime('%b %d, %Y, %A | %I:%M:%S %p')


  # class name has to be same as model name
  # attributes :id, :first_name, :last_name, :category, :date, :created_at, :updated_at
end
