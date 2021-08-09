# Ações semânticas na análise sintática

## Ações semânticas

- O analisador sintático é especificado por uma gramática livre de contexto.
- Os **símbolos gramaticais** tem um **atributo** associado (também chamado de **valor semântico**)
- Por exemplo, os tokens (**símbolos terminais**) para
  - *identificadores* têm como atributo o nome do identificador
  - *literais numéricos* têm como atributo o valor do literal
- Os **símbolos não terminais** (NT) também têm um atributo
  - calculado quando uma frase derivada do NT é encontrada e o NT é empilhado (ação de **redução**)
  - o atributo é calculado através da **ação semântica**
    - expressão em OCaml
    - é possível acessar o atributo dos símbolos que aparecem no lado direito da regra de produção
- Quando a linguagem é bem simples, é fácil implementar um **interpretador** direto nas ações semânticas
  
## Interpretador de straightline

- Atributo para os **comandos**:
  - tupla vazia (um comando não precisa de um atributo)
  - porém a ação semântica pode produzir o efeito esperado para o comando
- Atributo para as **expressões**:
  - valor da expressão
- Atributo para as **listas de expressões**:
  - lista dos valores das expressões
- Atributo para os **operadores**:
  - função de dois argumentos a ser usada para calcular o valor da operação
- Estude a implementação dada como exemplo.

## Construção da árvore sintática

- Definir os tipos de dados adequados para representação da árvore de sintaxe abstrata.
- Escrever as ações semânticas que constroem a árvore sintática para cada construção da linguagem, junto às regras de produção da gramática.
- O resultado do analisador sintático é a árvore sintática, que pode ser usada no restante do compilador.

## Anotação da localização

- É desejável reportar as localizações (incluindo por exemplo número de linha e coluna) onde as frases se encontram no programa fonte.
- Pode-se estender os tipos usados para representação das árvores sintáticas, incluindo esta informação.
- O analisador sintático oferece recursos para acessar a informação de localização quando uma frase é reconhecida.
