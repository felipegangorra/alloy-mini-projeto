module computador_maria

/* O computador ideal para Maria tem que ser rápido, com boa memória e compacto.
Das quatro marcas que ela viu: Lenovo, Dell, Apple, Acer, apenas uma delas tem as 3 
características ao mesmo tempo 

Assumimos como verdade:
1. Apenas 3 são rápidos, apenas 2 tem boa memória, apenas um é compacto.
2. Todas quatro marcas possuem pelo menos uma das características
3. Lenovo e Dell têm a mesma capacidade de memória.
4. Dell e Apple são igualmente rápidos.
5. Apenas um entre Apple e Acer é considerado rápido.

Qual computador Maria deve comprar?
*/


pred ideal[c:Computador]{
	c in Rapido and c in BoaMemoria and c in Compacto
}

abstract sig Computador{}

one sig Lenovo,Dell,Apple,Acer extends Computador{}

sig Rapido,BoaMemoria,Compacto in Computador{}

fact {
	one c:Computador | ideal[c]
	
	#Rapido = 3 and #BoaMemoria=2 and #Compacto=1
	all c:Computador | c in Rapido or c in BoaMemoria or c in Rapido
	(Lenovo in BoaMemoria => Dell in BoaMemoria) and (Dell in BoaMemoria => Lenovo in BoaMemoria) 
	(Dell in Rapido => Apple in Rapido) and (Apple in Rapido=>Dell in Rapido)
	(Apple in Rapido and Acer not in Rapido) or (Acer in Rapido and Apple not in Rapido)
}

