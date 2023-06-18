// Felipe da Silva Gangorra - 12111084 - UFCG


/* 
Cada nó possui um conjunto de nós para os quais ele tem uma aresta de saída
*/
sig Node {
	adj : set Node
}


/*
O grafo é não-direcionado, assim todas as arestas são simétricas
*/
pred undirected {
	all n1, n2: Node | n1.adj = n2.adj implies n2.adj = n1.adj
}


/*
O grafo é orientado, assim nenhuma aresta é simétrica
*/
pred oriented {
	all n1, n2: Node | n1.adj != n2.adj implies n2.adj != n1.adj 
}


/*
O grafo não contém ciclos
*/
pred acyclic {
	no n: Node | n in n.^adj
}


/*
O grafo é completo, com todos os nós conectados a todos os outros
*/
// n1 != n2 é para saber que estamos verificando diferentes
pred complete {
	all n1, n2: Node | n1 != n2 implies n2 in n1.adj 
}


/*
Nenhum nó possui aresta para ele mesmo
*/
pred noLoops {
	no n: Node | n in n.adj
}


/*
O grafo é fortemente conectado, a partir de qualquer nó pode se chegar a qualquer outro
*/
pred stronglyConnected {
	all n1, n2: Node | n1 in n2.^adj
}


/*
O grafo é transitivo, se dois nós são conectados através de um terceiro, os dois são ligados diretamente também
*/
pred transitive {
	all n1, n2, n3: Node | n1 in n2.adj and n2 in n3.adj implies n1 in n3.adj
}


/* crie fatos combinando alguns dos predicados */
fact {
    oriented // O grafo tem orientação
    complete // O grafo é completo
}

fact {
    noLoops // O grafo não possui arestas para si mesmo
    stronglyConnected // O grafo é fortemente conectado
}


/* para rodar o fato */

run {}

run undirected for 5

run oriented for 5

run acyclic for 5

run complete for 5

run noLoops for 5

run stronglyConnected for 5

run transitive for 5
