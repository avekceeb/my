
teardown() {
    echo "hello teardown"
}


trap teardown EXIT

timeout=15
pause=3

while ! ls . ; do
    echo "Waiting $pause sec... ($timeout seconds remaining)"
    sleep $pause
    ((timeout-=pause,timeout<=0)) && {
        echo "finished"
        exit 1
    }
done

exit 0

