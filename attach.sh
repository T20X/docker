if [ "$WINDIR" = "C:\WINDOWS" ]
then 
    winpty docker exec -it $1 bash
else
    docker exec -it $1 bash
fi
