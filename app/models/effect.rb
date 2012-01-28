class Effect < ActiveRecord::Base
  has_and_belongs_to_many :ingredients

  before_create :set_slug

  default_scope order(:name)

  alias :tooltip_records :ingredients

  def self.import
    transaction do
      html = Nokogiri::HTML(HTTParty.get 'http://www.uesp.net/wiki/Skyrim:Alchemy_Effects')
      effects = html.xpath('//table')[1].xpath('tr').inject([]) do |a, row|
        columns = row.xpath('th') + row.xpath('td')

        if columns.map(&:name).include?('td')
          a << {
            :name       => columns[0].try(:xpath, 'a').try(:text),
            :game_id    => columns[0].try(:xpath, 'small').try(:text).gsub(/\(|\)/, ''),
            :uesp_link  => 'http://www.uesp.net' + columns[0].try(:xpath, 'a').try(:attribute, 'href').try(:value),
            :base_value => columns[4].try(:text),
            :magnitude  => columns[3].try(:text),
          }
        end; a
      end

      effects.each { |effect| create(effect) }
    end
  end

  def to_param
    slug
  end

  private
    def set_slug
      self.slug = name.gsub("'", '').parameterize
    end
end
