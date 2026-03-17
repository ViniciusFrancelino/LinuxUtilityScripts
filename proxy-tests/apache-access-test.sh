#!/bin/bash

# Lista de 50 sites HTTP
http_sites=(
    "http://example.com/"
    "http://httpbin.org/"
    "http://info.cern.ch/"
    "http://neverssl.com/"
    "http://gutenberg.org/"
    "http://archive.org/"
    "http://npr.org/"
    "http://bbc.co.uk/"
    "http://mirror.co.uk/"
    "http://thetimes.co.uk/"
    "http://thedailybeast.com/"
    "http://telegraph.co.uk/"
    "http://reuters.com/"
    "http://chicagotribune.com/"
    "http://latimes.com/"
    "http://nydailynews.com/"
    "http://boston.com/"
    "http://sfgate.com/"
    "http://oregonlive.com/"
    "http://startribune.com/"
    "http://nola.com/"
    "http://freep.com/"
    "http://cleveland.com/"
    "http://kansascity.com/"
    "http://chron.com/"
    "http://newsday.com/"
    "http://philly.com/"
    "http://post-gazette.com/"
    "http://seattletimes.com/"
    "http://newsobserver.com/"
    "http://tampabay.com/"
    "http://tulsaworld.com/"
    "http://sltrib.com/"
    "http://mysanantonio.com/"
    "http://pilotonline.com/"
    "http://ocregister.com/"
    "http://dispatch.com/"
    "http://palmbeachpost.com/"
    "http://indystar.com/"
    "http://desmoinesregister.com/"
    "http://commercialappeal.com/"
    "http://courier-journal.com/"
    "http://argusleader.com/"
    "http://thestate.com/"
    "http://fortworthbusiness.com/"
    "http://abqjournal.com/"
    "http://fresnobee.com/"
    "http://modbee.com/"
    "http://mercurynews.com/"
    "http://dallasnews.com/"
)

# Lista de 50 sites HTTPS
https_sites=(
"https://www.google.com:443/"
"https://www.youtube.com:443/"
"https://www.facebook.com:443/"
"https://www.amazon.com:443/"
"https://www.twitter.com:443/"
"https://www.instagram.com:443/"
"https://www.linkedin.com:443/"
"https://www.reddit.com:443/"
"https://www.netflix.com:443/"
"https://www.microsoft.com:443/"
"https://www.apple.com:443/"
"https://www.adobe.com:443/"
"https://www.spotify.com:443/"
"https://www.paypal.com:443/"
"https://www.dropbox.com:443/"
"https://www.ebay.com:443/"
"https://www.imdb.com:443/"
"https://www.nytimes.com:443/"
"https://www.bbc.com:443/"
"https://www.cnn.com:443/"
"https://www.foxnews.com:443/"
"https://www.forbes.com:443/"
"https://www.theguardian.com:443/"
"https://www.bloomberg.com:443/"
"https://www.wsj.com:443/"
"https://www.washingtonpost.com:443/"
"https://www.quora.com:443/"
"https://www.stackoverflow.com:443/"
"https://www.medium.com:443/"
"https://www.github.com:443/"
"https://www.gitlab.com:443/"
"https://www.stackexchange.com:443/"
"https://www.slack.com:443/"
"https://www.trello.com:443/"
"https://www.airbnb.com:443/"
"https://www.booking.com:443/"
"https://www.tripadvisor.com:443/"
"https://www.skyscanner.com:443/"
"https://www.kayak.com:443/"
"https://www.expedia.com:443/"
"https://www.uber.com:443/"
"https://www.lyft.com:443/"
"https://www.doordash.com:443/"
"https://www.grubhub.com:443/"
"https://www.skype.com:443/"
"https://www.whatsapp.com:443/"
"https://www.snapchat.com:443/"
"https://www.pinterest.com:443/"
"https://www.tumblr.com:443/"
)

# Duração total do teste em segundos (1 hora = 3600 segundos)
total_duration=$((60 * 60))

# Tempo de início do teste
start_time=$(date +%s)

# Loop até a duração total ser atingida
while [ $(($(date +%s) - $start_time)) -lt $total_duration ]; do
  for site in "${http_sites[@]}"; do
    echo "Testando site HTTP: $site"

    # Executa o ApacheBench
    ab -n 1000 -c 10 "$site"

    # Aguarde alguns segundos entre os testes para evitar sobrecarga (opcional)
    sleep 2
  done

  for site in "${https_sites[@]}"; do
    echo "Testando site HTTPS: $site"

    # Executa o ApacheBench
    ab -n 1000 -c 10 "$site"

    # Aguarde alguns segundos entre os testes para evitar sobrecarga (opcional)
    sleep 2
  done
done
