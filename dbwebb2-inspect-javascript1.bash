#---------------------- INSPECT JAVASCRIPT1 START -----------------------
#
# Test javascript1 me
#
javascript1me()
{
    headerForTest "-- me-page" "-- ${DBW_WWW}${DBw_COURSE}$KMOM#resultat_redovisning" 
    openFilesInEditor "me"
    checkKmomDir "me"
    printUrl "me.html" "me"  
    printUrl "redovisning.html" "me"
    pressEnterToContinue
}



#
# Test javascript1 sandbox
#
javascript1exercise()
{
    local lab="$1"
    local main="$2"
    local url="$3"
    local target="me/$KMOM/$lab"

    headerForTest "-- $lab" "-- ${DBW_WWW}$url"
    openFilesInEditor "$target"
    checkKmomDir "$target"
    fileIsReadable "$target/$main"
    printUrl "$main" "$target"  
    pressEnterToContinue
}



#
# Test javascript1 general
#
javascript1()
{
    local target="me/$KMOM"

    headerForTest "-- $DBW_COURSE $KMOM" "-- ${DBW_WWW}$DBW_COURSE/$KMOM"
    checkKmomDir "$target"
    publishKmom 
    validateKmom 
    javascript1me
}



#
# Test javascript1 kmom01
#
javascript1kmom01()
{
    javascript1exercise "sandbox" "index.html" "uppgift/skapa-din-egen-sandbox-for-javascript-testprogram"
}



#
# Test javascript1 kmom02
#
javascript1kmom02()
{
    javascript1exercise "lab1" "answer.html" "uppgift/javascript-med-variabler-loopar-och-inbyggda-funktioner"
    javascript1exercise "flag1" "index.html" "uppgift/gor-svenska-flaggan-i-html-och-css"
    javascript1exercise "baddie1" "index.html" "uppgift/flytta-runt-en-baddie-pa-webbsidan"
}



#
# Test javascript1 kmom03
#
javascript1kmom03()
{
    javascript1exercise "lab2" "answer.html" "uppgift/javascript-med-funktioner"
    javascript1exercise "flag2" "index.html" "uppgift/gor-svenska-flaggan-med-javascript-html-och-css"
    javascript1exercise "baddie2" "index.html" "uppgift/flytta-baddie-pa-webbsida-2"
}



#
# Test javascript1 kmom04
#
javascript1kmom04()
{
    javascript1exercise "lab3" "answer.html" "uppgift/javascript-och-arrayer"
    javascript1exercise "lab4" "index.html" "uppgift/javascript-och-objekt"
    javascript1exercise "flag3" "index.html" "uppgift/gor-svenska-flaggan-med-javascript-och-objekt"
    javascript1exercise "baddie3" "index.html" "uppgift/flytta-baddie-pa-webbsida-3"
}



#
# Test javascript1 kmom
#
javascript1kmom05()
{
    javascript1exercise "lab5" "answer.html" "uppgift/javascript-dom-och-events"
    javascript1exercise "flag4" "index.html" "uppgift/memory-rita-flaggor-med-javascript-och-dom"
}



#
# Test javascript1 kmom
#
javascript1kmom06()
{
    javascript1exercise "hangman" "index.html" "uppgift/hanga-gubben-som-modul-i-javascript"
}



#
# Test javascript1 kmom
#
javascript1kmom10()
{
    javascript1exercise "intelligence" "index.html" "javascript1/kmom10"
}



#---------------------- INSPECT JAVASCRIP1 END ----------------------------