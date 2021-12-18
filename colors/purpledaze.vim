" clear cache so this reloads changes.
" useful for development
" lua package.loaded['purpledaze'] = nil
" lua package.loaded['purpledaze.theme'] = nil
" lua package.loaded['purpledaze.colors'] = nil
" lua package.loaded['purpledaze.util'] = nil
lua package.loaded['purpledaze.config'] = nil

lua require('purpledaze').colorscheme()
