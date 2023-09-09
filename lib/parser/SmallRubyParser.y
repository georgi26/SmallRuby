class SR::Parser
    rule
        module: 'module' CONST  exp 'end' 
                    { result = [:module,val[1],val[2]]}
        class: 'class' CONST exp 'end' 
                    { result = [:class,val[1],val[2]]}
        string: STRING 
                {result = [:string,val[0]]}
        
        number: NUMBER
                {result = [:number,val[0]]}

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
        
        send: exp '.' CONST
            { result = [:send,val[0],val[2],[]]}
            | exp '.' CONST block
            { result = [:send,val[0],val[2],[],val[3]]}
            | exp '.' CONST '('')'
            { result = [:send,val[0],val[2],[]]}
            | exp '.' CONST '(' expList ')'
            { result = [:send,val[0],val[2],val[4]]}

         expList: exp 
                {result = [val[0]]}
                | expList ',' exp
                {result.push(val[2])}
        
        assign: CONST '=' exp
            {result = [:assign,val[0],val[2]]}
        
        block: 'do' exp 'end'
            {result = [:block,[],val[1]]}
            | 'do' args exp 'end'
            {result = [:block,val[1],val[2]]}

       
        
        exp: module
            | class
            | def 
            | send
            | number
            | string
            | CONST
            | assign
            | '(' exp ')'
             { result=val[1]}
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
