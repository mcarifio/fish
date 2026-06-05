function callable? -a cmd --description "is $cmd a command?"
    type --query $cmd
end