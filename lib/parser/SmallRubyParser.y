class SR::Parser
    rule
        expList: exp 
            {result = [val[0]]}
            | expList ';' exp
            {result.push(val[2])}

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
        
        def: 'def' CONST expList 'end'
                    {result = [:def,[],val[1],[],val[2]]}
              | 'def' CONST args expList 'end'
                    {result = [:def,[],val[1],val[2],val[3]]}
              |'def' CONST '.' CONST expList 'end'
                    {result = [:def,val[1],val[3],[],val[4]]}
              | 'def' CONST '.' CONST args expList 'end'
                    {result = [:def,val[1],val[3],val[4],val[5]]}
        
        return: 'return' exp
            {result = [:return,val[1]]}
        
        send: exp '.' CONST
            { result = [:send,val[0],val[2],[]]}
            | exp '.' CONST block
            { result = [:send,val[0],val[2],[],val[3]]}
            | exp '.' CONST sendExpList
            { result = [:send,val[0],val[2],val[3]]} 
            | exp '.' CONST sendExpList block
            { result = [:send,val[0],val[2],val[3],val[4]]} 
            | exp '.' CONST '('')'
            { result = [:send,val[0],val[2],[]]}
            | exp '.' CONST '(' sendExpList ')'
            { result = [:send,val[0],val[2],val[4]]}
            | exp '.' CONST '('')' block
            { result = [:send,val[0],val[2],[],val[5]]}
            | exp '.' CONST '(' sendExpList ')'  block 
            { result = [:send,val[0],val[2],val[4],val[6]]}

         sendExpList: exp 
                {result = [val[0]]}
                | sendExpList ',' exp
                {result.push(val[2])}
        
        assign: CONST '=' exp
            {result = [:assign,val[0],val[2]]}
        
        block: 'do' expList 'end'
            {result = [:block,[],val[1]]}
            | 'do' args expList 'end'
            {result = [:block,val[1],val[2]]}

        while: 'while' '(' exp ')'  expList 'end'
            {result = [:while,val[2],val[4]]}
        
        exp: module
            | class
            | def 
            | send
            | number
            | string
            | CONST
            | assign
            | while
            | block
            | return
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
