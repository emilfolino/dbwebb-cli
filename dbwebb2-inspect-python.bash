#---------------------------- INSPECT PYTHON START ----------------------------
#
# Test python me
# TODO rearrange structure of me in js1 and remove this function
#
pythonme()
{
    headerForTest "-- me-page" "-- ${DBW_WWW}$DBW_COURSE/$KMOM#resultat_redovisning" 
    openFilesInEditor "me"
    checkKmomDir "me"

    printUrl "me.cgi" "me"  
    printUrl "redovisning.cgi" "me"
}



#
# Test python general
#
python()
{
    inspectIntro
}



#
# Test general, last in sequence
#
function pythonlast()
{
    pythonme
    #inspectMe "me" "me.cgi" "redovisning.cgi"
}



#
# Test python plane
#
pythonplane()
{
    local target="me/$KMOM/plane"
    local where="$EXEC_DIR/$KMOM/plane"
    
    headerForTest "-- plane" "-- ${DBW_WWW}uppgift/ditt-forsta-python-skript"
    openFilesInEditor "$target"
    checkKmomDir "$target"

    inspectCommand "plane.py" "$where" "python3 plane.py"
    inspectCommand "plane1.py" "$where" "python3 plane1.py"
    
    printUrl "plane1.cgi" "$target"  
}



#
# Test python marvin5
#
pythonmarvin5()
{
    local lab="$1"
    local main="$2"
    local url="$3"
    local target="me/$KMOM/$lab"
    local where="$EXEC_DIR/$KMOM/$lab"

    headerForTest "-- $lab" "-- ${DBW_WWW}$url"
    openFilesInEditor "$target"
    checkKmomDir "$target"

    # Exit status
    assertExit 0 "cd $where; python3 $main --version" "Should return exit status 0 but did not."
    assertExit 1 "cd $where; python3 $main --MISSINGOPTION" "Should return exit status 1 but did not."

    # General options
    opts="--help"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"

    opts="--version"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    # Ping
    opts="ping ${DBW_WWW}humans.txt"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    opts="ping-history"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"

    # Get
    opts="get ${DBW_WWW}humans.txt"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    opts="--output=humans.txt get ${DBW_WWW}humans.txt"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    assert 0 "test -f $where/humans.txt" "File humans.txt is missing."
    cat "$where/humans.txt"

    # Quote
    opts="quote"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"

    # <title>
    opts="title http://dbwebb.se"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"

    # seo
    opts="--json seo http://dbwebb.se"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
}



#
# Test python adventure
#
pythonAdventure()
{
    local lab="$1"
    local main="$2"
    local url="$3"
    local target="me/$KMOM/$lab"
    local where="$EXEC_DIR/$KMOM/$lab"

    headerForTest "-- $lab" "-- ${DBW_WWW}$url"
    openFilesInEditor "$target"
    checkKmomDir "$target"

    # Options
    opts="--help"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"

    opts="--version"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    opts="--info"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    opts="--about"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    opts="--cheat"
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
    
    # run it
    opts=""
    inspectCommand "$main" "$where" "python3 $main $opts" "$opts"
}



#
# Test python game
#
pythongame()
{
    local lab="$1"
    local main="$2"
    local url="$3"
    local target="me/$KMOM/$lab"

    headerForTest "-- $lab" "-- ${DBW_WWW}$url"
    openFilesInEditor "$target"
    checkKmomDir "$target"
    fileIsReadable "$target/$main"

    if [ -f "$THEDIR/$target/$main" ]; then
        printf "\nThe file $main is available, indicating this task is fulfilled."
        printf "\nYou need to execute '$main' outside of this script."
        printf "\ncd \"$EXEC_DIR/$KMOM/$lab\"; python3 $main"
        printf "\n"
    fi
}



#
# Test python lab & marvin
#
pythonexercise()
{
    local lab="$1"
    local main="$2"
    local url="$3"
    local target="me/$KMOM/$lab"

    headerForTest "-- $lab" "-- ${DBW_WWW}$url"
    openFilesInEditor "$target"
    checkKmomDir "$target"
    inspectCommand "$main" "$EXEC_DIR/$KMOM/$lab" "python3 $main"
}
    


#
# Test python kmom01
#
pythonkmom01()
{
    pythonplane "plane"
}



#
# Test python kmom02
#
pythonkmom02()
{
    pythonexercise "lab1" "answer.py" "uppgift/python-med-variabler-villkor-funktioner-och-loopar"
    pythonexercise "marvin1" "marvin.py" "uppgift/din-egen-chattbot-marvin-steg-1"
}



#
# Test python kmom03
#
pythonkmom03()
{
    pythonexercise "lab2" "answer.py" "uppgift/python-med-strangar-och-filer"
    pythonexercise "marvin2" "main.py" "uppgift/din-egen-chattbot-marvin-steg-2"
}



#
# Test python kmom04
#
pythonkmom04()
{
    pythonexercise "lab3" "answer.py" "uppgift/python-och-listor"
    pythonexercise "marvin3" "main.py" "uppgift/din-egen-chattbot-marvin-steg-3\n-- ${DBW_WWW}uppgift/din-egen-chattbot-marvin-inventarie"
    pythongame "game1" "border.py" "uppgift/ett-terminal-baserat-spel-i-python-steg1"
}


#
# Test python kmom05
#
pythonkmom05()
{
    pythonexercise "lab4" "answer.py" "uppgift/python-med-dictionaries-och-tupler"
    pythonexercise "marvin4" "main.py" "uppgift/din-egen-chattbot-marvin-steg-analysera-text-och-ord\n-- ${DBW_WWW}uppgift/din-egen-chattbot-marvin-tictactoe\n-- ${DBW_WWW}uppgift/din-egen-chattbot-marvin-steg-4"
    pythongame "game2" "retro.py" "uppgift/ett-terminal-baserat-spel-i-python-steg2"
}



#
# Test python kmom06
#
pythonkmom06()
{
    pythonmarvin5 "marvin5" "marvin-cli.py" "uppgift/din-egen-chattbot-marvin-steg-5"
}



#
# Test python kmom10
#
pythonkmom10()
{
    pythonAdventure "adventure" "adventure.py" "python/kmom10"
}



#---------------------------- INSPECT PYTHON END ----------------------------
