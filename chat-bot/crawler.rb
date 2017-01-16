require 'upton'

# scraper = Upton::Scraper.new("http://www2.planalto.gov.br/acompanhe-o-planalto/discursos/discursos-da-presidenta/discurso-da-presidenta-da-republica-dilma-rousseff-durante-cerimonia-de-posse-da-ministra-chefe-da-casa-civil-da-presidencia-da-republica-gleisi-hoffmann", "#content-core")
# scraper.scrape_to_csv "output.csv" do |html|
#   Nokogiri::HTML(html).search("#parent-fieldname-text").map &:text
# end

url = 'http://www2.planalto.gov.br/acompanhe-o-planalto/discursos/discursos-da-presidenta'
path_css_link = 'h2.tileHeadline a.summary'
path_css_content = '#content-core #parent-fieldname-text'
params = '?b_start:int='
array_paginate = [*0..9].map { |number|  "#{params}#{number * 100}" }

array_paginate.each_with_index { |paginate, index|
    puts index
    url_paginate = "#{url}#{paginate}"

    puts url_paginate

    scraper = Upton::Scraper.new(url_paginate, path_css_link)
    scraper.sleep_time_between_requests = 1

    scraper.scrape_to_csv "output-#{index}.csv" do |html|
        Nokogiri::HTML(html).search(path_css_content).map &:text
    end

    puts "Save in file output-#{index}.csv"
    puts "######################################################################"
}


