class SR::Parser
    rule
        module: 'module' CONST  exp 'end' 
                    { result = [:module,val[1],val[2]]}
        class: 'class' CONST exp 'end' 
                    { result = [:class,val[1],val[2]]}
        args: '(' argsList ')'
                {result = val[1]}
                |'(' ')'
                {result = []}
        argsList: CONST 
                {result = [val[0]]}
                | argsList ',' CONST 
                {result.push(val[2])}
        def: 'def' CONST exp 'end'
                    {result = [:def,val[1],[],val[2]]}
              | 'def' CONST args exp 'end'
                    {result = [:def,val[1],val[2],val[3]]}
        send: CONST '.' CONST
            { result = [:send,val[0],val[2]]}
            |CONST '.' CONST '('')'
            { result = [:send,val[0],val[2]]}
        assign: CONST '=' exp
            {result = [:assign,val[0],val[2]]}

        exp: module
            | class
            | def 
            | send
            | NUMBER
            | STRING
            |
            {result = []}
             
---- header 
#
---- inner 
    def parse(tokens)
        @tokens = tokens
        do_parse
    end

    def next_token
        @tokens.shift
    end
---- footer 
#
