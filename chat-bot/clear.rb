filename = "output"

array_files = [*0..9].map { |number|  "#{filename}-#{number}.csv" }

rules_regex = [/^Porto Velho-RO.+/, 
    /^"Palácio do Planalto.+/, 
    /^Palácio do Planalto.+/,
    /"Base Aérea de Brasília.+/,
    /^Ouça na íntegra.+/,
    /^Ouça a íntegra.+/,
    /^Confira a íntegra.+/,
    /^Ouça\ a\ íntegra.+/,
    /^\sOuça a íntegra.+/,
    /^\sOuça a.+/,
    /^\ Ouça\ a\ íntegra.+/,
    /Ouça\ a\ integra.+/,
    /^Francisco Beltrão-PR.+/,
    /^Angra dos Reis-RJ.+/,
    /^Montevidéu-Uruguai.+/,
    /^Palácio Itamaraty.+/,
    /^Brasília-DF.+/,
    /^"São Paulo-SP.+/,
    /^São Paulo-SP.+/,
    /^Rio de Janeiro-RJ.+/,
    /^"Rio de Janeiro-RJ.+/,
    /^\sAracaju-SE.+/,
    /^Salvador\-BA.+/,
    /^_________:.+/,
    /^­__________:.+/,
    /^____________:.+/,
    /^Manaus-AM.+/,
    /^Presidenta:/,
    /^\s\"\n\"\n\w.+/,
    /^\n\n.+/,
    /^\n\s"\n".+/,
    /^\s\"\n\".+/,
    /^\s\"\n\".+/,
    /^\s\"\n\"\n.+/,
    /^\s\s"\n".+/,
    /^\s\s\"\n\"\n.+/,
    /\s\n\w.*\n\s/,
    /\"\n\w.*\n\s/,
    /^\"\n\"\w.+/,
    /^\"\n\w{3}.+/,
    /^\"\s\n\w{3}.+\n\s/,
    /^\"\s\w{3}.+\n\s/,
    /^\n\"\w{3}.+\n\s/,
    /^\"\w{3}.+\n\s/,
    /^\"\w{3}.+\n/,
    /^\"\w.+/,
    /^\n\ \".+/,
    /^\".+/,
    /^\ \"/,
    /\n\s\"/,
    /\n\s\D/,
    /^\ ".+/,
    /\ "/,
    /^\d{2}\s[d][e]\s\w{2}.+/, # dates
    /^Pequim\-China.+/]



array_files.each { |file_name|
    text = File.read(file_name)
    new_content = text

    rules_regex.each { |rule|
        new_content = new_content.gsub(rule, '')
    }

    File.open(file_name, "w") { |file| 
        file.puts new_content 
    }
}