print("\nUSING tests/tex/.latexmkrc\n\n");

$pdflatex = "xelatex --shell-escape --interaction=batchmode --halt-on-error %O %S";

add_cus_dep( "glo", "gls", 0, 'makeglossaries' );


sub makeglossaries {
    my ($stem, $path) = fileparse($_[0]);
    pushd $path;
    print("Latexmk running: `makeglossaries $stem`");
    my $success = system( "makeglossaries", $stem );
    popd;
    return $success;
}