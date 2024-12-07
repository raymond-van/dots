# web_search from terminal

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    google          "https://www.google.com/search?q="
    brave           "https://search.brave.com/search?q="
    duckduckgo      "https://www.duckduckgo.com/?q="
    startpage       "https://www.startpage.com/do/search?q="
    github          "https://github.com/search?q="
    goodreads       "https://www.goodreads.com/search?q="
    qwant           "https://www.qwant.com/?q="
    givero          "https://www.givero.com/search?q="
    stackoverflow   "https://stackoverflow.com/search?q="
    wolframalpha    "https://www.wolframalpha.com/input/?i="
    archive         "https://web.archive.org/web/*/"
    scholar         "https://scholar.google.com/scholar?q="
    youtube         "https://www.youtube.com/results?search_query="
    deepl           "https://www.deepl.com/translator#auto/auto/"
    dockerhub       "https://hub.docker.com/search?q="
    chatgpt         "https://chatgpt.com/?q="
    claude          "https://claude.ai/chat/?q="
    gemini          "https://www.gemini.google.com/app/?q="
    reddit          "https://www.reddit.com/search/?q="
    stock           "https://ca.finance.yahoo.com/quote/"
    eth             "https://etherscan.io/address/"
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine '$1' not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # if search goes in the query string ==> space as +, otherwise %20
    # see https://stackoverflow.com/questions/1634271/url-encoding-the-space-character-or-20
    local param="-P"
    [[ "$urls[$1]" == *\?*= ]] && param=""

    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}$(omz_urlencode $param ${(s: :)@[2,-1]})"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}


alias sbra='web_search brave'
alias sgoog='web_search google'
alias sddg='web_search duckduckgo'
alias sp='web_search startpage'
alias sgh='web_search github'
alias sgood='web_search goodreads'
alias qwant='web_search qwant'
alias givero='web_search givero'
alias sstack='web_search stackoverflow'
alias swolf='web_search wolframalpha'
alias archive='web_search archive'
alias sschol='web_search scholar'
alias syou='web_search youtube'
alias sdeepl='web_search deepl'
alias sdock='web_search dockerhub'
alias sgpt='web_search chatgpt'
alias scla='web_search claude'
alias sgem='web_search gemini'
alias sred='web_search reddit'
alias sstock='web_search stock'
alias seth='web_search eth'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

# other search engine aliases
if [[ ${#ZSH_WEB_SEARCH_ENGINES} -gt 0 ]]; then
  typeset -A engines
  engines=($ZSH_WEB_SEARCH_ENGINES)
  for key in ${(k)engines}; do
    alias "$key"="web_search $key"
  done
  unset engines key
fi
