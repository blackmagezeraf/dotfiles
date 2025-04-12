using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'zola' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'zola'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'zola' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Directory to use as root of project')
            [CompletionResult]::new('--root', '--root', [CompletionResultType]::ParameterName, 'Directory to use as root of project')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Path to a config file other than config.toml in the root of project')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'Path to a config file other than config.toml in the root of project')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new Zola project')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Deletes the output directory if there is one and builds the site')
            [CompletionResult]::new('serve', 'serve', [CompletionResultType]::ParameterValue, 'Serve the site. Rebuild and reload on change automatically')
            [CompletionResult]::new('check', 'check', [CompletionResultType]::ParameterValue, 'Try to build the project without rendering it. Checks links')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Generate shell completion')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'zola;init' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force creation of project even if directory is non-empty')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force creation of project even if directory is non-empty')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'zola;build' {
            [CompletionResult]::new('-u', '-u', [CompletionResultType]::ParameterName, 'Force the base URL to be that value (defaults to the one in config.toml)')
            [CompletionResult]::new('--base-url', '--base-url', [CompletionResultType]::ParameterName, 'Force the base URL to be that value (defaults to the one in config.toml)')      
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Outputs the generated site in the given path (by default ''public'' dir in project root)')      
            [CompletionResult]::new('--output-dir', '--output-dir', [CompletionResultType]::ParameterName, 'Outputs the generated site in the given path (by default ''public'' dir in project root)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force building the site even if output directory is non-empty')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force building the site even if output directory is non-empty')
            [CompletionResult]::new('--drafts', '--drafts', [CompletionResultType]::ParameterName, 'Include drafts when loading the site')
            [CompletionResult]::new('--minify', '--minify', [CompletionResultType]::ParameterName, 'Minify generated HTML files')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'zola;serve' {
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Interface to bind on')
            [CompletionResult]::new('--interface', '--interface', [CompletionResultType]::ParameterName, 'Interface to bind on')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Which port to use')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Which port to use')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Outputs assets of the generated site in the given path (by default ''public'' dir in project root). HTML/XML will be stored in memory')
            [CompletionResult]::new('--output-dir', '--output-dir', [CompletionResultType]::ParameterName, 'Outputs assets of the generated site in the given path (by default ''public'' dir in project root). HTML/XML will be stored in memory')
            [CompletionResult]::new('-u', '-u', [CompletionResultType]::ParameterName, 'Changes the base_url')
            [CompletionResult]::new('--base-url', '--base-url', [CompletionResultType]::ParameterName, 'Changes the base_url')
            [CompletionResult]::new('--extra-watch-path', '--extra-watch-path', [CompletionResultType]::ParameterName, 'Extra path to watch for changes, relative to the project root') 
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force use of the directory for serving the site even if output directory is non-empty')
            [CompletionResult]::new('--drafts', '--drafts', [CompletionResultType]::ParameterName, 'Include drafts when loading the site')
            [CompletionResult]::new('-O', '-O ', [CompletionResultType]::ParameterName, 'Open site in the default browser')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open site in the default browser')
            [CompletionResult]::new('--store-html', '--store-html', [CompletionResultType]::ParameterName, 'Also store HTML in the public/ folder (by default HTML is only stored in-memory)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Only rebuild the minimum on change - useful when working on a specific page/section')
            [CompletionResult]::new('--fast', '--fast', [CompletionResultType]::ParameterName, 'Only rebuild the minimum on change - useful when working on a specific page/section')   
            [CompletionResult]::new('--no-port-append', '--no-port-append', [CompletionResultType]::ParameterName, 'Default append port to the base url')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'zola;check' {
            [CompletionResult]::new('--drafts', '--drafts', [CompletionResultType]::ParameterName, 'Include drafts when loading the site')
            [CompletionResult]::new('--skip-external-links', '--skip-external-links', [CompletionResultType]::ParameterName, 'Skip external links')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'zola;completion' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'zola;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Create a new Zola project')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Deletes the output directory if there is one and builds the site')
            [CompletionResult]::new('serve', 'serve', [CompletionResultType]::ParameterValue, 'Serve the site. Rebuild and reload on change automatically')
            [CompletionResult]::new('check', 'check', [CompletionResultType]::ParameterValue, 'Try to build the project without rendering it. Checks links')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Generate shell completion')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'zola;help;init' {
            break
        }
        'zola;help;build' {
            break
        }
        'zola;help;serve' {
            break
        }
        'zola;help;check' {
            break
        }
        'zola;help;completion' {
            break
        }
        'zola;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
