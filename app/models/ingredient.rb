class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :effects

  def self.import
    transaction do
      html = Nokogiri::HTML(HTTParty.get 'http://www.uesp.net/wiki/Skyrim:Ingredients')
      ingredients = html.xpath('//table').first.xpath('tr').inject([]) do |a, row|
        columns = row.xpath('td')

        unless columns.empty?
          a << {
            :name       => columns[0].try(:text),
            :game_id    => columns[1].try(:text),
            :uesp_link  => 'http://www.uesp.net' + columns[0].try(:xpath, 'a').try(:attribute, 'href').try(:value),
            :base_value => columns[7].try(:text),
            :weight     => columns[6].try(:text),
            :effects    => columns[2,4].map(&:text)
          }
        end; a
      end

      ingredients.each do |ingredient|
        effects = ingredient.delete(:effects)
        record  = create(ingredient)

        effects.each do |effect|
          record.effects << Effect.find_by_name(effect)
        end
      end
    end
  end

end
