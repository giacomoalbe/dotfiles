" language_client.vim contains vim settings specific to the language
" client plugin

" language server commands
" \ 'rust': ['rustup', 'run', 'stable', 'rls'],
" \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
" \ 'cpp': ['clangd'],
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=~/.logs/cq.log'],
            \ 'c': ['cquery', '--log-file=~/.logs/cq.log'],
            \ 'python': ['/usr/local/bin/pyls', '--log-file', '~/.logs/pyls3.log', '-v'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ 'haskell': ['hie-wrapper', '--lsp']
            \ }

"\ 'php': ['php', '~/apps/php-language-server/vendor/bin/php-language-server.php'],
"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build'],
            \ 'haskell': ['stack.yaml', 'build'],
            \ }

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

"let g:LanguageClient_loadSettings = 1
"let g:LanguageClient_settingsPath = '/Users/aenayet/.config/nvim/settings.json'
