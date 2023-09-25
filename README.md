# Guesstheface

## Data
The data has been taken from https://github.com/giladmishne/face-nationality-dataset/tree/master and cleaned in the following ways:     
- soviet_union has been replaced with the current country of birth, in a few cases the person was born in one country but lived all their life in Russia and don't have the country of birth nationality. In this case Russia has been assigned
- same for yugoslavia, czechoslovakia, south_yemen and many others
- people's_republic_of_china has been shortened into china
- some people were born and linked their personal history to territories that have been assimilated to a recognized nation. As painful as it is, I decided to follow this in their nationality attribute
- various typos and use of adjectives instead of nouns have been fixed
- republic_of_china was changed into taiwan
- staffanstorp_municipality (?) was changed into sweden
- transnistria was changed into moldova
- Vít Jedlička nationality was changed from liberland to czech_republic
- kingdom_of_the_netherlands and kingdom_of_denmark have been turned into their short form
- Spock was removed from the list of people
- Twilight Sparkle was removed

For borders I followed this wikipedia page almost to a fault https://en.wikipedia.org/wiki/List_of_countries_and_territories_by_land_and_maritime_borders     
Exceptions:    
- Disputed territories have been attributed according to UN recognition, in some cases omitted (e.g. transnistria)
- arctic territories have been ignored
- some foreign territories have been ignored when not present in the people's list. Similarly when considering nation or extended borders, I preferred nation as it's the most common interpretation
- for some countries, symmetry did not apply due to the inconsistent distinction between naming the territory or the sovereign country (e.g. saint martin, france) or possible errors (libya borders turkey, but turkey does not border libya) and have been corrected
- bermuda does not border with any nation. Since we have a few bermuda nationals, I decided to include united_states_of_america as a border nation
