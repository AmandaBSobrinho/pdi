function [compress, dict] = huffman_encode(image)

    symbols= unique(double(image));% Distinct symbols that data source can produce
    counts = hist(image(:), symbols);%find counts of symblos in given data
    p = counts./ sum(counts);% Probability distribution
    dict = huffmandict(symbols,p); % Create dictionary.
    compress = huffmanenco(data,dict);% Encode the data.

end