require 'upton'

url = 'http://www2.planalto.gov.br/acompanhe-o-planalto/discursos/discursos-da-presidenta'
path_css_link = 'h2.tileHeadline a.summary'
path_css_content = '#content-core #parent-fieldname-text'
params = '?b_start:int='
array_paginate = [*0..9].map { |number|  "#{params}#{number * 100}" }

array_paginate.each_with_index { |paginate, index|
    url_paginate = "#{url}#{paginate}"

    puts "Index: #{index}"
    puts "URL  : #{url_paginate}"

    scraper = Upton::Scraper.new(url_paginate, path_css_link)
    scraper.sleep_time_between_requests = 1

    scraper.scrape_to_csv "output-#{index}.csv" do |html|
        Nokogiri::HTML(html).search(path_css_content).map &:text
    end

    puts "Saved in file output-#{index}.csv"
    puts "######################################################################"
}


