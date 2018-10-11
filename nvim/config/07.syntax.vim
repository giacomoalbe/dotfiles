augroup filetype_syntax
    au!
    au FileType vue setlocal foldmethod=indent
    au FileType php setlocal foldmethod=indent
augroup END

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

augroup yml_folding
    au!
    au FileType yaml.docker-compose setlocal foldmethod=indent
augroup END
