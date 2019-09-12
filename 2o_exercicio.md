## 2º Exercício

Aluno: João Pedro Valladão Pinheiro <br/>
Email: [jpinheiro@puc-rio.br](mailto:jpinheiro@puc-rio.br)

### Descrição:

Pesquisa sobre Sistemas Datalog existentes e disponíveis para uso e/ou teste. Pode ser web-based <br/>
ou com instalador para uso local. Resumir sobre o sistema, eventuais limites, como se faz para <br/>
usar, eventuais dicas de sintaxe e, se possível, mostrar como rodar uma consulta recursiva como a <br/>
do fecho transitivo.

### Resultados:

Foram encontrados **quatro** sistemas que abordam a linguagem Datalog de maneiras distintas. <br/>
São eles:

- [Datalog Educational System](http://des.sourceforge.net/index.html)
  - O Sistema Educacional de Datalog (DES) é um sistema de banco de dados com Datalog, SQL, <br/>
  Álgebra Relacional, Cálculo Relacional e Cálculo de Conjuntos como linguagens de consulta
  - Possui uma interface gráfica em Java Desktop
  - Última atualização: Jan 2019
  - Exemplos de sintaxe:
  
  ```datalog
    %
    % Family
    %
    % Datalog Formulation
    
    % Optionally declare types
    :-type(father(father:string,child:string)).
    father(tom,amy).
    father(jack,fred).
    father(tony,carolII).
    father(fred,carolIII).
    
    % Optionally declare types
    :-type(mother(mother:string,child:string)).
    mother(grace,amy).
    mother(amy,fred).
    mother(carolI,carolII).
    mother(carolII,carolIII).
    
    parent(X,Y) :- 
      father(X,Y)
      ; 
      mother(X,Y).
    % The above clause for parent is equivalent to:  
    % parent(X,Y) :- 
    %   father(X,Y).
    % parent(X,Y) :- 
    %   mother(X,Y).
    
    ancestor(X,Y) :- 
      parent(X,Y).
    ancestor(X,Y) :- 
      parent(X,Z), 
      ancestor(Z,Y).
  ```

- [AbcDatalog](http://abcdatalog.seas.harvard.edu/)
  - Trata-se de uma implementação da linguagem de programação em lógica Datalog em Java
  - Suporta funcionalidades como (des)-unificação explícita de termos e negação estratificada
  - Possui finalidade acadêmica e pedagógica, mantida pela Harvard University
  - Última atualização: 01 Fev 2019
  - Exemplos de sintaxe:

  ```java
    name(alice).
    name(bob).
    name(world).
    hello(X) :- name(X).
    /* ********** */
    hello(X)?
    /* ********** */
    hello(alice)
    hello(bob)
    hello(world)
  ```

- [pyDatalog](https://sites.google.com/site/pydatalog/home)
  - Caracteriza-se pela adição do paradigma de programação em lógica como extensão da linguagem  de <br/>
  programação Python
  - Última atualização: 24 Jan 2016
  - Exemplos de sintaxe:
  
  ```python
    from pyDatalog import pyDatalog
    pyDatalog.create_terms('X,Y,Z')
    # give me all the X so that X is in the range 0..4
    print(X.in_((0,1,2,3,4)))
    # here is the procedural equivalent
    for x in range(5):
    print(x)
  ```

- [Learn Datalog Today](http://www.learndatalogtoday.org/)
  - Trata-se de um tutorial interativo com o objetivo de ensinar um dialeto de Datalog feito para <br/>
  utilização do banco de dados [Datomic](https://www.datomic.com/)
  - Datomic é descrito como uma solução para nuvem AWS com características de um banco de dados <br/>
  transacional, com tipo de dados flexíveis, escalável e com queries enriquecidas
  - O dialeto de Datalog utiliza-se através linguagem de programação [Clojure](https://clojure.org/), <br/>
  a qual é compilada para Java bytecode e interpretada pela JVM
  - Última atualização: 18 Jun 2019
  - Exemplos de sintaxe:
  
  ```clojure
    ;; Retorna a quantidade de datoms relacionados ao artista/banda "The Beatles"
    ;; query
    [:find ?e
     :where [?e :artist/name "The Beatles"]]
    
    ;; args
    db
    
    ;; Example query using the clojure API
    (d/q '[:find ?e
          :where [?e :artist/name "The Beatles"]]
         db)
    
    ;; The previous example also works with datomic.client.api used for Datomic Cloud
    ;; Example query using the datomic.client.api arity-1
    
    (d/q {:query '[:find ?e
                   :where [?e :artist/name "The Beatles"]]
         :args [db]})
    
    ;; Result. Your exact value may differ.
    [[26757714973567138]]
  ```

### Referências:

1. Datalog Educational System: [http://des.sourceforge.net/index.html](http://des.sourceforge.net/index.html)
2. AbcDatalog: [http://abcdatalog.seas.harvard.edu/](http://abcdatalog.seas.harvard.edu/)
3. pyDatalog: [https://sites.google.com/site/pydatalog/home](https://sites.google.com/site/pydatalog/home)
4. Learn Datalog Today: [http://www.learndatalogtoday.org/](http://www.learndatalogtoday.org/)
