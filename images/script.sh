cxt ()
{
    [ $# -eq 0 ] && {
        echo "No namespace passed";
        return
    };
    alias kc="kubectl -n $1";
    alias helmc="helm -n $1"
}
alias code='git clone https://github.com/praveensams16/charts.git'
